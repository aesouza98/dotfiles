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
  # services.displayManager.defaultSession = lib.mkDefault "niri";

  # SDDM
  services.displayManager.sddm = {
    enable = lib.mkDefault true;
    wayland.enable = lib.mkDefault true;
    extraPackages = with pkgs; [
      catppuccin-sddm
    ];
    theme = "${pkgs.catppuccin-sddm}/share/sddm/themes/catppuccin-mocha-mauve";
  };

  # Plasma Install
  services.displayManager.defaultSession = lib.mkForce "plasma";
  services.desktopManager.plasma6.enable = true;
  environment.systemPackages = with pkgs; [
    kdePackages.kate
  ];
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
