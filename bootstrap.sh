sudo pacman -S stow rustup npm xorg xorg-xinit numlockx redshift rofi i3-gaps gnome-keyring dunst powerline-fonts ttf-font-awesome ttf-dejavu ttf-liberation noto-fonts wget feh firefox-developer-edition compton

chsh -s /bin/zsh
stow --no-folding alacritty compton dunst fontconfig i3 polybar rofi systemd teiler zsh wallpapers

if ! [ -x "$(command -v pb)" ]; then
    git clone https://aur.archlinux.org/pkgbuilder.git /tmp/pkgbuilder

    pushd /tmp/pkgbuilder
    makepkg -si

    popd
    rm -rf /tmp/pkgbuilder
fi

if ! [ -d /usr/share/oh-my-zsh ]; then
    pb -S oh-my-zsh-git
fi

if ! [ -d $ZSH_CUSTOM/themes/spaceship.zsh-theme ]; then
    sudo git clone https://github.com/denysdovhan/spaceship-prompt.git $ZSH_CUSTOM/themes/spaceship-prompt
    sudo ln -s $ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme $ZSH_CUSTOM/themes/spaceship.zsh-theme
fi

if ! [ -x "$(command -v alacritty)" ]; then
    rustup toolchain install nightly
    rustup default nightly
    pb -S alacritty-git
fi

if ! [ -x "$(command -v polybar)" ]; then
    pb -S polybar
fi

if ! [ -x "$(command -v code)" ]; then
    pb -S visual-studio-code-bin
fi
