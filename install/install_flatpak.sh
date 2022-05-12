#!/bin/bash

sudo add-apt-repository --yes ppa:flatpak/stable
sudo apt update
sudo apt install --yes flatpak gnome-software-plugin-flatpak

# add flathub, best place to get flatpak apps
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "System reboot likely required!"

exit

# System needs to be restarted, use confirm y/n here
# sudo reboot

# Pixel Wheels
flatpak install --noninteractive flathub com.agateau.PixelWheels

# enve
flatpak install flathub io.github.maurycyliebner.enve
