#!/bin/sh
set -eu

sudo pacman --needed -S stow rustup npm gnome-keyring powerline-fonts wget \
                        wofi sway waybar mako pipewire wireplumber alacritty neovim \
                        ttf-font-awesome ttf-dejavu ttf-liberation ttf-dejavu-nerd \
                        zsh zsh-syntax-highlighting zsh-autosuggestions \
                        grim slurp wf-recorder xdg-user-dirs starship \
                        pipewire-pulse firefox-developer-edition sof-firmware \
                        fzf ripgrep htop brightnessctl gammastep wl-clipboard swaylock swayidle \
                        ethtool smartmontools polkit-gnome swaybg bolt

stow --no-folding alacritty fontconfig zsh wallpapers starship neovim sway waybar \
                  wofi

systemctl enable --now --user pipewire pipewire-pulse wireplumber xdg-desktop-portal-wlr

xdg-user-dirs-update
mkdir -p ~/Pictures/Screenshots


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

if ! pacman -Qi oh-my-zsh-git 2>/dev/null 1>/dev/null; then
    pb -S oh-my-zsh-git
fi

if ! pacman -Qi tlp 2>/dev/null 1>/dev/null; then
    sudo pacman --needed -S tlp
    sudo systemctl enable --now tlp
fi

if ! pacman -Qi mpris-proxy-service 2>/dev/null 1>/dev/null; then
    pb -S mpris-proxy-service
    systemctl --user enable mpris-proxy
fi

if ! pacman -Qi pulsemixer 2>/dev/null 1>/dev/null; then
    pb -S pulsemixer
fi

if ! pacman -Qi udiskie 2>/dev/null 1>/dev/null; then
    pb -S udiskie
fi

if ! pacman -Qi libinput-gestures 2>/dev/null 1>/dev/null; then
    pb -S libinput-gestures
fi
