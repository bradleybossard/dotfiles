#!/bin/bash

# Copy all dotfiles in this directory to home
files=$(for f in \.*; do [[ -d "$f" ]] || echo "$f"; done)
for file in $files; do
  unlink ~/$file
  ln -s `pwd`/$file ~/$file
done

# Setup my preferred Git configuration
GIT_AUTHOR_NAME="Bradley Bossard"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="bradleybossard@gmail.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global core.autocrlf input


rm -rf ~/.vim/bundle
#Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/mattn/emmet-vim.git ~/.vim/bundle

#Install Vundle Bundles
vim +BundleInstall +qall

echo
echo 'Run command source ~/.bashrc'

