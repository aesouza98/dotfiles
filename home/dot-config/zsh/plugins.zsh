# zsh plugin manager
source "$ZDOTDIR/zinit.zsh"

# super smart autocompletions
zinit ice wait"0" lucid depth=1 pick"deja.plugin.zsh"
zinit light Giammarco-Ferranti/deja

# syntax highlighting
zinit light zdharma-continuum/fast-syntax-highlighting

# Pure Shell Theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
