# backspace with ctrl+w
autoload -Uz select-word-style
select-word-style bash

# erase word: alt+backspace
# autoload -Uz backward-kill-word-match
# zle -N backward-kill-shell-word backward-kill-word-match
# zstyle ':zle:backward-kill-shell-word' word-style shell
# bindkey '^[^?' backward-kill-shell-word
