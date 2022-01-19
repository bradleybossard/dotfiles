#!/bin/bash

sudo apt install --yes guitarix

# Needed for realtime tuner use in guitarix
sudo adduser $USER audio

# might require restart
