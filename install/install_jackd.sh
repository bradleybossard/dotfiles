#!/bin/bash

sudo apt install --yes jackd

# Needed for realtime tuner use in guitarix
sudo adduser $USER audio

# might require restart
