{ pkgs, lib, ... }:

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
        "Android" = {
          id = "2N7HH65-PAXR4UT-GKHUXK7-OL7XX3F-PMYJUDF-SHCAKEI-FBWROBP-QMUDKAU";
        };
        "Macbook" = {
          id = "YRARYBI-XXO5B7A-HHICYVF-ZCYOTQM-GOVYHZN-ZOGMRKL-3P46ICL-EMRLIQV";
        };
      };
      folders = {
        "vrdlp-sapw7" = {
          path = "~/Documents/Obsidian/VaultPessoal";
          devices = [
            "Android"
            "Macbook"
          ];
        };
        "zi4ss-myz7c" = {
          path = "~/Documents/Obsidian/EbanxVault/";
          devices = [
            "Android"
            "Macbook"
          ];
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
  services.displayManager.defaultSession = lib.mkDefault "niri";

  # SDDM
  services.displayManager.sddm = {
    enable = lib.mkDefault true;
    wayland.enable = lib.mkDefault true;
    theme = "${pkgs.sddm-sugar-dark}/share/sddm/themes/sugar-dark";
    # theme = "${pkgs.sddm-chili-theme}/share/sddm/themes/chili";
  };

  security.pam.services.sddm.enableGnomeKeyring = true;

  # Nautilus + GNOME
  services.gvfs.enable = true;
  services.gnome.localsearch.enable = true;
  services.gnome.tinysparql.enable = true;
  services.tumbler.enable = true;
  services.udisks2.enable = true;

  # Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
