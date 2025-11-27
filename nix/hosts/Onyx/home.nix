{
  config,
  ...
}:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  dot-config = {
    nvim = "nvim";
    lazynvim = "lazynvim";
    niri = "niri";
    hypr = "hypr";
    alacritty = "alacritty";
    btop = "btop";
    ghostty = "ghostty";
    mako = "mako";
    fish = "fish";
    fuzzel = "fuzzel";
    shell = "shell";
    scripts = "scripts";
    starship = "starship";
    swayosd = "swayosd";
    themes = "themes";
    waybar = "waybar";
    wofi = "wofi";
  };
  dot-local = {
    bin = "bin";
    fonts = "share/fonts";
    hidden = "share/applications/hidden";
  };
in
{
  home.username = "nano";
  home.homeDirectory = "/home/nano";
  home.stateVersion = "25.05";
  programs.zsh.enable = true;
  # home.packages = [
  # ];

  # ZSH
  home.file = {
    # ".zshrc".source = create_symlink "${dotfiles}/dot-zshrc";
    # ".zshenv".source = create_symlink "${dotfiles}/dot-zshenv";
    # ".zprofile".source = create_symlink "${dotfiles}/dot-zprofile";
  }
  //
    # Local
    (builtins.mapAttrs (name: subpath: {
      target = ".local/${subpath}";
      source = create_symlink "${dotfiles}/dot-local/${subpath}";
      recursive = true;
    }) dot-local);

  xdg.configFile =
    # Config
    builtins.mapAttrs (name: subpath: {
      source = create_symlink "${dotfiles}/dot-config/${subpath}";
      recursive = true;
    }) dot-config;

  # Variables
  home.sessionVariables = {
    # Definitions
    EDITOR = "nvim";
    TERMINAL = "ghostty";
    XDG_SCREENSHOTS_DIR = "~/Pictures/Screenshots/";
    TERM = "xterm-256color";

    # Appearance
    GTK_DEFAULT_COLOR_SCHEME = "prefer-dark";
    XCURSOR_THEME = "Yaru";
    XCURSOR_SIZE = "24";

    # Nvidia
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";

    # Steam
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";

    # Flake Path
    NH_FLAKE = "\${HOME}/.dotfiles/nix";
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
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
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

  # Walker
  programs.walker.enable = true;

  # XDG
  xdg.userDirs.enable = true;

  # Hyprland with systemd
  wayland.windowManager.hyprland.systemd.enable = true;

  # Enable Home-manager
  programs.home-manager.enable = true;
}
