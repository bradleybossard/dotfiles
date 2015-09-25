#!/bin/bash

# Copy all dotfiles in this directory to home
for file in $files; do
  if [ ! -h ~/$file ]; then
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

