#!/bin/bash

sudo add-apt-repository --yes ppa:pipewire-debian/pipewire-upstream

sudo apt update
sudo apt install --yes pipewire pipewire-audio-client-libraries


sudo apt install --yes gstreamer1.0-pipewire libpipewire-0.3-{0,dev,modules} libspa-0.2-{bluetooth,dev,jack,modules} pipewire{,-{audio-client-libraries,pulse,media-session,bin,locales,tests}}
systemctl --user daemon-reload

systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user --now enable pipewire pipewire-pulse


pactl info

# The following two commands may be needed if Ubuntu Settings => Sounds only shows dummy device
# sudo touch /usr/share/pipewire/media-session.d/with-pulseaudio 
# systemctl restart --user pipewire pipewire-media-session pipewire-pulse
