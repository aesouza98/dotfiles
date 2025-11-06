{ config, inputs, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in{
  home.username = "nano";
  home.homeDirectory = "/home/nano";
  home.stateVersion = "25.05";
  # home.packages = [
  #   inputs.walker.packages.${pkgs.system}.default
  #   inputs.elephant.packages.${pkgs.system}.default
  # ];

  home.file = {
    # ZSH
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-zshrc";
    ".zprofile".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-zprofile";
    ".zshenv".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-zshenv";

    # Config
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/hypr";
    ".config/btop".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/btop";
    ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/fish";
    ".config/ghostty".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/ghostty";
    ".config/mako".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/mako";
    ".config/niri".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/niri";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/nvim";
    ".config/scripts".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/scripts";
    ".config/shell".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/shell";
    ".config/starship".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/starship";
    ".config/swayosd".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/swayosd";
    ".config/themes".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/themes";
    # ".config/walker".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/walker";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/waybar";
    ".config/wofi".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/wofi";
    ".config/brave-flags.conf".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-config/brave-flags.conf";

    # Local
    ".local/bin".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-local/bin";
    ".local/share/fonts".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/dot-local/share/fonts";
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
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
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
  
  # Walker
  programs.walker.enable = true;

  # XDG
  xdg.userDirs.enable = true;

  # Hyprland with systemd
  wayland.windowManager.hyprland.systemd.enable = true;

  # Enable Home-manager
  programs.home-manager.enable = true;
}
