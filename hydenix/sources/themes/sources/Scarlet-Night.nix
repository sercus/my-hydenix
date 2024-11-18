{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Scarlet Night";
  src = pkgs.fetchFromGitHub {
    owner = "abenezerw";
    repo = "Scarlet-Night";
    rev = "1c80ed42231de2afcda28e48793e395e3f0955d2";
    name = name;
    sha256 = "sha256-RtZQpL0ZzjsLOT812JCnhbW6aIya+6I9FO+fCxWIPRY=";
  };

  arcs = {
    gtk = "Rose-Pine";
    icon = "Tela-circle-hotred";
  };

  meta = {
    description = "HyDE Theme: Scarlet Night";
    homepage = "https://github.com/abenezerw/Scarlet-Night";
  };
}
