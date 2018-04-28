#!/bin/bash
set -o errexit  # fail on any non-zero return value
set -o nounset

function install_basics () {
  if [[ $OSTYPE == *"linux"* ]]; then
    sudo apt-get update --fix-missing
    sudo apt-get install --yes \
      autojump \
      apt-file \
      curl \
      exuberant-ctags \
      git \
      jq \
      silversearcher-ag \
      tree \
      tmux \
      tig \
      vim \
      wget
    sudo apt-file update
  fi
}

# Create symlinks from home dir to files in this repo
function create_symlinks () {
  for file in $(find . -mindepth 1 -prune -name '.*' -exec basename {} \; | egrep -v ".git$|.DS_Store$"); do
    echo $file
    ln -fs `pwd`/$file ~/$file
  done
}

#Install Vundle and Bundles
function install_vundle () {
  rm -rf ~/.vim/bundle
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  vim +PluginInstall +qall
}

# Install tmux plugins
function install_tmux () {
  rm -rf ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  $HOME/.tmux/plugins/tpm/bin/install_plugins
}

# Install fzf
function install_fzf () {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}

# TODO: Create prompt to remind to install zsh if not yet installed
install_basics
create_symlinks
install_vundle
install_tmux
install_fzf
