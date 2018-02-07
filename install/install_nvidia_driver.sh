# askubuntu.com answers
# https://askubuntu.com/a/951892/241826
# https://askubuntu.com/a/149224/241826

# 1. Download the driver from the nvidia website

# 2. If Nouveau driver needs to be disabled, follow these steps. 
sudo vi /etc/modprobe.d/blacklist-nouveau.conf
# Add the following lines
blacklist nouveau
options nouveau modeset=0

# Regenerate the kernel initramfs
sudo update-initramfs -u

# Reboot the machine
sudo reboot

# 3. Install the NVIDIA driver
# Hit Ctrl + Alt + F1
# Kill X Server
sudo service lightdm stop

sudo init 3

# cd to directory where driver installer is and change permissions to executable
cd ~/Downloads
chmod +x ./NVIDIA-Linux-*

# Run the installer
sudo ./NVIDIA-Linux-whatever-driver-version.sh

# After installer is finished, reboot
sudo reboot


