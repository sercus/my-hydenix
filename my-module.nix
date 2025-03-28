# my-module.nix
{pkgs, ... }:

{
   wayland.windowManager.hyprland.settings = {
   input = {
      kb_layout = "es"; # spanish layout
   };
  };
}

