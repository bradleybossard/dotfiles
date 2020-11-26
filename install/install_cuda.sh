#!/bin/bash


# install cuda ppa
# sudo wget -O /etc/apt/preferences.d/cuda-repository-pin-600 https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
# sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
# sudo add-apt-repository --yes "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"

exit

sudo apt install --yes cuda



# https://support.system76.com/articles/cuda/
# For PopOS with Nvidia driver pre-installed
# CUDA
# sudo apt install --yes system76-cuda-latest
# CuDNN
# sudo apt install --yes system76-cudnn-10.2




if [[ $OSTYPE == *"linux"* ]]; then
  # TODO: Revisit these instructions, this url is no longer live
  # Update version to latest
  CUDA_VERSION=10.0
  # CUDA_FILE=cuda_9.1.85_387.26_linux
  CUDA_FILE=cuda_10.0.130_410.48_linux
  # wget https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/$CUDA_FILE
  # wget https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/$CUDA_FILE
  pushd .
  cd ~/Downloads
  wget https://developer.nvidia.com/compute/cuda/$CUDA_VERSION/Prod/local_installers/$CUDA_FILE
  chmod +x $CUDA_FILE
  sudo ./$CUDA_FILE
  # TODO: Try the command below to test full NVIDIA driver / CUDA install
  # sudo $CUDA_FILE --silent --driver --toolkit --samples
  # TODO: Haven't tried command below, but don't think the
  # flags are correct for the CUDA installer
  #sudo $CUDA_FILE \
  # --ui=none \
  # --no-questions \
  # --accept-license \
  # --disable-nouveau \
  # --no-cc-version-check \
  # --dkms

  nvcc --version  # To test CUDA compiler was installed correctly.
  popd
fi


if [[ $OSTYPE == *"darwin"* ]]; then
# Install CUDA https://gist.github.com/Mistobaan/dd32287eeb6859c6668d
  brew update
  brew install coreutils swig
  brew cask install cuda
  brew cask info cuda
fi
