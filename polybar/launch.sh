#!/usr/bin/env sh

# Terminate already running bar instances
killall -9q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

## Handle DPI
dpi=$(xrdb -query | grep "Xft.dpi:" | cut -f 2)
if [[ -n $dpi ]]; then
    scaling=$(expr $dpi \* 100 / 96)
    height=$(expr 30 \* $scaling / 100)
fi

## Launch
for m in $(polybar --list-monitors | cut -d ":" -f1); do
    HEIGHT=$height MONITOR=$m polybar --reload main -c ~/.config/polybar/config.ini &
done
