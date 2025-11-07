{ config, pkgs, lib, ... }:

{
  # System Envs
  environment.variables = {
    PATH = "/run/current-system/sw/bin:/usr/bin";
  };

  # User Variables -- not really user but I'm lazy and will fix this later
  environment.sessionVariables = {
    # Appearance
    GTK_DEFAULT_COLOR_SCHEME = "prefer-dark";
    XCURSOR_THEME = "Yaru";
    XCURSOR_SIZE = "24";
    # WLR_NO_HARDWARE_CURSORS = "1";
    # Nvidia
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    # Steam
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    # Flake Path
    NH_FLAKE = "\${HOME}/.dotfiles/nix";
  };

  # LD Fixes
  environment.variables.LD_LIBRARY_PATH = lib.makeLibraryPath [
    pkgs.glibc
    pkgs.zlib
  ];

}
