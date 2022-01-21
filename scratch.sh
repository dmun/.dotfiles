#!/bin/bash

TERM=kitty

if [ "$(ps -x | grep -c 'scratchpad')" -eq "1" ]; then
    $TERM --title Scratchpad --class scratchpad &
else
    xdotool search --class scratchpad | xargs -i sh -c 'bspc node {} -g hidden -f'
fi
