{ config,pkgs, ... }:

{
  # Flatpaks
  services.flatpak.packages = [
    "com.stremio.Stremio"
  ];
}
