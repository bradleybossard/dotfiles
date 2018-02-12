# Update version to latest
CUDA_FILE=cuda_9.1.85_387.26_linux
wget https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/$CUDA_FILE
chmod +x $CUDA_FILE
sudo ./$CUDA_FILE
