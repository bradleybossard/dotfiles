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

flatpak install --noninteractive flathub com.agateau.PixelWheels
flatpak install --noninteractive flathub io.github.maurycyliebner.enve
flatpak install --noninteractive flathub org.tuxfamily.StuntRally
flatpak install --noninteractive flathub com.github.KRTirtho.Spotube
flatpak install --noninteractive flathub app.xemu.xemu
flatpak install --noninteractive flathub org.synfig.SynfigStudio
flatpak install --noninteractive flathub org.freecadweb.FreeCAD
flatpak install --noninteractive flathub io.github.OpenToonz
