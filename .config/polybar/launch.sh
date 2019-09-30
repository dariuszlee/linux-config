#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

export WIRED_CARD=$(nmcli | awk '/ethernet/ {print $1}' | head -1)
export WIRELESS_CARD=$(nmcli | awk '/wifi/ {print $1}' | head -1)
export CONNECTED_CARD=$(nmcli device status | grep ' connected ' | grep 'ethernet\|wifi' | cut -d' ' -f1 | head -n 1)

# Launch bar1 and bar2
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar top -c ~/.config/polybar/config-top.ini &
    MONITOR=$m polybar bottom -c ~/.config/polybar/config-bottom.ini &
done
