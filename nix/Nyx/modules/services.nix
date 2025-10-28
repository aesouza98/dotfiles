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
}
