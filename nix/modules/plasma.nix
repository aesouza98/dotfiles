{ pkgs, lib, ... }:

{
  specialisation = {
    plasma.configuration = {
      services.displayManager.defaultSession = lib.mkForce "plasma";
      services.desktopManager.plasma6.enable = true;
      environment.systemPackages = with pkgs; [
        kdePackages.kate
      ];
    };
  };
}
