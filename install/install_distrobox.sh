#!/usr/bin/env bash

sudo add-apt-repository --yes ppa:michel-slm/distrobox
sudo apt update
sudo apt install --yes distrobox

# see disk usage
# podman system df -v


# dbx create --clone ubuntu-base --name <instance-name>
# dbx enter autism -- distrobox-export --app brave-browser --export-label brave-<instance-name>

# distrobox-export --app brave-browser --export-label brave-<whatever>

# to edit distrobox-export entries
# ll ~/.local/share/applications
# and find corresponding entry and edit with vi
