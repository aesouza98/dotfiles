function fish_greeting
    # pfetch
end

function make_newline_before_prompt --on-event fish_prompt
    echo
end

if status is-interactive
    atuin init fish | source
    zoxide init fish | source
    source ~/.config/shell/aliases

    # source (starship init fish --print-full-init | psub)
end
