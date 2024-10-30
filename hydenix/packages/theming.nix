{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    # --------------------------------------------------- // Theming
    nwg-look # gtk configuration tool
    libsForQt5.qt5ct # qt5 configuration tool
    kdePackages.qt6ct # qt6 configuration tool
    libsForQt5.qtstyleplugin-kvantum # svg based qt6 theme engine
    kdePackages.qtstyleplugin-kvantum # svg based qt5 theme engine
    gtk3 # gtk3
    gtk4 # gtk4
    glib # gtk theme management
    gsettings-desktop-schemas # gsettings schemas
    gnome-settings-daemon # for gnome settings
    desktop-file-utils # for updating desktop database
    hicolor-icon-theme # Base fallback icon theme
    gnome.adwaita-icon-theme # Standard GNOME icons, excellent fallback
    libsForQt5.breeze-icons # KDE's icon set, good for Qt apps
    dconf-editor # dconf editor
    gnome-tweaks # gnome tweaks
  ];
}
