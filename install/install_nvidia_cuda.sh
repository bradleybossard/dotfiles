#!/bin/bash

if [[ $OSTYPE == *"linux"* ]]; then
  # For Ubuntu 20.04

  # Following instructions for installing NVIDIA drivers here
  # https://www.nvidia.com/Download/index.aspx

  # CUDA Toolkit installation guide
  # https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html

  pushd .
  cd /tmp

  wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
  sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
  wget https://developer.download.nvidia.com/compute/cuda/11.4.2/local_installers/cuda-repo-ubuntu2004-11-4-local_11.4.2-470.57.02-1_amd64.deb
  sudo dpkg -i cuda-repo-ubuntu2004-11-4-local_11.4.2-470.57.02-1_amd64.deb
  sudo apt-key add /var/cuda-repo-ubuntu2004-11-4-local/7fa2af80.pub
  sudo apt-get update
  sudo apt-get -y install cuda
  popd

  # Note: env vars like the following need to be add to PATH and LD_LIBRARY
  # this has been done in the .path file, but may need to be updated based on install version of CUDA
  # export PATH=/usr/local/cuda-11.4/bin${PATH:+:${PATH}}
  # export LD_LIBRARY_PATH=/usr/local/cuda-11.4/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

  nvcc --version  # To test CUDA compiler was installed correctly.

  # prints states of Nvidia drivers / CUDA
  # may require reboot after driver install
  nvidia-smi

fi


if [[ $OSTYPE == *"darwin"* ]]; then
# Install CUDA https://gist.github.com/Mistobaan/dd32287eeb6859c6668d
  brew update
  brew install coreutils swig
  brew cask install cuda
  brew cask info cuda
fi
