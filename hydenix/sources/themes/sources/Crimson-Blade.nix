{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Crimson Blade";
  src = pkgs.fetchFromGitHub {
    owner = "cyb3rgh0u1";
    repo = "Crimson-Blade";
    rev = "4b1afd9f62c4b64a7c35628c2e80fa632cb81735";
    name = name;
    sha256 = "sha256-PGE4H7hhaFnxv5TUyEO86bg3BM2A1nDsnBifpMxTBNY=";
  };

  arcs = {
    gtk = "Kripton";
    icon = "Colorful-Dark-Icons";
    cursor = "Future-cyan-cursors";
  };

  meta = {
    description = "HyDE Theme: A striking fusion of sharp elegance, cutting through the darkness with bold hues.";
    homepage = "https://github.com/cyb3rgh0u1/Crimson-Blade";
  };
}
