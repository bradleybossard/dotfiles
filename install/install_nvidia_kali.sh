# From the Kali docs
# https://docs.kali.org/general-use/install-nvidia-drivers-on-kali-linux

# Update all packages
apt update && apt dist-upgrade -y

# Reboot
reboot

# Install nvidia packages
apt install -y ocl-icd-libopencl1 nvidia-driver nvidia-cuda-toolkit

# Verify install
nvidia-smi
