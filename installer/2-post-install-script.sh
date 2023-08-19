#!/bin/sh

# Install yay
git clone https://aur.archlinux.org/yay.git
mv yay ~/.config
cd ~/.config/yay
makepkg -si

# Install all packages
yay -Syu --needed $(cat ~/Dotfiles/installer/installed-packages/packages-for-script.txt)
