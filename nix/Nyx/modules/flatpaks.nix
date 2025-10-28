{ config,pkgs, ... }:
{
  services.flatpak.packages = [
    com.stremio.Stremio
  ];
}
