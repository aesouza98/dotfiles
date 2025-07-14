function fish_greeting
    afetch
end

if status is-interactive
    abbr --add vim nvim
    abbr --add gcm git commit -m
    abbr --add gst git status
    abbr --add gcl git clone
    abbr --add gpsh git push
    abbr --add gpll git pull

    source ~/.config/shell/aliases
end
