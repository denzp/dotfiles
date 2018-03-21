numlockx &
redshift &

dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

export SSH_AUTH_SOCK
export TERMINAL=alacritty

export QT_AUTO_SCREEN_SCALE_FACTOR=1

xrdb -merge ~/.Xresources
xrandr --dpi 144
xrandr --output DP-2 --mode 3840x2160
xrandr --output DP-0 --mode 3840x2160 --right-of DP-2 --primary

exec i3
