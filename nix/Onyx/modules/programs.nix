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

  programs.niri = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.fish = {
      enable = true;
      generateCompletions = true;
    };

  programs.evince = {
    enable = true;
  };

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      glibc
      zlib
      libice
      libsm
      libx11
      libxcb
      freetype
      fontconfig
    ];
  };

  # UWSM
  programs.uwsm.enable = true;

  # Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  # VirtManager
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;

}
