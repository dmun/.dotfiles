#!/usr/bin/env sh

# Terminate already running bar instances
killall -9q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

## Handle DPI
dpi=$(xrdb -query | grep -oP "Xft.dpi:\s*\K\d*")
if [ -z $dpi ]; then dpi=96; fi
scaling=$(expr $dpi \* 100 / 96)
height=$(expr 30 \* $scaling / 100)
echo "polybar.height: $height" | xrdb -merge

## Launch
polybar main -c ~/.config/polybar/config.ini &
