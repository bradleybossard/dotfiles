# http://dev.iachieved.it/iachievedit/swift-3-0-for-ubuntu-16-04-xenial-xerus/

wget -qO- http://dev.iachieved.it/iachievedit.gpg.key | sudo apt-key add -

echo "deb http://iachievedit-repos.s3.amazonaws.com/ xenial main" | sudo tee --append /etc/apt/sources.list

sudo apt-get update

sudo apt-get install --yes swift-3.0
