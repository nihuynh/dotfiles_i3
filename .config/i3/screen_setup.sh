#!/bin/bash

PRIMARY_BG=~/Pictures/sm-navette-spatiale-iss-station-spatiale-01.jpg
SECOND_BG=~/Pictures/hubble-1080x1920-space-galaxy-8k-17387.jpg

xrandr \
	--output eDP-1-1 --primary --mode 1920x1080 --pos 0x840 --rotate normal \
	--output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate right
sleep 1
feh --bg-scale $PRIMARY_BG --bg-scale $SECOND_BG