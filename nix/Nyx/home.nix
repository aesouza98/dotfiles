{ config, inputs, pkgs, ... }:

{
  home.username = "nano";
  home.homeDirectory = "/home/nano";
  home.stateVersion = "25.05";
  home.packages = [
    inputs.walker.packages.${pkgs.system}.default
    inputs.elephant.packages.${pkgs.system}.elephant-with-providers
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

  # Variables
  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_SCREENSHOTS_DIR = "~/Pictures/Screenshots/";
    TERM = "xterm-256color";
  };

  # User PATH
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.config/scripts"
    "$HOME/.config/scripts/omanano/"
    "$HOME/.config/scripts/themes/"
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      icon-theme = "Yaru-blue";
    };
  };

  # Git Configs
  programs.git = {
    enable = true;
    settings = {
      alias = {
        st = "status";
        # lg = "log --oneline --graph --decorate";
        c = "commit -m";
        lg = "log --color --graph --branches --all --decorate --oneline";
        chb = "checkout -b";
        ch = "checkout";
      };
      core.editor = "nvim";
      pull.rebase = true;
      push.autoSetupRemote = true;
    };
  };

  # programs.nixvim.enable = true;
  # programs.nixvim.imports = [ ./modules/nixvim/nixvim.nix ];
  # programs.nixvim.defaultEditor = true;
  # programs.nixvim.vimdiffAlias = true;

  xdg.userDirs.enable = true;

  wayland.windowManager.hyprland.systemd.enable = true;

  programs.home-manager.enable = true;
}
