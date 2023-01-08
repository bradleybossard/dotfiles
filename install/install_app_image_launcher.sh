#/bin/bash

gh install TheAssassin/AppImageLauncher

# Run command to install after downloaded via gh install
~/.local/bin/appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage install

# AppImages require FUSE to run
sudo add-apt-repository universe
sudo apt install --yes libfuse2
