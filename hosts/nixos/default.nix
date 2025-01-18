{
  commonArgs,
}:
let
  inherit (commonArgs)
    system
    userConfig
    inputs
    ;
in
inputs.hydenix-nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = {
    inherit userConfig inputs;
  };
  modules = [
    {
      nixpkgs.pkgs = commonArgs.pkgs;
    }
    ./configuration.nix
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${userConfig.username} =
        { ... }:
        {
          imports = [
            ./home.nix
            inputs.nix-index-database.hmModules.nix-index
          ] ++ userConfig.homeModules;
        };
      home-manager.extraSpecialArgs = {
        inherit userConfig;
        inherit inputs;
      };
    }
  ] ++ userConfig.nixModules;
}
