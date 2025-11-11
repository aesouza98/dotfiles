# Loads brew environment variables
/opt/homebrew/bin/brew shellenv | source

# Define the default greeting from fish
function fish_greeting
  # pokemon-colorscripts -r1 --no-title
  # pfetch
end

if status is-interactive
  abbr --add ssm aws ssm start-session \
            --region us-west-1 \
            --profile EBANX \
            --target

  abbr --add s3cp aws s3 cp \
            --profile EBANX

  abbr --add vsc aws-secrets view-secret \
              -e file.yaml \
              -n secret/name \> "output_file.json"

  abbr --add ssc aws-secrets set-secret \
              -e file.yaml \
              -n secret/name \<  "input_file.json"

  abbr --add dsc aws-secrets deploy \
              -e file.yaml \
              --filter-pattern "filter/pattern" \
              --confirm
  zoxide init fish | source
  fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs --processes=\cp --history=\cr
  # atuin init fish | source
  source ~/.config/shell/aliases
  source (/opt/homebrew/bin/starship init fish --print-full-init | psub)
end
