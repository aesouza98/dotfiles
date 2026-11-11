# fzf
eval "$(fzf --zsh)"

# zoxide
unalias zi 2>/dev/null
eval "$(zoxide init zsh)"

# zed projects
zp() { local d; d=$(fd -t d -d 1 . ~/Git | fzf) && zed -n "$d"; }
