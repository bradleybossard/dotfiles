# Installs latest stable upstream of bcc-tools
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4052245BD4284CDD
echo "deb https://repo.iovisor.org/apt/$(lsb_release -cs) $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/iovisor.list
sudo apt-get update
sudo apt-get install --yes bcc-tools libbcc-examples linux-headers-$(uname -r)

# Tools are located in /usr/share/bcc/tools
