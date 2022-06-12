#!/bin/bash
sudo add-apt-repository ppa:kisak/kisak-mesa && \
sudo dpkg --add-architecture i386 && \
sudo apt update && \
sudo apt upgrade && \
sudo apt install libgl1-mesa-dri:i386 mesa-vulkan-drivers mesa-vulkan-drivers:i386

