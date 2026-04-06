function fish_greeting
    pfetch
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    atuin init fish | source
    zoxide init fish | source
    source ~/.config/shell/aliases

    # source (starship init fish --print-full-init | psub)
end
