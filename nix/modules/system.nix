{ pkgs, ... }:
{
  imports = [
    ./env-vars.nix
    ./filesystem.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Sudo NOPASSWD
  security.sudo.extraRules = [
    {
      groups = [ "wheel" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  # Polkit
  security.polkit.enable = true;

  # NVidia
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false; # set to true for laptops
    open = false;
    nvidiaSettings = true;
  };

  # Remove File Limits
  systemd.user.extraConfig = ''
    DefaultLimitNOFILE=1048576
  '';
  security.pam.loginLimits = [
    {
      domain = "@users";
      type = "soft";
      item = "nofile";
      value = "1048576";
    }
    {
      domain = "@users";
      type = "hard";
      item = "nofile";
      value = "1048576";
    }
  ];
}
