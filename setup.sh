#!/bin/bash

# Copy all dotfiles in this directory to home
for file in $(find . -maxdepth 1 -not -type d | grep "./\." | sed 's/.\/././'); do
  if [ ! -h ~/$file ]; then
    rm ~/$file
    ln -s `pwd`/$file ~/$file
  fi
done

rm -rf ~/.vim/bundle
#Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#Install Vundle Bundles
vim +BundleInstall +qall

echo
echo 'Run command source ~/.bashrc'

