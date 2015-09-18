#!/bin/bash

# Copy all dotfiles in this directory to home
files=$(for f in \.*; do [[ -d "$f" ]] || echo "$f"; done)
for file in $files; do
  unlink ~/$file
  ln -s `pwd`/$file ~/$file
done

rm -rf ~/.vim/bundle
#Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#Install Vundle Bundles
vim +BundleInstall +qall

echo
echo 'Run command source ~/.bashrc'

