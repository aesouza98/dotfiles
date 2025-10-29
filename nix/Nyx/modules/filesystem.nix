{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "ntfs" ];
  fileSystems."/HDD" = {
    device = "/dev/disk/by-uuid/b66e8b7d-3802-478f-830b-d65ecf6edef0";
    fsType = "ntfs-3g";
    options = [
      "defaults"
    ];
  };

  fileSystems."/Windows" = {
    device = "/dev/disk/by-uuid/bafac86a-3f16-4c24-9cfb-557af33ac40a";
    fsType = "ntfs-3g";
    options = [
      "defaults"
    ];
  };
}
