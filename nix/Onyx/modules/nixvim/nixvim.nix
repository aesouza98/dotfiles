# nixvim.nix
{ lib, ... }:

{
  imports = [
    ./colorschemes.nix
    ./options.nix
    ./keymaps.nix
  ];

  plugins = {
    lualine.enable = true;
    neo-tree.enable = true;
  };
}

