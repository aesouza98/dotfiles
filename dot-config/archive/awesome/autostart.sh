#!/bin/bash

#Kill Programs
killall picom ; picom -f &
killall dunst ; dunst &

#Window Manager
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
#dualmonitor

#Mouse and Keyboard
#xsetroot -cursor_name left_ptr &
xinput --set-prop 13 'libinput Accel Profile Enabled' 0 0 &
xinput --set-prop 13 'Coordinate Transformation Matrix' 0.5 0 0 0 0.5 0 0 0 0 &
#setxkbmap br thinkpad
setxkbmap us intl

#Programs
pamac-tray
xfce4-power-manager
numlockx on
systemctl --user stop plasma-kglobalaccel.service
nm-applet
#bitwarden-desktop
flatpak run com.github.IsmaelMartinez.teams_for_linux
