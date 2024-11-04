{
  userConfig,
  ...
}:

{

  imports = [
    ../../hydenix
  ];

  hydenix = {
    enable = userConfig.hyde.enable or true;
    git = {
      userName = userConfig.gitUser or "";
      userEmail = userConfig.gitEmail or "";
    };
    themes =
      userConfig.hyde.themes or [
        "Catppuccin Mocha"
      ];
    activeTheme = userConfig.hyde.activeTheme or "Catppuccin Mocha";
  };

  # Don't change this
  home.stateVersion = "24.11";
}
