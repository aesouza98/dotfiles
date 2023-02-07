#!/bin/bash

#Kill Programs
killall picom ; picom -f --experimental-backends &
killall dunst

#Window Manager
dunst &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dualmonitor &
feh --bg-fill ~/.config/bspwm/wall.png &
#nmcli connection up WifiRalph\ 5.0 passwd-file ~/.wireless-pass &

#Mouse and Keyboard
#xsetroot -cursor_name left_ptr &
xinput --set-prop 'Logitech Wireless Mouse PID:4022' 'libinput Accel Profile Enabled' 0 0 &
xinput --set-prop 'Logitech Wireless Mouse PID:4022' 'Coordinate Transformation Matrix' 1.0 0 0 0 1.0 0 0 0 2 &
#setxkbmap br thinkpad

#Polybar
#~/.config/polybar/launch.sh &

#Programs
run nm-applet
run caffeine
run pamac-tray
run variety
run xfce4-power-manager
run blueberry-tray
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run numlockx on
run volumeicon
