#!/bin/bash
# Wallpaper :
PRIMARY_BG=$HOME/.config/i3/hubble.jpg
SECOND_BG=$HOME/.config/i3/portrait.jpg
# Port list :
USBC_PORT=DP-1
INTR_PORT=eDP-1
HDMI_PORT=HDMI-1
# Monitor setup :
PRIMARY_SCREEN=$INTR_PORT
VERTICAL_SCREEN=$HDMI_PORT

xrandr \
	--output $PRIMARY_SCREEN --primary --mode 1920x1080 --pos 0x840 --rotate normal \
	--output $VERTICAL_SCREEN --mode 1920x1080 --pos 1920x0 --rotate left
sleep 1
feh --bg-scale $PRIMARY_BG --bg-scale $SECOND_BG
