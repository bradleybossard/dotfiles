#!/bin/bash
set -o errexit  # fail on any non-zero return value
set -o nounset

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

# Create symlinks from home dir to files in this repo
for file in $(find . -mindepth 1 -prune -name '.*' | egrep -v ".git$|.DS_Store$"); do
  echo $file
  ln -fs `pwd`/$file ~/$file
done

#Install Vundle
rm -rf ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#Install Vundle Bundles
vim +PluginInstall +qall

# Install tmux plugins
rm -rf ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

echo
echo 'Run command source ~/.bashrc'

