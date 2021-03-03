#!/bin/bash

STATE=$(xrandr | grep -w connected | grep -w '1080x1920' | wc -l)
if [ "$STATE" = "1" ]
then
	xrandr --output HDMI-0 --rotate normal --auto --same-as eDP-1-1 --auto
	echo "set mirror screen"
	echo $STATE
else
	sh $HOME/.config/i3/screen_setup.sh
	echo "reset screen"
	echo $STATE
fi