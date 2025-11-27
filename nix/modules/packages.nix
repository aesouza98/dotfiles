{ pkgs }:

{
  pkgs_hypr = with pkgs; [
    alacritty
    blueberry
    cliphist
    grim
    fuzzel
    hyprlock
    hyprshot
    libnotify
    mako
    pamixer
    playerctl
    swaybg
    swayosd
    waybar
    #walker
    wiremix
    wl-clip-persist
    wl-clipboard
    # wofi
    xwayland-satellite
  ];
  pkgs_appearance = with pkgs; [
    adwaita-fonts
    adwaita-icon-theme
    vimix-cursors
    yaru-theme
  ];
  pkgs_gnome = with pkgs; [
    eog
    file-roller
    gnome-keyring
    gsettings-desktop-schemas
    # localsearch
    nautilus
    sushi
    # tinysparql
  ];
  pkgs_dev = with pkgs; [
    cargo
    docker
    docker-compose
    docker-buildx
    gcc
    gnumake
    go
    git
    # glib
    lazydocker
    libgcc
    luarocks
    nodejs_22
    python313
    ruby
    rustc
    yarn
  ];
  pkgs_gaming = with pkgs; [
    bottles
    discord
    hydralauncher
    protonup-ng
    wine
    wine64
    winetricks
  ];
  pkgs_system = with pkgs; [
    # glibc
    # imagemagick
    # stdenv.cc.cc.lib
    # zlib
    egl-wayland
    ffmpeg_6-full
    flatpak
    gammastep
    polkit_gnome
    sof-firmware
    xdg-user-dirs
    xdg-user-dirs-gtk
  ];
  pkgs_cli = with pkgs; [
    # ansible
    # ansible-lint
    atuin
    bash-completion
    bat
    eza
    fastfetch
    fd
    fish
    fzf
    ghostty
    gum
    jq
    lazygit
    libvirt
    nh
    parted
    qemu
    ripgrep
    starship
    stow
    unrar
    unzip
    virt-manager
    wget
    yazi
    zoxide
  ];
  pkgs_neovim = with pkgs; [
    neovim

    # LSPs
    bash-language-server
    pyright
    lua-language-server
    yaml-language-server
    vscode-json-languageserver
    nil
    dockerfile-language-server
    sqls
    marksman

    # Formatters
    stylua
    # black
    shfmt
    prettier
    # alejandra
    sqlfluff
    nixfmt
    biome
    python313Packages.flake8

    # Linters
    shellcheck
    ruff
    yamllint
    tflint
    ansible-lint
    hadolint
    markdownlint-cli
  ];
  pkgs_desktop = with pkgs; [
    bitwarden-desktop
    brave
    firefox
    gearlever
    gnome-calculator
    localsend
    mpv
    obsidian
    pureref
    qbittorrent
    spotify
    syncthing
    vlc
    waydroid
    waydroid-helper
  ];
}
