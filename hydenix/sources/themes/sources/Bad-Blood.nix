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
    rev = "1ce31f0d5cffcfd649eea25177b4ff23422955fe";
    sha256 = "sha256-vWhQ6Mhf3NnXqgGKv38bEM478cJHSfRJtsMPAYqXSv8=";
  };

  arcs = {
    gtk = "Bad-Blood";
    icon = "besgnulinux-mono-red";
    cursor = "Night-Diamond-Red";
  };

  meta = {
    description = "HyDE Theme: Bad Blood";
    homepage = "https://github.com/HyDE-Project/hyde-gallery/tree/Bad-Blood";
  };
}
