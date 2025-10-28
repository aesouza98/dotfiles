{
  description = "flake do nano";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = { nixpkgs, nix-flatpak, home-manager, ... }@inputs: {
    nixosConfigurations.Nyx = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./Nyx/configuration.nix
        ./Nyx/modules/packages.nix
        ./Nyx/modules/services.nix
        nix-flatpak.nixosModules.nix-flatpak
        # home-manager.nixosModules.home-manager  {
        #   home-manager.useGlobalPkgs = true;
        #   home-manager.useUserPackages = true;
        #   home-manager.users.nano = import ./home.nix;
        #   home-manager.backupFileExtension = "backup";
        # }

      ];
      specialArgs = { inherit inputs; };
    };
  };
}

