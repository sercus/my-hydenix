{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Dracula";
  src = pkgs.fetchFromGitHub {
    owner = "RAprogramm";
    repo = "HyDe-Themes";
    rev = "fc51f05927f2fe9d90393fdf2debc1afaf429df6";
    name = name;
    sha256 = "sha256-AaFFKyFasjGQuLtqJeZYWxrtAgqsW0FDVxB8KqZkkzM=";
  };

  arcs = {
    gtk = "Dracula";
    icon = "Azure-Dark-Icons";
    cursor = "Dracula-cursors";
  };

  meta = {
    description = "HyDE Theme: Dracula";
    homepage = "https://github.com/RAprogramm/HyDe-Themes/tree/Dracula";
  };
}
