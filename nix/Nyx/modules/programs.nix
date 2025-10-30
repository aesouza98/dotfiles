{ config, pkgs, ... }:

{
  # ZSH
  programs.zsh.enable = true;
  programs.zsh.ohMyZsh.enable = true;

  # hyprland + uwsm
  programs.hyprland = {
    enable = true;
	  withUWSM = true;
	  xwayland.enable = true;
  };

  # UWSM
  programs.uwsm.enable = true;

  # Steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

}
