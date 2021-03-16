#!/bin/bash

PRIMARY_BG=$HOME/.config/i3/hubble.jpg
SECOND_BG=$HOME/.config/i3/portrait.jpg

xrandr \
	--output eDP-1 --primary --mode 1920x1080 --pos 0x840 --rotate normal \
	--output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate left
sleep 1
feh --bg-scale $PRIMARY_BG --bg-scale $SECOND_BG