{ config, pkgs, ... }:

{
  programs.zsh.enable = true;

  # hyprland + uwsm
  programs.hyprland = {
    enable = true;
	  withUWSM = true;
	  xwayland.enable = true;
  };

  programs.uwsm.enable = true;
  programs.zsh.ohMyZsh.enable = true;
}
