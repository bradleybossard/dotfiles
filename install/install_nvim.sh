#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Install Neovim
sudo apt-get install --yes software-properties-common
sudo apt-get install --yes python-software-properties
sudo add-apt-repository --yes ppa:neovim-ppa/stable
sudo apt-get update --fix-missing
sudo apt-get install --yes neovim
sudo apt-get install --yes python-dev python-pip python3-dev python3-pip


# TODO: Have not tested the following lines for creating this VIM -> Neovim migration file
# Perform Vim to NeoVim migration step
NVIM_INIT_VIM=~/.config/nvim/init.vim
mkdir -p ~/.config/nvim
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" > $NVIM_INIT_VIM
echo "let &packpath = &runtimepath" >> $NVIM_INIT_VIM
echo "source ~/.vimrc" >> $NVIM_INIT_VIM

# Setup neovim as permanent alternative to vim
#sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
#sudo update-alternatives --config vi
#sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
#sudo update-alternatives --config vim
#sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
#sudo update-alternatives --config editor
