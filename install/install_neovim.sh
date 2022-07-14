#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Install Neovim
sudo add-apt-repository --yes ppa:neovim-ppa/stable
sudo apt-get update --fix-missing
sudo apt-get install --yes neovim

# Setup neovim as permanent alternative to vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
