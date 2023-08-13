#!/usr/bin/env bash

sudo apt install --yes curl ca-certificates
curl https://repo.waydro.id | sudo bash
sudo apt install waydroid -y
sudo waydroid init -f 
