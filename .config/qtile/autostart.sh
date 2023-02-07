#!/bin/bash

#Kill Programs
killall picom ; picom -f &
killall dunst ; dunst &

#Window Manager
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
nitrogen --restore &

#Mouse and Keyboard
xinput --set-prop 'Logitech Wireless Mouse PID:4022' 'libinput Accel Profile Enabled' 0 0 &
xinput --set-prop 'Logitech Wireless Mouse PID:4022' 'Coordinate Transformation Matrix' 1.0 0 0 0 1.0 0 0 0 1.5 &

xinput set-prop 11 156 1.0 0 0 0 1.0 0 0 0 1.5 &
xinput set-prop 11 297 0, 0 &
