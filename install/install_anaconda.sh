#!/bin/bash
cd /tmp
wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
bash Anaconda3-5.3.1-Linux-x86_64.sh
conda update conda
cd -

echo "Run > conda init"
