{ pkgs, lib, ... }:

{
  specialisation = {
    gnome.configuration = {
      services.displayManager.sddm.enable = lib.mkForce false;
      services.displayManager.gdm.enable = lib.mkForce true;
      services.displayManager.defaultSession = lib.mkForce "gnome";
      services.desktopManager.gnome.enable = true;
      services.gnome.games.enable = false;

      environment.gnome.excludePackages = with pkgs; [
        gnome-tour
        gnome-user-docs
      ];

      environment.systemPackages = with pkgs; [
        gnomeExtensions.blur-my-shell
        gnomeExtensions.just-perfection
        gnomeExtensions.user-themes
        gnomeExtensions.appindicator
        gnome-tweaks
        gnome-extension-manager
      ];
    };
  };
}
