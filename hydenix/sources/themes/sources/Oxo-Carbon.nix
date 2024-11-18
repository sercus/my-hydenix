{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Oxo Carbon";
  src = pkgs.fetchFromGitHub {
    owner = "rishav12s";
    repo = "Oxo-Carbon";
    rev = "91eff63b9ba2b0a2ad002661c3e7f327237e4d02";
    name = name;
    sha256 = "sha256-qxqdP5rInvHy2Irm6pxlujhSPaVm+i4YoQ2/4dS4vhw=";
  };

  arcs = {
    gtk = "Oxo-Carbon";
    icon = "Tela-circle-pink";
    cursor = "Capitaine-Cursors";
  };

  meta = {
    description = "HyDE Theme: Oxo Carbon";
    homepage = "https://github.com/rishav12s/Oxo-Carbon";
  };
}
