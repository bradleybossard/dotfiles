#!/bin/bash
set -o errexit  # fail on any non-zero return value
set -o nounset

function install_basics () {
  if [[ $OSTYPE == *"linux"* ]]; then
    sudo dnf update --assumeyes
    sudo dnf install --assumeyes --skip-unavailable \
      autojump \
      apt-file \
      copyq \
      exuberant-ctags \
      feh \
      nala \
      ncdu \
      neovim \
      ripgrep \
      tmux \
      tig \
      units \
      xclip \
      zsh
  fi

  # Already installed fedora
  # curl \
  # git \
  # jq \
  # rename \
  # tree \
  # wget \

  # Removing in favor of neovim
  # vim
}

# Create symlinks from home dir to files in this repo
function create_symlinks () {
  for file in $(find . -mindepth 1 -prune -name '.*' -exec basename {} \; | grep -E -v ".git$|.DS_Store$"); do
    echo $file
    ln -fs `pwd`/$file ~/$file
  done
}

#Install Vundle and Bundles
#function install_vundle () {
#  rm -rf ~/.vim/bundle
#  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#  vim +PluginInstall +qall
#}

# Install tmux plugins
function install_tmux () {
  rm -rf ~/.tmux/plugins
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  $HOME/.tmux/plugins/tpm/bin/install_plugins
}

# Install fzf
function install_fzf () {
  rm -rf ~/.fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --key-bindings --completion --no-update-rc
}

function install_zsh () {
  # install zsh and change default shell to zsh
  sudo apt-get install --yes curl zsh
  chsh -s $(which zsh) $USER

  # install zplug
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

  echo 'reminder: logout and log back into use zsh as default'
}

install_basics
create_symlinks
#install_vundle
install_tmux
install_fzf
#install_zsh
