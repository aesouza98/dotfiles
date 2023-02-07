#!/usr/bin/env bash
HDMI=$(xrandr --query | grep 'HDMI1')
DIR="$( cd "$(dirname "$0")" ; pwd -P )"

# Terminate already running bar instances
killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launching Bars
polybar -q -c $DIR/config.ini main & disown

if [[ $HDMI = *connected* ]]; then
	polybar -q bar2 -c $DIR/config.ini & disown
fi
