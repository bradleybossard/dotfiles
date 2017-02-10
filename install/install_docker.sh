# Official Docker instructions
# https://docs.docker.com/engine/installation/linux/ubuntu/#/prerequisites

# omnibus installer
#curl -sSL https://get.docker.com/ | sh

sudo apt-get update --fix-missing && apt-get upgrade

# curl and aufs dependencies

# official docker instructions
#sudo apt-get install --yes curl \
#                           linux-image-extra-$(uname -r) \
#                           linux-image-extra-virtual

# instructions for custom kernel used by my current VPS
sudo apt-get install --yes linux-image-4.4.0-51-generic
sudo apt-get install --yes linux-image-extra-4.4.0-51-generic
sudo apt-get install --yes linux-image-extra-virtual

# Use apt over https
sudo apt-get install --yes apt-transport-https \
                           software-properties-common \
                           ca-certificates

# Add official PGP key
curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -

sudo apt-get install --yes software-properties-common
sudo add-apt-repository \
         "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"

sudo apt-get update

sudo apt-get -y install docker-engine

sudo docker run hello-world

sudo usermod -aG docker bradleybossard
echo "Added user bradleybossard to group docker, must log out to take effect"
