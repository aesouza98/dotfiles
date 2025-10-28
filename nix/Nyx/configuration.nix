{ python3, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./user.nix
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

 
  programs.zsh.enable = true;
  services.getty.autologinUser = "nano";

  # Sudo NOPASSWD
  security.sudo.extraRules = [
  {
    groups = [ "wheel" ];
    commands = [ { command = "ALL"; options = [ "NOPASSWD" ]; } ];
  }
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
