{ pkgs, lib, ... }:

{
  # LD Fixes
  environment.variables.LD_LIBRARY_PATH = lib.makeLibraryPath [
    pkgs.glibc
    pkgs.zlib
  ];

}
