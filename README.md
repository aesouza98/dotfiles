# Dotfiles
Dotfiles managed by **GNU Stow**

To install the dotfiles, please:
1. Install **GNU Stow**
2. Run the following command (Please, backup your existing configuration before doing this. It may be harmful):
  - `stow --dotfiles -t ~/ .`

## Cursor (Vimix White)
O tema fica em `dot-local/share/icons/Vimix-white-cursors` (o stow cobre o usuário). Flatpaks não seguem o symlink para `~/.dotfiles`, então instale também no sistema:
```
sudo cp -r --no-preserve=all dot-local/share/icons/Vimix-white-cursors /usr/share/icons/ && sudo restorecon -R /usr/share/icons/Vimix-white-cursors
```
