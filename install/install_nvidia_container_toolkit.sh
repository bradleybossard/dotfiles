#!/bin/bash

pushd .

cd /tmp

#curl https://get.docker.com | sh \
#  && sudo systemctl start docker \
#  && sudo systemctl enable docker

#distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
distribution=$(. /etc/os-release;echo $ID_LIKE$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update

sudo apt-get install --yes nvidia-docker2

sudo systemctl restart docker

sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi

popd