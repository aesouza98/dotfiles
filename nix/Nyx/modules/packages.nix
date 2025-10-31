{ pkgs }:

{
  pkgs_hypr = with pkgs; [
    blueberry
    grim
    hyprshot
    libnotify
    mako
    swaybg
    swayosd
    waybar
    #walker
    wofi
  ];
  pkgs_appearance = with pkgs; [
    adwaita-fonts
    adwaita-icon-theme
    vimix-cursors
    yaru-theme
  ];
  pkgs_gnome = with pkgs; [
    file-roller
    # gnome.gvfs
    gsettings-desktop-schemas
    localsearch
    nautilus
    tinysparql
  ];
  pkgs_dev = with pkgs; [
    cargo
    docker
    docker-compose
    docker-buildx
    gcc
    gnumake
	  git
    glib
    lazydocker
    libgcc
    nodejs_22
    rustc
    yarn
  ];
  pkgs_gaming = with pkgs; [
    bottles
    hydralauncher
    protonup
    wine
    wine64
    winetricks
  ];
  pkgs_system = with pkgs; [
    egl-wayland
    ffmpeg_6-full
    flatpak
    glibc
    imagemagick
    polkit_gnome
    sof-firmware
    stdenv.cc.cc.lib
    xdg-user-dirs
    xdg-user-dirs-gtk
    zlib
  ];
  pkgs_cli = with pkgs; [
    afetch
    atuin
    bat
    eza
    fastfetch
    fd
    fzf
	  ghostty
    jq
    lazygit
    nh
    p7zip
    ripgrep
	  stow
    starship
    unzip
    wl-clipboard
    yazi
    zip
    zoxide
  ];
  pkgs_neovim = with pkgs; [
	  neovim
    # Language servers
    nil
    lua-language-server
    pyright
    bash-language-server
    rust-analyzer
    typescript-language-server
    gopls

    # Formatters / linters
    stylua
    shfmt
    black
    prettier
  ];
  pkgs_desktop = with pkgs; [
    brave
	  firefox
    gearlever
    gnome-calculator
    localsend
    obsidian
    pureref
    spotify
    syncthing
  ];
}
