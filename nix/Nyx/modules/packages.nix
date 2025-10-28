{ config, pkgs, ... }:

{
  imports = [
    ./programs.nix
    ./services.nix
    # ./flatpaks.nix
  ];
  # User Packages
  users.users.nano.packages = with pkgs; [
  ];

  environment.systemPackages = with pkgs; [
	  neovim
	  ghostty
	  git
	  firefox
	  stow
    zoxide
    starship
    localsend
    blueberry
    brave
    gearlever
    obsidian
    spotify
    stremio
    syncthing
    afetch
    p7zip
    atuin
    brightnessctl
    diffutils
    colordiff
    docker
    docker-compose
    docker-buildx
    egl-wayland
    eza
    ffmpeg_6-full
    flatpak
    gnome-calculator
    imagemagick
    jq
    lazydocker
    lazygit
    rustc
    sof-firmware
    gcc
    unzip
    wine
    winetricks
    wine64
    yarn
    grim
    hyprshot
    mako
    nautilus
    polkit_gnome
    swaybg
    swayosd
    waybar
    walker
    vimix-cursors
    adwaita-fonts
    adwaita-icon-theme
    yaru-theme
    bat
    fzf
    fd
    ripgrep
    glib
    cargo
    nodejs_22
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebengine-5.15.19"
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

}
