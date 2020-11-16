#!/bin/bash
pushd .
cd /tmp
sudo apt-get install --yes openvpn network-manager-openvpn network-manager-openvpn-gnome
wget https://www.privateinternetaccess.com/installer/pia-nm.sh
sudo bash pia-nm.sh
popd
