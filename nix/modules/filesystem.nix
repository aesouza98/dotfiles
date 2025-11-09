{
  boot.supportedFilesystems = [ "ntfs" ];
  fileSystems."/HDD" = {
    device = "/dev/disk/by-uuid/347CF2B57CF270CA";
    fsType = "ntfs-3g";
    options = [
      "defaults"
      "nofail"
      "x-systemd.device-timeout=1s"
    ];
  };

  fileSystems."/Windows" = {
    device = "/dev/disk/by-uuid/9804F58404F565A2";
    fsType = "ntfs-3g";
    options = [
      "defaults"
      "nofail"
      "x-systemd.device-timeout=1s"
    ];
  };
}
