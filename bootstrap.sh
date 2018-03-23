#!/bin/sh

sudo pacman --needed -S stow rustup npm xorg xorg-xinit numlockx redshift   \
                        rofi i3-gaps gnome-keyring dunst powerline-fonts    \
                        ttf-font-awesome ttf-dejavu ttf-liberation wget feh \
                        firefox-developer-edition compton zsh pulseaudio

stow --no-folding alacritty compton dunst fontconfig i3 polybar rofi systemd teiler zsh wallpapers

systemctl enable --user eyes.timer
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

if [ ! -f /usr/share/oh-my-zsh/custom/themes/spaceship.zsh-theme ]; then
    sudo git clone https://github.com/denysdovhan/spaceship-prompt.git /usr/share/oh-my-zsh/custom/themes/spaceship-prompt
    sudo ln -s /usr/share/oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme /usr/share/oh-my-zsh/custom/themes/spaceship.zsh-theme
fi

if [ ! -x "$(command -v alacritty)" ]; then
    rustup toolchain install nightly
    rustup default nightly
    pb -S alacritty-git
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

if [ ! -x "$(command -v teiler)" ]; then
    pb -S teiler-git
    mkdir -p ~/Pictures/Screenshots
    mkdir -p ~/Videos/Screencasts
fi
