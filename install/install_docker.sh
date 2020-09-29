#!/bin/bash

# remove any installed versions
sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install --yes \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

# add and verify key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# add repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install --yes docker-ce docker-ce-cli containerd.io

sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
sudo docker run hello-world

# configure docker to run on boot
# sudo systemctl enable docker

# install docker via snap
#sudo snap install docker
#END
