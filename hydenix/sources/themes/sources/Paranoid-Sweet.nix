{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Paranoid Sweet";
  src = pkgs.fetchFromGitHub {
    owner = "rishav12s";
    repo = "Paranoid-Sweet";
    rev = "668f6a5a403416e5f50c1924ee5667bcccd2c1af";
    name = name;
    sha256 = "sha256-0FhznHsg2ov4XYVvhY0y5Uy45s2nWMi8JZMQPBUvpPg=";
  };

  arcs = {
    gtk = "Sweet-Dark";
    icon = "candy-icons";
    cursor = "Sweet-cursors";
  };

  meta = {
    description = "HyDE Theme: Paranoid Sweet";
    homepage = "https://github.com/rishav12s/Paranoid-Sweet";
  };
}
