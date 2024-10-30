{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Bad Blood";
  src = pkgs.fetchFromGitHub {
    owner = "HyDE-Project";
    repo = "hyde-gallery";
    name = name;
    rev = "Bad-Blood";
    sha256 = "sha256-8BQukT9sXd89qiCelc9KitfXy7x9sgLChTGKzRpHUaA=";
  };

  meta = {
    description = "HyDE Theme: Bad Blood";
    homepage = "https://github.com/HyDE-Project/hyde-gallery/tree/Bad-Blood";
  };
}
