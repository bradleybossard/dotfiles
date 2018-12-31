sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
# TODO: Figure out how to query apt-get for latest driver version
sudo apt install --yes nvidia-driver-396
sudo reboot

sudo apt install --yes steam
