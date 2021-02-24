#!/bin/bash

TSLOCK=/tmp/screen.png
ICON="$HOME/.config/i3/lock_icon.png"
scrot $TSLOCK
convert $TSLOCK -scale 20% -scale 500% $TSLOCK
pactl set-sink-mute @DEFAULT_SINK@ on
if [[ -f $ICON ]]
then
    # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file $ICON | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)
    SR=$(xrandr | grep -w connected | awk -F'[ ]' '{print $3,$4}' | sed -e 's/ right//' -e 's/primary //')
    for RES in $SR
    do
        # monitor position/offset
        SRX=$(echo $RES | cut -d'x' -f 1)
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2)
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3)
        PX=$(($SROX + $SRX / 2 - $RX / 2))
        PY=$(($SROY + $SRY / 2 - $RY / 2))
        convert $TSLOCK $ICON -geometry +$PX+$PY -composite -matte $TSLOCK
    done
fi
i3lock --ignore-empty-password --show-failed-attempts -i $TSLOCK -n; pactl set-sink-mute @DEFAULT_SINK@ off
rm $TSLOCK