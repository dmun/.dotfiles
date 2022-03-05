#!/bin/sh
bspc subscribe desktop_swap report | while read event; do
    layout="$(bspc query -T -d | jq -r '.userLayout')"
    if [ $layout = "monocle" ]; then
        echo ""
    elif [ $layout = "tiled" ]; then
        echo ""
    else
        echo "?"
    fi
done
