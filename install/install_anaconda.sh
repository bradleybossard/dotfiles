#!/bin/bash
cd /tmp
wget https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh
bash Anaconda3-5.3.1-Linux-x86_64.sh
conda update conda
conda update anaconda
cd -
echo "Run > conda init"
exit

## TODO: Experiment with Miniconda
cd /tmp
curl -O https://repo.anaconda.com/miniconda/Miniconda2-4.6.14-Linux-x86_64.sh
bash Miniconda2-4.6.14-Linux-x86_64.sh
# TODO: Add appropriate conda update equivalents as above
cd -
