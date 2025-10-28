{
  description = "flake do nano";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    elephant.url = "github:abenz1267/elephant";

    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };

  };
  outputs = { nixpkgs, nix-flatpak, home-manager, ... }@inputs: {
    nixosConfigurations.Nyx = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./Nyx/configuration.nix
        ./Nyx/modules/packages.nix
        nix-flatpak.nixosModules.nix-flatpak
        home-manager.nixosModules.home-manager  {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.nano = import ./Nyx/home.nix;
          home-manager.backupFileExtension = "backup";
        }
      ];
      specialArgs = { inherit inputs; };
    };
  };
}

