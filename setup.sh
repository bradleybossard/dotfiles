#!/bin/bash
set -o errexit  # fail on any non-zero return value
set -o nounset

function install_basics () {
  if [[ $OSTYPE == *"linux"* ]]; then
    sudo apt-get update --fix-missing
    sudo apt-get install --yes \
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


function install_oh_my_zshell () {
  rm -rf $HOME/.oh-my-zsh
  # Set default shell to zsh
  chsh -s $(which zsh) $USER
  # Install Oh My Zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

function install_antigen () {
  echo point1
  rm -rf $HOME/.antigen
  rm -rf $HOME/.antigen.zsh
  echo point2
  # Set default shell to zsh
  chsh -s $(which zsh) $USER
  echo point3
  # Install antigen
  curl -L git.io/antigen > $HOME/.antigen.zsh
  echo point4
}

# Install fzf
function install_fzf () {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}


install_basics
#install_antigen
# TODO: Needs debugging to figure out how to install OMZ, then override with my .zshrc
#install_oh_my_zshell
create_symlinks
install_vundle
install_tmux
install_fzf
