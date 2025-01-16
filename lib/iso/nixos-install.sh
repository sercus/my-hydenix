#!/usr/bin/env bash

set -euo pipefail

cat <<"EOF"
  _    _           _            _
 | |  | |         | |          (_)
 | |__| |_   _  __| | ___ _ __  ___  __
 |  __  | | | |/ _` |/ _ \ '_ \| \ \/ /
 | |  | | |_| | (_| |  __/ | | | |>  <
 |_|  |_|\__, |\__,_|\___|_| |_|_/_/\_\
          __/ |
         |___/       ❄️ Powered by Nix ❄️
EOF

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
  echo -e "${RED}Please run as root${NC}"
  exit 1
fi

# Check for required commands
check_requirements() {
  local required_commands=("wipefs" "parted" "mkfs.fat" "mkfs.ext4" "lsblk" "fzf")
  local missing_commands=()

  for cmd in "${required_commands[@]}"; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
      missing_commands+=("$cmd")
    fi
  done

  if [ ${#missing_commands[@]} -ne 0 ]; then
    echo -e "${RED}Error: Required commands not found: ${missing_commands[*]}${NC}"
    exit 1
  fi
}

# Calculate swap size based on RAM
get_swap_size() {
  local mem_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
  local mem_gb=$((mem_kb / 1024 / 1024))
  
  if [ $mem_gb -le 2 ]; then
    echo $((mem_gb * 2))
  elif [ $mem_gb -le 8 ]; then
    echo $mem_gb
  else
    echo 8
  fi
}

# Select installation drive
select_drive() {
  # Check if any block devices exist
  if ! lsblk -d -p -n -l -o NAME,SIZE,MODEL > /dev/null 2>&1; then
    echo -e "${RED}Error: Unable to list block devices. Are you running in a virtual environment?${NC}"
    echo -e "${RED}Debug info:${NC}"
    ls -l /dev/sd* /dev/nvme* /dev/vd* 2>&1 || true
    echo
    exit 1
  fi
  
  local drives=$(lsblk -d -p -n -l -o NAME,SIZE,MODEL | grep -v "loop")
  if [ -z "$drives" ]; then
    echo -e "${RED}Error: No valid drives found${NC}"
    exit 1
  fi

  # Quote the selection to handle whitespace properly
  local selection
  selection=$(echo "$drives" | fzf --header "Select installation drive" --height=10)
  if [ -z "$selection" ]; then
    echo -e "${RED}No drive selected${NC}"
    exit 1
  fi
  # Extract just the device path and ensure it's trimmed
  echo "$selection" | awk '{print $1}' | tr -d '[:space:]'
}

# Detect boot mode
detect_boot_mode() {
  if [ -d "/sys/firmware/efi" ]; then
    echo "uefi"
  else
    echo -e "${RED}Warning: UEFI boot mode not detected. NixOS strongly recommends UEFI boot.${NC}"
    read -p "Continue with legacy BIOS boot anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      exit 1
    fi
    echo "bios"
  fi
}

# Main installation function
main() {
  # Check requirements first
  check_requirements
  
  # Select drive

  local selected_drive
  selected_drive="$(select_drive)"
  if [ ! -b "$selected_drive" ]; then
    echo -e "${RED}Error: Invalid drive selected: $selected_drive${NC}"
    exit 1
  fi
  echo -e "${GREEN}Selected drive: $selected_drive${NC}"

  # Confirm selection
  read -p "This will ERASE ALL DATA on $selected_drive. Continue? (y/N) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi

  # Detect boot mode
  local boot_mode
  boot_mode=$(detect_boot_mode)
  echo -e "${BLUE}Detected boot mode: $boot_mode${NC}"

  # Calculate sizes
  local swap_size
  swap_size=$(get_swap_size)
  echo -e "${BLUE}Calculated swap size: ${swap_size}GB${NC}"

  # Wipe existing signatures
   wipefs -a "$selected_drive"

  # Partition drive
  if [ "$boot_mode" = "uefi" ]; then
    # GPT/UEFI partitioning (preferred)
     parted "$selected_drive" -- mklabel gpt
     parted "$selected_drive" -- mkpart ESP fat32 1MiB 512MiB
     parted "$selected_drive" -- set 1 esp on
     parted "$selected_drive" -- mkpart primary 512MiB 100%
  else
    # MBR/BIOS partitioning (fallback)
    echo -e "${RED}Warning: Using legacy BIOS boot mode. Some NixOS features may not work correctly.${NC}"
     parted "$selected_drive" -- mklabel msdos
     parted "$selected_drive" -- mkpart primary 1MiB 512MiB
     parted "$selected_drive" -- set 1 boot on
     parted "$selected_drive" -- mkpart primary 512MiB 100%
  fi

  # Format partitions
  local boot_partition="${selected_drive}1"
  local root_partition="${selected_drive}2"

   mkfs.fat -F 32 -n NIXBOOT "$boot_partition"
   mkfs.ext4 -L NIXROOT "$root_partition"

  # Mount partitions
  if [ -e "/dev/disk/by-label/NIXROOT" ] && [ -e "/dev/disk/by-label/NIXBOOT" ]; then
    # Try mounting by labels first
    mount /dev/disk/by-label/NIXROOT /mnt
    mkdir -p /mnt/boot
    mount /dev/disk/by-label/NIXBOOT /mnt/boot
  else
    # Fall back to direct device mounting
    echo -e "${BLUE}Waiting for partition labels to be available...${NC}"
    sleep 2  # Give udev a moment to create the labels
    
    # Try one more time with labels
    if [ -e "/dev/disk/by-label/NIXROOT" ] && [ -e "/dev/disk/by-label/NIXBOOT" ]; then
      mount /dev/disk/by-label/NIXROOT /mnt
      mkdir -p /mnt/boot
      mount /dev/disk/by-label/NIXBOOT /mnt/boot
    else
      # Fall back to direct device mounting
      echo -e "${BLUE}Mounting partitions directly by device...${NC}"
      mount "$root_partition" /mnt
      mkdir -p /mnt/boot
      mount "$boot_partition" /mnt/boot
    fi
  fi

  # Create and enable swap file
  dd if=/dev/zero of=/mnt/.swapfile bs=1G count=$swap_size status=progress
  chmod 600 /mnt/.swapfile
  mkswap /mnt/.swapfile
  swapon /mnt/.swapfile

  # Generate NixOS config
  nixos-generate-config --root /mnt

  echo -e "${GREEN}Basic system configuration complete!${NC}"
  echo -e "${BLUE}Next steps:${NC}"
  echo "1. Edit /mnt/etc/nixos/configuration.nix"
  echo "2. Run nixos-install"
  echo "3. Set root password"
  echo "4. Reboot"
}

main "$@"