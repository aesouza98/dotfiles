{ pkgs }:

{
  pkgs_hypr = with pkgs; [
    blueberry
    grim
    hyprshot
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
	  git
    glib
    lazydocker
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
    imagemagick
    polkit_gnome
    sof-firmware
    xdg-user-dirs
    xdg-user-dirs-gtk
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
	  neovim
    nh
    p7zip
    ripgrep
	  stow
    starship
    unzip
    zip
    zoxide
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
