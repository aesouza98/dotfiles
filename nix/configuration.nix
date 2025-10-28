{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "Nyx"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Networking
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "America/Sao_Paulo";

  # Locales
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  # Configure console keymap
  console.keyMap = "us-acentos";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nano = {
    isNormalUser = true;
    description = "Adriano";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;
  services.getty.autologinUser = "nano";

  # Sudo NOPASSWD
  security.sudo.extraRules = [
  {
    groups = [ "wheel" ];
    commands = [ { command = "ALL"; options = [ "NOPASSWD" ]; } ];
  }
];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = [
	  pkgs.neovim
	  pkgs.ghostty
	  pkgs.git
	  pkgs.firefox
	  pkgs.stow
    pkgs.zoxide
    pkgs.starship
    pkgs.localsend
    pkgs.blueberry
    pkgs.brave
    pkgs.gearlever
    pkgs.obsidian
    pkgs.spotify
    pkgs.stremio
    pkgs.syncthing
    pkgs.afetch
    pkgs.p7zip
    pkgs.atuin
    pkgs.brightnessctl
    pkgs.diffutils
    pkgs.colordiff
    pkgs.docker
    pkgs.docker-compose
    pkgs.docker-buildx
    pkgs.egl-wayland
    pkgs.eza
    pkgs.ffmpeg_6-full
    pkgs.flatpak
    pkgs.gnome-calculator
    pkgs.imagemagick
    pkgs.jq
    pkgs.lazydocker
    pkgs.lazygit
    pkgs.rustc
    pkgs.sof-firmware
    pkgs.gcc
    pkgs.unzip
    pkgs.wine
    pkgs.winetricks
    pkgs.wine64
    pkgs.yarn
    pkgs.grim
    pkgs.hyprshot
    pkgs.mako
    pkgs.nautilus
    pkgs.polkit_gnome
    pkgs.swaybg
    pkgs.swayosd
    pkgs.waybar
    pkgs.walker
    pkgs.impala
    pkgs.vimix-cursors
    pkgs.adwaita-fonts
    pkgs.adwaita-icon-theme
    pkgs.yaru-theme
    pkgs.bat
    pkgs.fzf
    pkgs.fd
    pkgs.ripgrep
    pkgs.glib
    pkgs.cargo
    pkgs.nodejs_22
  ];

  # hyprland + uwsm
  programs.hyprland = {
    enable = true;
	  withUWSM = true;
	  xwayland.enable = true;
  };

  programs.uwsm.enable = true;
  programs.zsh.ohMyZsh.enable = true;

  # System Envs
  environment.variables.PATH = "/run/current-system/sw/bin:/usr/bin";

  environment.sessionVariables = {
    GTK_THEME = "Adwaita-dark";
    GTK_DEFAULT_COLOR_SCHEME = "prefer-dark";
    WLR_NO_HARDWARE_CURSORS = "1";
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    XCURSOR_THEME = "Yaru";
    XCURSOR_SIZE = "24";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  systemd.user.extraConfig = ''
    DefaultLimitNOFILE=1048576
  '';

  security.pam.loginLimits = [
    { domain = "@users"; type = "soft"; item = "nofile"; value = "1048576"; }
    { domain = "@users"; type = "hard"; item = "nofile"; value = "1048576"; }
  ];

  # NVidia
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false; # set to true for laptops
    open = false;
    nvidiaSettings = true;
  };

  # Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Initial Version
  system.stateVersion = "25.05";
}
