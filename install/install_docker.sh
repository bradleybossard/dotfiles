#!/bin/bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

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
sudo add-apt-repository --yes \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
  # note : if using a non-LTS release, you may need to replace
  # $(lsb_release -cs) with the specfic LTS name, i.e. xenial for 20.04

sudo apt-get update
sudo apt-get install --yes docker-ce docker-ce-cli containerd.io

newgrp docker
sudo addgroup --system docker
sudo adduser $USER docker
sudo docker run hello-world

# This is needed b/c podman isn't setup to talk to dockerhub by default
# TODO: ideally this is a sed command to replace the existing commented out line
echo 'unqualified-search-registries=["docker.io"]' >> /etc/containers/registries.conf

# configure docker to run on boot
# sudo systemctl enable docker

# install docker via snap
#sudo snap install docker
#END
