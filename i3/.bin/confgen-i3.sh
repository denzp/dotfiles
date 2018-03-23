#!/usr/bin/env sh

CONFIG="/tmp/i3config"

cat ~/.config/i3/config > "$CONFIG"

if [ -f ~/.config/i3/config.local/$(hostname) ]; then
    cat ~/.config/i3/config.local/$(hostname) >> "$CONFIG"
fi

echo $CONFIG