#!/bin/sh

sudo pacman --needed -S stow rustup npm xorg xorg-xinit numlockx redshift   \
                        rofi i3-wm gnome-keyring dunst powerline-fonts      \
                        ttf-font-awesome ttf-dejavu ttf-liberation wget feh \
                        zsh pulseaudio alacritty neovim                     \
                        zsh-syntax-highlighting zsh-autosuggestions

stow --no-folding alacritty compton dunst fontconfig i3 polybar rofi systemd teiler zsh \
                  wallpapers spaceship neovim

systemctl enable --user kill-cuda-before-sleep
systemctl enable --user no-wakeup-on-usb
systemctl enable --user dunst
systemctl enable --user udiskie
systemctl enable --user redshift-gtk
systemctl enable --user feh
systemctl enable --user compton

if [ "$SHELL" != "/bin/zsh" ]; then
    chsh -s /bin/zsh
fi

if [ ! -x "$(command -v pb)" ]; then
    git clone https://aur.archlinux.org/pkgbuilder.git /tmp/pkgbuilder

    pushd /tmp/pkgbuilder
    makepkg -si

    popd
    rm -rf /tmp/pkgbuilder
fi

if [ ! -d /usr/share/oh-my-zsh ]; then
    pb -S oh-my-zsh-git
fi

if [ ! -x "$(command -v starship)" ]; then
    pb -S starship
fi

if [ ! -x "$(command -v compton)" ]; then
    pb -S compton
fi

if [ ! -x "$(command -v pulsemixer)" ]; then
    pb -S pulsemixer
fi

if [ ! -x "$(command -v polybar)" ]; then
    pb -S polybar-git
fi

if [ ! -x "$(command -v code)" ]; then
    pb -S visual-studio-code-bin
fi

if [ ! -x "$(command -v starship)" ]; then
    pb -S starship
fi

if [ ! -x "$(command -v teiler)" ]; then
    pb -S teiler-git
    mkdir -p ~/Pictures/Screenshots
    mkdir -p ~/Videos/Screencasts
fi

if [ ! -x "$(command -v udiskie)" ]; then
    pb -S udiskie
fi

if [ ! -x "$(command -v firefox-nightly)" ]; then
    pb -S firefox-nightly
fi

if [ ! -f "/usr/share/fonts/TTF/DejaVu-Sans-Mono-Nerd-Font-Complete-Mono.ttf" ]; then
    pb -S nerd-fonts-dejavu-complete
fi

if [ ! -d "/usr/share/vim-plug" ]; then
    pb -S vim-plug
fi
