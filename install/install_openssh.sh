#!/bin/bash

# Set up 2FA for SSH
# https://www.digitalocean.com/community/tutorials/how-to-set-up-multi-factor-authentication-for-ssh-on-ubuntu-16-04

sudo apt-get install --yes --fix-broken

sudo apt-get install --yes openssh-server

sudo service ssh status
