#!/usr/bin/env bash


sudo apt install --yes podman

exit

# To install podman compose, use the following

sudo apt install -y podman-docker

sudo curl -SL https://github.com/docker/compose/releases/download/v2.36.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose\n
sudo chmod +x /usr/local/bin/docker-compose\n

systemctl --user enable --now podman.socket
systemctl --user status podman.socket

