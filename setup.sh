#!/bin/bash

# Copy all dotfiles in this directory to home
for file in $(find . -maxdepth 1 -not -type d | grep "./\." | sed 's/.\/././'); do
  # Delete file or link if it exists
  if [ -e ~/$file ]; then
    rm ~/$file
  fi

  # Create link to file in dotfiles repo
  ln -s `pwd`/$file ~/$file
done

rm -rf ~/.vim/bundle
#Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#Install Vundle Bundles
vim +BundleInstall +qall

echo
echo 'Run command source ~/.bashrc'

