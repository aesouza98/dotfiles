# NixOS
The configuration of NixOS is declared inside `nix/`.
Apply them using `sudo nix-rebuild switch --flake ${FLAKE_PATH}`

# Dotfiles
Dotfiles managed by **GNU Stow**

To install the dotfiles, please:
1. Install **GNU Stow**
2. Run the following command (Please, backup your existing configuration before doing this. It may be harmful):
  - `stow --dotfiles -t ~/ .`
