#/bin/bash

path=/sys/class/backlight/intel_backlight/brightness
# path=test

brightness=$(cat $path)

if [ $1 = "dec" ]; then
    sed -i "s/${brightness}/$(( $brightness - 500 ))/g" $path
elif [ $1 = "inc" ]; then
    sed -i "s/${brightness}/$(( $brightness + 500 ))/g" $path
fi
