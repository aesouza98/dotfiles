# edit mode
autoload -Uz edit-command-line
zle -N edit-command-line
stty -ixon
bindkey '^s' edit-command-line
