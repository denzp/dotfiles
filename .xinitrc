numlockx

export TERMINAL=alacritty

export GDK_SCALE=1.3
export GDK_DPI_SCALE=1.3
export CLUTTER_SCALE=1.3

xrandr --dpi 155
xrandr --output DVI-D-0 --mode 1920x1080
xrandr --output DP-0    --mode 3840x2160 --primary --right-of DVI-D-0

exec i3
