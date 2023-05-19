if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    export GDK_BACKEND="wayland"
    export XDG_CURRENT_DESKTOP=sway

    exec sway --unsupported-gpu --verbose > /tmp/sway.log 2>&1
fi
