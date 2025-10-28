{ config, pkgs, ... }:

{
  home.username = "nano";
  home.homeDirectory = "/home/nano";
  home.stateVersion = "25.05";
  home.packages = [
  ];
  # home.file = {
  #   ".bashrc".source = ./dotfiles/.bashrc;
  #   ".config/aliases.txt".source = ./dotfiles/aliases.txt;
  # };
  programs.git = {
    enable = true;
    aliases = {
      st = "status";
      lg = "log --oneline --graph --decorate";
    };
    extraConfig = {
      core.editor = "nvim";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };
  home.sessionVariables = {
    # EDITOR = "nvim";
  };
  programs.home-manager.enable = true;
}
