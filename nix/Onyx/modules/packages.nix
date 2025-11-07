{ pkgs }:

{
  pkgs_hypr = with pkgs; [
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
    sddm-sugar-dark
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
    file-roller
    gnome-keyring
    gsettings-desktop-schemas
    # localsearch
    nautilus
    # tinysparql
  ];
  pkgs_dev = with pkgs; [
    cargo
    docker
    docker-compose
    docker-buildx
    # gcc
    # gnumake
	  git
    # glib
    lazydocker
    # libgcc
    nodejs_22
    rustc
    yarn
  ];
  pkgs_gaming = with pkgs; [
    bottles
    hydralauncher
    protonup
    wine64
    winetricks
  ];
  pkgs_system = with pkgs; [
    egl-wayland
    ffmpeg_6-full
    flatpak
    # glibc
    # imagemagick
    polkit_gnome
    sof-firmware
    # stdenv.cc.cc.lib
    xdg-user-dirs
    xdg-user-dirs-gtk
    # zlib
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
	  stow
    starship
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
    dockerfile-language-server-nodejs
    sqls
    marksman

    # Formatters
    stylua
    black
    shfmt
    prettier
    alejandra
    sqlfluff

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
    obsidian
    pureref
    spotify
    syncthing
  ];
}
