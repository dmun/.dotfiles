#/bin/bash

path=/sys/class/backlight/intel_backlight/

brightness=$(cat ${path}brightness)
max_brightness=$(cat ${path}max_brightness)

if [ $1 = "--set" ]; then
    echo $(($2 * $max_brightness / 100)) > ${path}brightness
elif [ $1 = "--dec" ]; then
    echo $(($brightness - $2)) > ${path}brightness
elif [ $1 = "--inc" ]; then
    echo $(($brightness + $2)) > ${path}brightness
fi
