#!/bin/sh

# Load picom
killall picom ;
picom &

# Load power manager
xfce4-power-manager &

# Load notification service
killall dunst ;
dunst &

# Run Gnome Polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Setup Wallpaper and update colors
~/.config/dotfiles/scripts/updatewal.sh &


