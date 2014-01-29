ln -s `pwd`/.vimrc ~/.vimrc

#Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#Install Vundle Bundles
vim +BundleInstall +qall
