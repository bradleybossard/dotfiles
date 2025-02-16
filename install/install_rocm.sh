sudo apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
sudo usermod -a -G render,video $LOGNAME # Adding current user to Video, Render groups. See prerequisites.
wget https://repo.radeon.com/amdgpu-install/6.1.1/ubuntu/jammy/amdgpu-install_6.1.60101-1_all.deb
sudo apt install --yes ./amdgpu-install_6.1.60101-1_all.deb
sudo apt update
sudo apt install --yes amdgpu-dkms
sudo apt install --yes rocm
echo "Please reboot system for all settings to take effect."
