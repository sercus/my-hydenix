{ pkgs, ... }: {
  systemd.services.write-userprefs = {
    description = "Force Hyprland userprefs.conf keyboard layout";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -c 'echo \"input { kb_layout = es }\" > /home/ser/.config/hypr/userprefs.conf'";
    };
  };
}

