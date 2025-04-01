{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    neovim
    htop
    git
    jetbrains.idea-ultimate
    jdk
    chromium
    teams-for-linux
    gradle_8
    python311Packages.pyspark
    neofetch
    jetbrains.pycharm-professional
    nodejs
    postgresql
    yarn
    wineWowPackages.waylandFull
    rPackages.telegram
    virtualbox
  ];
}


