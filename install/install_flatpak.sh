# Install from PPA, official repo woefully out of date
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt update
sudo apt install --yes flatpak

sudo flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo

# System needs to be restarted, use confirm y/n here
# sudo reboot
