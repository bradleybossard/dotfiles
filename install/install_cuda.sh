#/bin/sh

if [[ $OSTYPE == *"linux"* ]]; then
  # TODO: Revisit these instructions, this url is no longer live
  # Update version to latest
  # CUDA_FILE=cuda_9.1.85_387.26_linux
  # wget https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/$CUDA_FILE
  # chmod +x $CUDA_FILE
  # sudo ./$CUDA_FILE
fi


if [[ $OSTYPE == *"darwin"* ]]; then
# Install CUDA https://gist.github.com/Mistobaan/dd32287eeb6859c6668d 
  brew update
  brew install coreutils swig
  brew cask install cuda
  brew cask info cuda
fi
