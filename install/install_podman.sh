#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
  echo "Not running as root, use 'sudo -s' to become root"
  exit
fi

apt install --yes podman

# This is needed b/c podman isn't setup to talk to dockerhub by default
# TODO: ideally this is a sed command to replace the existing commented out line
echo 'unqualified-search-registries=["docker.io"]' >> /etc/containers/registries.conf

