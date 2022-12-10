#!/bin/bash
pushd .
cd /tmp
# Won't get the latest version, but should prompt to upgrade
wget https://installers.privateinternetaccess.com/download/pia-linux-3.3.1-06924.run
chmod 755 pia-linux*
./pia-linux*
popd
