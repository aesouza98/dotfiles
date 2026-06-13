# Loads brew environment variables
/opt/homebrew/bin/brew shellenv | source

# Define the default greeting from fish
function fish_greeting
    # pfetch
end

# User paths (idempotent — fish_add_path deduplicates)
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.fzf/bin

if status is-interactive
    source ~/.config/shell/aliases
    abbr --add ssm aws ssm start-session \
        --region us-west-1 \
        --profile EBANX \
        --target

    atuin init fish | source
    zoxide init fish | source

    #fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs --processes=\cp --history=\cr

    source (/opt/homebrew/bin/starship init fish --print-full-init | psub)
end
