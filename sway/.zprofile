if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    export GDK_BACKEND="wayland"
    export XDG_CURRENT_DESKTOP=sway
    export WLR_DRM_NO_MODIFIERS=1

    exec sway --unsupported-gpu --verbose > /tmp/sway.log 2>&1
fi
