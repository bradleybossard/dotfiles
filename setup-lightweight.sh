sudo apt install --yes curl git vim

cd $HOME

curl https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.gitconfig > .gitconfig
curl https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.vimrc_noplugins > .vimrc
curl https://raw.githubusercontent.com/bradleybossard/dotfiles/master/.inputrc > .inputrc
