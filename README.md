# dotfiles

Personal dotfiles for macOS and Linux, managed with GNU Stow.

## Branches

| Branch | Platform |
|--------|----------|
| macos  | macOS    |
| master | Linux    |

## Setup

1. Install GNU Stow
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

The `--dotfiles` flag maps `dot-SOMETHING` to `.SOMETHING` in `~`, so `home/dot-config/` becomes `~/.config/`, `home/dot-zshrc` becomes `~/.zshrc`, and so on.

## Secrets

Copy `home/dot-config/fish/conf.d/secrets.fish.template` to `secrets.fish` in the same directory and fill in your values. The file is gitignored and sourced automatically by fish.

## Notes

Two PATH entries are not managed by Homebrew and must be set up manually on each machine:

- `$HOME/.safe-chain/` is a work tool installed separately.
- `/Library/Frameworks/Python.framework/Versions/3.12/bin` is a Python.org install. The entry is conditional and only activates if that directory exists, so it is safe to skip on machines that do not have it.
