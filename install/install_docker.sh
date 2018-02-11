

# Official Docker instructions
# https://docs.docker.com/engine/installation/linux/ubuntu/#/prerequisites

# omnibus installer
#curl -sSL https://get.docker.com/ | sh

sudo apt-get update --fix-missing

sudo apt-get install --yes \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update --fix-missing

sudo apt-get install --yes docker-ce

sudo docker run hello-world

sudo usermod -aG docker $USER
echo "Added user $USER group docker, must log out to take effect"
