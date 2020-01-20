#!/usr/bin/env sh
set -euo pipefail

BLUETOOTH_CARD_INDEX=$(pacmd list-cards | grep bluez_card -B1 | grep index | cut -d":" -f2)
ACTIVE_PROFILE=$(pacmd list-cards | grep bluez_card -A50 | grep "active profile" | cut -d":" -f2 | sed -e 's/\W//g')

if [ "$ACTIVE_PROFILE" == "headset_head_unit" ]; then
    /usr/bin/pactl set-card-profile $BLUETOOTH_CARD_INDEX "a2dp_sink_aac"
else
    /usr/bin/pactl set-card-profile $BLUETOOTH_CARD_INDEX "headset_head_unit"
fi
