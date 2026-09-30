# zsh plugin manager
source "$ZDOTDIR/zinit.zsh"

# completions
source "$ZDOTDIR/completions.zsh"

# fzf-tab
zinit ice depth=1 lucid
zinit light Aloxaf/fzf-tab

# oh-my-zsh snippets
zinit snippet OMZP::aws
zinit snippet OMZP::sudo
zinit snippet OMZP::extract
zinit snippet OMZP::colored-man-pages

# deja - auto suggestions
if (( $+commands[deja] )); then
    zinit ice wait"0" lucid depth=1 pick"deja.plugin.zsh"
    zinit light Giammarco-Ferranti/deja
fi

# syntax highlighting
zinit light zdharma-continuum/fast-syntax-highlighting
FAST_HIGHLIGHT[chroma-git]=
FAST_HIGHLIGHT[chroma-hub]=
FAST_HIGHLIGHT[chroma-lab]=

# pure prompt
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
PURE_GIT_UNTRACKED_DIRTY=0
