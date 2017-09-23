export TERMINAL=alacritty

export GDK_SCALE=1.3
export GDK_DPI_SCALE=1.3
export CLUTTER_SCALE=1.3

xrandr --dpi 125
xrandr --output DVI-D-0	--scale 2x2 --mode 1920x1080 --pos 0x0 --fb 1920x1080
xrandr --output DP-0 	--scale 1x1 --mode 3840x2160 --pos 1920x0

exec i3
