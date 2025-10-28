{ config, pkgs, ... }:

{
  # System Envs
  environment.variables = {
    PATH = "/run/current-system/sw/bin:/usr/bin";
  };

  environment.sessionVariables = {
    GTK_DEFAULT_COLOR_SCHEME = "prefer-dark";
    WLR_NO_HARDWARE_CURSORS = "1";
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    XCURSOR_THEME = "Yaru";
    XCURSOR_SIZE = "24";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    FLAKE = "\${HOME}/.dotfiles/nix";
  };
}
