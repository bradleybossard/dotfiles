# askubuntu.com answers
# https://askubuntu.com/a/951892/241826
# https://askubuntu.com/a/149224/241826

# CUDA install guide
# http://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#ixzz4rQODN0jy

# 1. Download the driver from the nvidia website
# http://www.nvidia.com/Download/index.aspx

# 2. If Nouveau driver needs to be disabled, follow these steps. 
# sudo vi /etc/modprobe.d/blacklist-nouveau.conf
# Add the following lines
# blacklist nouveau
# options nouveau modeset=0
sudo sh -c 'echo blacklist nouveau > /etc/modprobe.d/blacklist-nouveau.conf'
sudo sh -c 'echo options nouveau modeset=0 >> /etc/modprobe.d/blacklist-nouveau.conf'

# Regenerate the kernel initramfs
sudo update-initramfs -u

# Reboot the machine
sudo reboot

# NOTE: On 2018-05-17, while install the NVIDIA driver on Ubuntu 18.04, the follow step 3.
# was not needed.  Simply running the NVIDIA install shell script under X was able to
# successfully install the driver
# 3. Install the NVIDIA driver
# Hit Ctrl + Alt + F1
# Kill X Server
#sudo service lightdm stop
#sudo init 3

# cd to directory where driver installer is and change permissions to executable
cd ~/Downloads
chmod +x ./NVIDIA-Linux-*

# Run the installer
sudo ./NVIDIA-Linux-whatever-driver-version.sh

# After installer is finished, reboot
sudo reboot

# Verify driver is working
nvidia-smi
