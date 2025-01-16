{ pkgs, ... }:

let
  # https://github.com/prasanthrangan/hyprdots/commit/2a0abfd56ce951e75213a1a91e2743a859304713
  hyprdotsRepo = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyprdots";
    rev = "204edc16847f8a67dd32a2b37c6139af88f5228a";
    sha256 = "sha256-ApdCWMWp/6vM4jE/AKzGQYyVzLzBSGjXWLdXZWUeo5o=";
  };

  # polkitkdeauth = ''
  #   #! /usr/bin/env bash
  #   ~/.local/state/nix/profiles/home-manager/home-path/libexec/polkit-gnome-authentication-agent-1 &
  # '';

  # TODO: add polkitkdeauth when i get spicetify working
  pkg = pkgs.stdenv.mkDerivation rec {
    name = "hyprdots-modified";
    src = hyprdotsRepo;

    buildPhase = ''
      # ensure all shell scripts use env bash shebang, preserving other interpreters
      find . -type f -executable -print0 | xargs -0 -I {} sh -c '
        if head -n1 "{}" | grep -q "^#!.*sh" ; then
          sed -i "1s|^#!.*|#!/usr/bin/env bash|" "{}"
        fi'

      # Update waybar killall command in all hyprdots files
      find . -type f -print0 | xargs -0 sed -i 's/killall waybar/killall .waybar-wrapped/g'

      # update dunst
      find . -type f -print0 | xargs -0 sed -i 's/killall dunst/killall .dunst-wrapped/g'

      # update kitty
      find . -type f -print0 | xargs -0 sed -i 's/killall kitty/killall .kitty-wrapped/g'

      find . -type f -executable -print0 | xargs -0 sed -i 's/find "/find -L "/g'
      find . -type f -name "*.sh" -print0 | xargs -0 sed -i 's/find "/find -L "/g'

      # needed for themeswitch to be able to be run on activationScripts
      sed -i '71s/^/#/' ./Configs/.local/share/bin/themeswitch.sh 

      # add `hyprctl reload` to themeswitch.sh only if Hyprland is running
      sed -i '/^hyprctl reload/d' ./Configs/.local/share/bin/themeswitch.sh
      echo 'if [[ -n $HYPRLAND_INSTANCE_SIGNATURE ]]; then' >> ./Configs/.local/share/bin/themeswitch.sh
      echo '    hyprctl reload' >> ./Configs/.local/share/bin/themeswitch.sh
      echo 'fi' >> ./Configs/.local/share/bin/themeswitch.sh

      # update theme directory check in scripts with home-manager case
      find . -type f \( -name "*.sh" -o -executable \) -exec sed -i '/^if \[ -d \/run\/current-system\/sw\/share\/themes/,/else/c\if [ -d /run/current-system/sw/share/themes ] ; then\n    themeDir=/run/current-system/sw/share/themes\nelif [ -d ~/.local/state/nix/profiles/home-manager/home-path/share/themes ] ; then\n    themeDir=~/.local/state/nix/profiles/home-manager/home-path/share/themes\nelse' {} \;

       # add nix check to globalcontrol.sh pkg_installed
        sed -i '/command -v "''${pkgIn}" /i\    elif command -v nix \&> /dev/null \&\& nix-locate --whole-name --top-level "bin/''${pkgIn}" \&> /dev/null ; then\n        return 0' ./Configs/.local/share/bin/globalcontrol.sh
        
    '';

    passthru = {
      inherit src;
    };

    installPhase = ''
      mkdir -p $out/share/hyde/hyprdots-modified
      cp -r . $out/share/hyde/hyprdots-modified
    '';
  };
in
pkg
