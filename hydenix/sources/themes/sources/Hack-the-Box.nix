{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Hack the Box";
  src = pkgs.fetchFromGitHub {
    owner = "HyDE-Project";
    repo = "hyde-gallery";
    rev = "36fa09171cd1d14156086542df020369b9f8b8fa";
    name = name;
    sha256 = "sha256-ww7LoUVHlJhYUE2VSguhE7OZblx0hbQp6IaWAJSLcy4=";
  };

  arcs = {
    gtk = "Hackthebox";
    icon = "Papirus";
    cursor = "HackCursor";
  };

  meta = {
    description = "HyDE Theme: Hack the Box";
    homepage = "https://github.com/HyDE-Project/hyde-gallery/tree/Hack-the-Box";
  };
}
