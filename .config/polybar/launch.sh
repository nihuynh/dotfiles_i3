#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar
#polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
sleep 1
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar $m &
  done
else
  polybar general &
fi
