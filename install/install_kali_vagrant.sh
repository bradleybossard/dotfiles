# brew install virtualbox vagrant
# sudo apt install --yes virtualbox vagrant

KALI_DIR='~/.vagrant/kali-linux'
mkdir -p  $KALI_DIR
cd $KALI_DIR
vagrant init offensive-security/kali-linux
vagrant up
vagrant ssh

