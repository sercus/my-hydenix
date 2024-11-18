{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Red Stone";
  src = pkgs.fetchFromGitHub {
    owner = "mahaveergurjar";
    repo = "Theme-Gallery";
    rev = "371030f2236f1713d084a4fc90b479fa821b0067";
    name = name;
    sha256 = "sha256-BNvAQ8TulTCex0cF8cvaM2NJc5zeKARTYJLO3nQD1n4=";
  };

  arcs = {
    gtk = "Red-Stone";
    icon = "Tela-circle-red";
  };

  meta = {
    description = "HyDE Theme: Red Stone";
    homepage = "https://github.com/mahaveergurjar/Theme-Gallery/tree/Red-Stone";
  };
}
