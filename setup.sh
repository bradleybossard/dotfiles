#!/bin/bash

if [[ $OSTYPE == *"linux"* ]]; then
  sudo apt-get update --fix-missing
  sudo apt-get install --yes vim git tmux
fi

# Create symlinks from home dir to files in this repo
for file in $(find . -maxdepth 1 -not -type d | grep "./\." | sed 's/.\/././'); do
  # Delete file or link if it exists
  if [ -e ~/$file ]; then
    rm ~/$file
  fi

  ln -s `pwd`/$file ~/$file
done

rm -rf ~/.vim/bundle
#Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#Install Vundle Bundles
vim +BundleInstall +qall

# Install tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo
echo 'Run command source ~/.bashrc'

