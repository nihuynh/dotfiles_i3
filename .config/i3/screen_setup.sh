#!/bin/bash
# Wallpaper :
PRIMARY_BG=$HOME/.config/i3/hubble.jpg
SECOND_BG=$HOME/.config/i3/portrait.jpg
# Monitor setup :
PRIMARY_SCREEN=DP-2
VERTICAL_SCREEN=DP-3

xrandr \
	--output HDMI-4 --off --output HDMI-3 --off --output HDMI-2 --off --output HDMI-1 --off \
	--output DP-4 --off --output DP-1 --off \
	--output $VERTICAL_SCREEN --mode 1920x1080 --pos 1920x0 --rotate right \
	--output $PRIMARY_SCREEN --primary --mode 1920x1080 --pos 0x416 --rotate normal

sleep 1
feh --bg-scale $PRIMARY_BG --bg-scale $SECOND_BG