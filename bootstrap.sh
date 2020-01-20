#!/bin/sh

sudo pacman --needed -S stow rustup npm xorg xorg-xinit numlockx redshift   \
                        rofi i3-gaps gnome-keyring dunst powerline-fonts    \
                        ttf-font-awesome ttf-dejavu ttf-liberation wget feh \
                        firefox-nightly zsh pulseaudio alacritty \
                        zsh-syntax-highlighting zsh-autosuggestions

stow --no-folding alacritty compton dunst fontconfig i3 polybar rofi systemd teiler zsh \
                  wallpapers vscode spaceship

systemctl enable --user kill-cuda-before-sleep
systemctl enable --user no-wakeup-on-usb

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

if [ ! -x "$(command -v flashfocus)" ]; then
    pb -S flashfocus-git
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
