#!/bin/bash
set -eu

# verify if the dock is connected
lsusb | grep "Dock" > /dev/null

# verify lid state - closed or open
if grep -q open /proc/acpi/button/lid/LID/state; then
    swaymsg output eDP-1 enable
else
    swaymsg output eDP-1 disable
fi
