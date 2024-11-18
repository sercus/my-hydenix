{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Solarized Dark";
  src = pkgs.fetchFromGitHub {
    owner = "rishav12s";
    repo = "Solarized-Dark";
    rev = "0222e6a9efc5f1cbdffe263d7cc523efae659e6a";
    name = name;
    sha256 = "sha256-hZb94uJt5XuTJToL+ljQTXOBBKBCkrytD7jwV8Ck7ug=";
  };

  arcs = {
    gtk = "Solarized Dark";
    icon = "Tela-circle-solarized";
    cursor = "Capitaine-Cursors-White";
  };

  meta = {
    description = "HyDE Theme: Solarized Dark";
    homepage = "https://github.com/rishav12s/Solarized-Dark";
  };
}
