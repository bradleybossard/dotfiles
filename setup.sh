
for filename in '.vimrc' '.bashrc'
do
  rm ~/$filename
  ln -s `pwd`/$filename ~/$filename 
done

rm -rf ~/.vim/bundle
#Install Vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

#Install Vundle Bundles
vim +BundleInstall +qall
