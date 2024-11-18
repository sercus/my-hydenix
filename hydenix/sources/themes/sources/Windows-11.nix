{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Windows 11";
  src = pkgs.fetchFromGitHub {
    owner = "HyDE-Project";
    repo = "hyde-gallery";
    rev = "ea30c190b526555c06b6c716d0c062f48a996897";
    name = name;
    sha256 = "sha256-QG2pGDT6G9fuqiCErSf1cTOdRNI5WDy+1yyHGXDsYoQ=";
  };

  arcs = {
    gtk = "Windows-11";
    icon = "Windows-11";
    cursor = "Cursor-Windows";
  };

  meta = {
    description = "HyDE Theme: Windows 11";
    homepage = "https://github.com/HyDE-Project/hyde-gallery/tree/Windows-11";
  };
}
