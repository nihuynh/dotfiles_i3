#!/bin/bash
# Wallpaper :
PRIMARY_BG=$HOME/.config/i3/hubble.jpg
SECOND_BG=$HOME/.config/i3/portrait.jpg
# Port list :
USBC_PORT=DP-1
INTR_PORT=eDP-1
HDMI_PORT=HDMI-1
# Monitor setup :
PRIMARY_SCREEN=DP-1-1
VERTICAL_SCREEN=DP-1-8

sleep 1
if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 3 ]]; then
	xrandr \
	--output $PRIMARY_SCREEN --primary \
	--output $VERTICAL_SCREEN --rotate right \
	--output $INTR_PORT
	sleep 1
	feh --bg-scale $PRIMARY_BG --bg-scale $PRIMARY_BG --bg-scale $SECOND_BG
else
	xrandr \
	--output $INTR_PORT --primary --pos 0x320 \
	--output HDMI-1 --pos 1920x0 --rotate left
	sleep 1
	feh --bg-scale $PRIMARY_BG --bg-scale $SECOND_BG
fi
xinput set-button-map 12 1 0 3
