#!/bin/bash

# add hashicorp apt repository
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository --yes "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# install vagrant
sudo apt-get update --fix-missing
sudo apt-get install --yes virtualbox vagrant

exit


# For installing and running vagrant with libvirt
sudo apt-get install libvirt-dev
newgrp libvirt

vagrant plugin install --yes vagrant-libvirt

# Cannot use a standard box for libvirt
vagrant init generic/ubuntu2004

# export VAGRANT_DEFAULT_PROVIDER=libvirt

# Must specify libvirt as provider
vagrant up --provider=libvirt
