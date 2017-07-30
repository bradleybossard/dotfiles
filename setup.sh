#!/bin/bash
set -o errexit  # fail on any non-zero return value

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


#Install Vundle
rm -rf ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#Install Vundle Bundles
vim +PluginInstall +qall

# Install tmux plugins
rm -rf ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo
echo 'Run command source ~/.bashrc'

