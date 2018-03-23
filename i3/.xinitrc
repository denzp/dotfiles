numlockx &
redshift &

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

export SSH_AUTH_SOCK
export TERMINAL=alacritty

export QT_AUTO_SCREEN_SCALE_FACTOR=0
export QT_SCALE_FACTOR=1

xrdb -merge ~/.Xresources

if [ -f ~/.xinitrc.local/$(hostname) ]; then
    source ~/.xinitrc.local/$(hostname)
fi

if [ -f ~/.Xresources.local/$(hostname) ]; then
    xrdb -merge ~/.Xresources.local/$(hostname)
fi

exec ~/.bin/launch-i3.sh
