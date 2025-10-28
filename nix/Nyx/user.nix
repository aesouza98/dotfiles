{ config, pkgs, ... }:
{
 # User
  users.users.nano = {
    isNormalUser = true;
    description = "Adriano";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; []; # User Packages only
    shell = pkgs.zsh;
  };

  # Git Config
  programs.git = {
    enable = true;
    config = {
      user.name = "Adriano Elias";
      user.email = "github@nano.slmail.me";
      init.defaultBranch = "master";
    };
  };

  # Enable Home Manager
  # programs.home-manager.enable = true;
}
