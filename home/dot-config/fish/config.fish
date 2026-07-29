# Loads brew environment variables
/opt/homebrew/bin/brew shellenv | source

# Define the default greeting from fish
function fish_greeting
    pfetch
end

fish_add_path $HOME/.local/bin
fish_add_path $HOME/.fzf/bin

if status is-interactive
    # Aliases
    source ~/.config/shell/aliases
    abbr --add ssm aws ssm start-session --region us-west-1 --profile EBANX --target

    # Vars
    set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
    set -gx EDITOR hx
    set -gx VISUAL hx

    # Utils
    zoxide init fish | source

    # Keybindings
    fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs --processes=\cp --history=\cr
    bind \cv edit_command_buffer

    # Prompt
    source (/opt/homebrew/bin/starship init fish --print-full-init | psub)
end
