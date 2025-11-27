{ pkgs, ... }:

let
  groups = import ./packages.nix { inherit pkgs; };
in

{
  imports = [
    ./programs.nix
    ./services.nix
    ./flatpaks.nix
    # ./gnome.nix
    # ./plasma.nix
  ];

  # User Packages
  users.users.nano.packages =
    groups.pkgs_desktop
    ++ groups.pkgs_appearance
    ++ groups.pkgs_gaming
    ++ groups.pkgs_gnome
    ++ groups.pkgs_neovim
    ++ groups.pkgs_hypr;

  # System Packages
  environment.systemPackages = groups.pkgs_cli ++ groups.pkgs_dev ++ groups.pkgs_system;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
