{
  description = "flake do nano";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    elephant.url = "github:abenz1267/elephant";

    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };

    # nixvim = {
    #      url = "github:nix-community/nixvim";
    #      inputs.nixpkgs.follows = "nixpkgs";
    # };

  };
  outputs =
    {
      nixpkgs,
      nix-flatpak,
      home-manager,
      walker,
      elephant,
      ...
    }@inputs:
    {
      nixosConfigurations.Onyx = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/Onyx/configuration.nix
          ./modules/install_pkgs.nix
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "backup";
            home-manager.users.nano = {
              imports = [
                # nixvim.homeModules.nixvim
                inputs.walker.homeManagerModules.default
                ./hosts/Onyx/home.nix
              ];
            };
          }
        ];
      };
    };
}
