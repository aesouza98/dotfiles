{ pkgs, ... }:

{
 # User
  users.users.nano = {
    isNormalUser = true;
    description = "Adriano";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
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

  users.groups.libvirtd.members = ["nano"];
}
