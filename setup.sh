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
git clone https://github.com/mattn/emmet-vim.git ~/.vim/bundle

#Install Vundle Bundles
vim +BundleInstall +qall

echo
echo 'Run command source ~/.bashrc'

