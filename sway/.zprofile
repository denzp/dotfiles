if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
    export GDK_BACKEND="wayland"
    export XDG_CURRENT_DESKTOP=sway

    CHOICE=$(dialog \
        --clear --menu "Choose one of the following options:" \
        15 40 4 \
        igpu "Intel GPU" \
        egpu "External GPU" \
        projector "External GPU (projector)" \
        hybrid "External GPU + Intel GPU" \
        2>&1 >/dev/tty
    )

    clear
    case $CHOICE in
            igpu)
                ln -sf igpu.yml .config/alacritty/addon.yml
                gsettings set org.gnome.desktop.interface text-scaling-factor 1.0
                export WLR_DRM_DEVICES=`readlink -f /dev/dri/by-path/pci-0000:00:02.0-card`
                ;;
            hybrid)
                ln -sf igpu.yml .config/alacritty/addon.yml
                gsettings set org.gnome.desktop.interface text-scaling-factor 1.0
                export WLR_DRM_DEVICES=`readlink -f /dev/dri/by-path/pci-0000:00:02.0-card`:`readlink -f /dev/dri/by-path/pci-0000:31:00.0-card`:`readlink -f /dev/dri/by-path/pci-0000:0b:00.0-card`
                ;;
            egpu)
                ln -sf egpu.yml .config/alacritty/addon.yml
                gsettings set org.gnome.desktop.interface text-scaling-factor 1.3
                export WLR_DRM_DEVICES=`readlink -f /dev/dri/by-path/pci-0000:31:00.0-card`:`readlink -f /dev/dri/by-path/pci-0000:0b:00.0-card`
                ;;
            projector)
                ln -sf igpu.yml .config/alacritty/addon.yml
                gsettings set org.gnome.desktop.interface text-scaling-factor 1.0
                export WLR_DRM_DEVICES=`readlink -f /dev/dri/by-path/pci-0000:31:00.0-card`:`readlink -f /dev/dri/by-path/pci-0000:0b:00.0-card`
                ;;
    esac

    exec sway --unsupported-gpu --verbose > /tmp/sway.log 2>&1
fi
