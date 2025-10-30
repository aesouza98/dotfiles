# nixvim.nix
{ lib, ... }:
{
  # You can use lib.nixvim in your config
  fooOption = lib.nixvim.mkRaw "print('hello')";

  # Configure NixVim without prefixing with `plugins.nixvim`
  plugins.my-plugin.enable = true;
}

