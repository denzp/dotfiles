#!/usr/bin/env sh

DEFAULT_SINK_NAME=$(pacmd info | grep "Default sink name" | cut -d":" -f2)

if [ "$1" == "set-sink-volume" ]; then
    /usr/bin/pactl set-sink-mute $DEFAULT_SINK_NAME 0
fi

/usr/bin/pactl $1 $DEFAULT_SINK_NAME $2