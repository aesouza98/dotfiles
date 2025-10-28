{ config, inputs, pkgs, ... }:

{
  home.username = "nano";
  home.homeDirectory = "/home/nano";
  home.stateVersion = "25.05";
  home.packages = [
    inputs.walker.packages.${pkgs.system}.default
    inputs.elephant.packages.${pkgs.system}.default
  ];

  home.file = {
    # ZSH
    # ".zshrc".source = ../../dot-zshrc;
    # ".zprofile".source = ../../dot-zprofile;
    # ".zshenv".source = ../../dot-zshenv;

    # Config
    # ".config/hypr".source = ../../dot-config/hypr;
    # ".config/btop".source = ../../dot-config/btop;
    # ".config/fish".source = ../../dot-config/fish;
    # ".config/ghostty".source = ../../dot-config/ghostty;
    # ".config/mako".source = ../../dot-config/mako;
    # ".config/nvim".source = ../../dot-config/nvim;
    # ".config/scripts".source = ../../dot-config/scripts;
    # ".config/shell".source = ../../dot-config/shell;
    # ".config/starship".source = ../../dot-config/starship;
    # ".config/swayosd".source = ../../dot-config/swayosd;
    # ".config/themes".source = ../../dot-config/themes;
    # ".config/walker".source = ../../dot-config/walker;
    # ".config/waybar".source = ../../dot-config/waybar;
    # ".config/wofi".source = ../../dot-config/wofi;
    # ".config/brave-flags.conf".source = ../../dot-config/brave-flags.conf;

    # Local
    # ".local/bin".source = ../../dot-local/bin;
    # ".local/share/fonts".source = ../../dot-local/share/fonts;
  };

  programs.git = {
    enable = true;
    settings = {
      alias = {
        st = "status";
        lg = "log --oneline --graph --decorate";
      };
      core.editor = "nvim";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };

  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      icon-theme = "Yaru-blue";
    };
  };

  xdg.userDirs.enable = true;

  programs.home-manager.enable = true;
}
