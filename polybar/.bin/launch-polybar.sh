#!/usr/bin/env sh

# Terminate already running polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar DP-0 &
polybar DP-2 &
polybar LVDS-1 &
polybar VGA-1 &

