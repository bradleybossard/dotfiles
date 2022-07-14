#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Install Neovim
sudo add-apt-repository --yes ppa:neovim-ppa/stable
sudo apt-get update --fix-missing
sudo apt-get install --yes neovim

# Setup neovim as permanent alternative to vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
#sudo update-alternatives --config vi
exit

# These may yet be needed
# sudo apt-get install --yes software-properties-common
# sudo apt-get install --yes python-software-properties
# sudo apt-get install --yes python-dev python-pip python3-dev python3-pip
