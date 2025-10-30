# nixvim.nix
{ lib, ... }:

{
  imports = [
    ./colorschemes.nix
  ];

  plugins = {
    lualine.enable = true;
  };
}

