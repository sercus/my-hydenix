{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "AbyssGreen";
  src = pkgs.fetchFromGitHub {
    owner = "Itz-Abhishek-Tiwari";
    repo = "AbyssGreen";
    name = name;
    rev = "93903b7d38bb2ab9e705016cc52cf62105d47dd7";
    sha256 = "sha256-cosU+0wJSaQspcjYEZA5dMoZARz+8vQM+49Vyf2JvA8=";
  };

  arcs = {
    gtk = "Everforest-Dark";
    icon = "Gruvbox-Plus-Dark";
  };

  meta = {
    description = "HyDE Theme: AbyssGreen";
    homepage = "https://github.com/Itz-Abhishek-Tiwari/AbyssGreen";
  };
}
