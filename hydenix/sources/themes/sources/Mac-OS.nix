{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in

utils.mkTheme rec {
  name = "Mac OS";
  src = pkgs.fetchFromGitHub {
    owner = "HyDE-Project";
    repo = "hyde-gallery";
    rev = "1701be171600db27b04f8bf704dc37efe36cd282";
    name = name;
    sha256 = "sha256-J8H+obYoePdAwkOA9NLwbrz1ufKrU8qQFVKU9Ah8qMM=";
  };

  arcs = {
    gtk = "MacOS";
    icon = "MacOS";
    cursor = "MacOS-Cursor";
  };

  meta = {
    description = "HyDE Theme: Mac OS";
    homepage = "https://github.com/HyDE-Project/hyde-gallery/tree/1701be171600db27b04f8bf704dc37efe36cd282";
  };
}
