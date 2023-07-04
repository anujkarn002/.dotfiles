#!/bin/bash

# install packages from the official repository
echo "Installing pacman packages..."
sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist_pacman.txt))
echo "...done"

echo "Installing AUR packages..."
# install unofficial packages from AUR repository
yay -S --needed --noconfirm - < ./pkglist_aur.txt
echo "...done"

# clone tpm for tmux
echo "Downloading tpm for tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install other tools/packages without package managers
echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install fm6000
echo "Installing fm6000"
sh -c "$(curl https://raw.githubusercontent.com/anhsirk0/fetch-master-6000/master/install.sh)"
