#!/bin/bash

## declare an array variable
#declare -a arr=("element1" "element2" "element3")

## now loop through the above array
#for i in "${arr[@]}"
#do
#   echo "$i"
   # or do whatever with individual element of the array
#done

# You can access them using echo "${arr[0]}", "${arr[1]}" also


#declare -a arr=(".coolcommands.sh") # ".vimrc" ".bashrc" ".tmux.conf")
#for filename in "${arr[@]}"

for filename in '.coolcommands.sh' '.vimrc' '.bashrc' '.tmux.conf' '.gitconfig' '.ackrc' '.pylintrc'
do
  unlink ~/$filename
  ln -s `pwd`/$filename ~/$filename 
done


#b='.gitconfig .ackrc .pylintrc svnlog.sh'
#for filename in '.coolcommands.sh' '.vimrc'
#'.bashrc' '.tmux.conf' '.gitconfig' '.ackrc' '.pylintrc' 'svnlog.sh'

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
