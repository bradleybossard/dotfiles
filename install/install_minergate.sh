# install minergate-cli
sudo apt-get update && wget https://minergate.com/download/deb-cli -O minergate-cli.deb && sudo dpkg -i minergate-cli.deb

# to start miner (4 cores for BCN) use this command:
minergate-cli -user <YOUR@EMAIL.KAPPA> -bcn 4
