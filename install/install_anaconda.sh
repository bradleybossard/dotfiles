#!/bin/bash

# check the following repo listing for latest version
# https://repo.anaconda.com/archive/

FILENAME=Anaconda3-2021.11-Linux-x86_64.sh
cd /tmp
# wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
wget https://repo.anaconda.com/archive/$FILENAME
# bash Anaconda3-5.3.1-Linux-x86_64.sh
bash $FILENAME
conda update conda
conda update anaconda
cd -
echo "Run > conda init"
