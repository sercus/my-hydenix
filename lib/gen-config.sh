#!/usr/bin/env bash
set -e

# Check if the skip flag is provided
SKIP_CHECKS=false
if [ "$1" = "--skip-checks" ]; then
  SKIP_CHECKS=true
fi

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

CONFIG_FILE="./config.nix"

if [ "$SKIP_CHECKS" = false ] && [ -f "$CONFIG_FILE" ]; then
  echo "A config.nix file already exists at $CONFIG_FILE"
  read -p "Do you want to use the existing config? (y/n) " USE_EXISTING
  if [[ $USE_EXISTING =~ ^[Yy]$ ]]; then
    echo "Using existing config file."
    exit 0
  fi
fi

if [ "$SKIP_CHECKS" = false ]; then
  echo "This script will generate a new config.nix file."
  read -p "Do you want to proceed? (y/n) " REPLY
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Config generation cancelled."
    exit 0
  fi
fi

cat <<EOF >"$CONFIG_FILE"
{
  username = "$(whoami || echo "hydenix")";
  gitUser = "$(git config --get user.name || echo "hydenix")";
  gitEmail = "$(git config --get user.email || echo "exampleEmail")";
  host = "$(hostname || echo "hydenix")";
  /*
    Default password is required for sudo support in systems
    !REMEMBER TO USE passwd TO CHANGE THE PASSWORD!
  */
  defaultPassword = "hydenix";
  timezone = "America/Vancouver";
  locale = "en_CA.UTF-8";

  # hardware config - sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
  hardwareConfig = (toString ./hardware-configuration.nix);

  # List of drivers to install in ./hosts/nixos/drivers.nix
  drivers = [
    "amdgpu"
    "intel"
    # "nvidia"
    # "amdcpu"
    # "intel-old"
  ];

  /*
    These will be imported after the default modules and override/merge any conflicting options
    !Its very possible to break hydenix by overriding options
    eg:
      # lets say hydenix has a default of:
      {
        services.openssh.enable = true;
        environment.systemPackages = [ pkgs.vim ];
      }
      # your module
      {
        services.openssh.enable = false;  #? This wins by default (last definition)
        environment.systemPackages = [ pkgs.git ];  #? This gets merged with hydenix
      }
  */
  # List of nix modules to import in ./hosts/nixos/default.nix
  nixModules = [
    # (toString ./my-module.nix)
    # in my-module.nix you can reference this userConfig
    # ({ userConfig, pkgs, ... }: {
    #   environment.systemPackages = [ pkgs.git ];
    # })
  ];
  # List of nix modules to import in ./lib/mkConfig.nix
  homeModules = [
    # (toString ./my-module.nix)
  ];

  hyde = rec {
    sddmTheme = "Candy"; # or "Corners"

    enable = true;

    # wallbash config, sets extensions as active
    wallbash = {
      vscode = true;
    };

    # active theme, must be in themes list
    activeTheme = "Catppuccin Mocha";

    # list of themes to choose from
    themes = [
      # -- Default themes
      "Catppuccin Latte"
      "Catppuccin Mocha"
      "Decay Green"
      "Edge Runner"
      "Frosted Glass"
      "Graphite Mono"
      "Gruvbox Retro"
      "Material Sakura"
      "Nordic Blue"
      "Rose Pine"
      "Synth Wave"
      "Tokyo Night"

      # -- Themes from hyde-gallery
      "Abyssal-Wave"
      "AbyssGreen"
      "Bad Blood"
      "Cat Latte"
      "Crimson Blade"
      "Dracula"
      "Edge Runner"
      "Green Lush"
      "Greenify"
      "Hack the Box"
      "Ice Age"
      "Mac OS"
      "Monokai"
      "Monterey Frost"
      "One Dark"
      "Oxo Carbon"
      "Paranoid Sweet"
      "Pixel Dream"
      "Rain Dark"
      "Red Stone"
      "Rose Pine"
      "Scarlet Night"
      "Sci-fi"
      "Solarized Dark"
      "Vanta Black"
      "Windows 11"
    ];

    # Exactly the same as hyde.conf
    conf = {
      hydeTheme = activeTheme;
      wallFramerate = 144;
      wallTransDuration = 0.4;
      wallAddCustomPath = "";
      enableWallDcol = 2;
      wallbashCustomCurve = "";
      skip_wallbash = [ ];
      themeSelect = 2;
      rofiStyle = 11;
      rofiScale = 9;
      wlogoutStyle = 1;
    };
  };

  vm = {
    # 4 GB minimum
    memorySize = 4096;
    # 2 cores minimum
    cores = 2;
    # 30GB minimum for one theme - 50GB for multiple themes - more for development and testing
    diskSize = 20000;
  };
}

EOF

echo "Config file generated at $CONFIG_FILE"

if [ "$SKIP_CHECKS" = false ]; then
  if [ -n "$EDITOR" ]; then
    $EDITOR "$CONFIG_FILE"
  elif command -v nano >/dev/null 2>&1; then
    nano "$CONFIG_FILE"
  elif command -v vim >/dev/null 2>&1; then
    vim "$CONFIG_FILE"
  else
    echo "No suitable editor found. Please open $CONFIG_FILE manually to edit."
  fi
else
  echo "Skipping editor opening due to --skip-checks flag."
fi
