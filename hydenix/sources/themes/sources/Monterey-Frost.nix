{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Monterey Frost";
  src = pkgs.fetchFromGitHub {
    owner = "rishav12s";
    repo = "Monterey-Frost";
    rev = "256fe4ab744a3e4682b014250c472dcc38fca6d4";
    name = name;
    sha256 = "sha256-II0UBeqTK2TPeXvY4HuTsmqRkGMrjq5jSSVWvR/hm8M=";
  };

  arcs = {
    gtk = "WhiteSur-Dark";
    icon = "WhiteSur";
    cursor = "macOS-Black";
    font = "SF Pro Rounded Regular 10.​5";
  };

  meta = {
    description = "Mac-OS inspired dark theme";
    homepage = "https://github.com/rishav12s/Monterey-Frost";
  };
}
