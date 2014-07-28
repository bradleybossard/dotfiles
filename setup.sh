#!/bin/bash

for filename in '.coolcommands.sh' '.vimrc' '.bashrc' '.tmux.conf' '.gitconfig' '.ackrc'
do
  unlink ~/$filename
  ln -s `pwd`/$filename ~/$filename 
done

# Git credentials
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

#for filename in $(find ~/.vim/); do flip -u $filename; done;

#Install Vundle Bundles
vim +BundleInstall +qall

#for filename in $(find ~/.vim/); do flip -u $filename; done;

echo
echo 'Run command source ~/.bashrc'
