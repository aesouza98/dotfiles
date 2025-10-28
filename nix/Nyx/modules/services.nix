{ config, pkgs, ... }:

{
  # Syncthing
  services.syncthing = {
    enable = true;
    user = "nano";
    group = "users";
    configDir = "/home/nano/.local/state/syncthing/";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "Android" = { id = "2N7HH65-PAXR4UT-GKHUXK7-OL7XX3F-PMYJUDF-SHCAKEI-FBWROBP-QMUDKAU"; };
        "Macbook" = { id = "YRARYBI-XXO5B7A-HHICYVF-ZCYOTQM-GOVYHZN-ZOGMRKL-3P46ICL-EMRLIQV"; }; 
      };
      folders = {
        "vrdlp-sapw7" = {
          path = "~/Documents/Obsidian/VaultPessoal";
          devices = [ "Android" "Macbook" ];
        };
        "zi4ss-myz7c" = {
          path = "~/Documents/Obsidian/EbanxVault/";
          devices = [ "Android" "Macbook" ];
        };
      };
    };
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  # Auto Login
  services.getty.autologinUser = "nano";

  # GVfs
  services.gvfs.enable = true;

  # Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };
}
