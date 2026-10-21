# dotfiles

Personal dotfiles for macOS and Linux, managed with GNU Stow.

## Branches

| Branch | Platform |
|--------|----------|
| macos  | macOS    |
| master | Linux    |

## Setup

1. Install GNU Stow and the tools used by the config:

```sh
brew install stow eza fd ripgrep bat zoxide fzf lazygit helix neovim
```

2. Clone the repo:

```sh
git clone git@github.com:aesouza98/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git checkout macos   # or master for Linux
```

3. Apply the package:

```sh
stow --dotfiles -t ~ home
```

The `--dotfiles` flag maps `dot-SOMETHING` to `.SOMETHING` in `~`, so `home/dot-config/` becomes `~/.config/`, `home/dot-zshenv` becomes `~/.zshenv`, and so on.

4. Open a new shell. zinit clones itself and installs the zsh plugins on first start.
