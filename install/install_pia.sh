#!/bin/bash
pushd .
cd /tmp
# Won't get the latest version, but should prompt to upgrade
wget https://installers.privateinternetaccess.com/download/pia-linux-3.7-08412.run
chmod 755 pia-linux*
./pia-linux*
popd
