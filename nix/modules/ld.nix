{ pkgs, opts, ...}:

{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      # (add any missing libs)
    ];
    packages = with pkgs; [
      pkgs.glibc
      pkgs.zlib
    ];
  };
}
