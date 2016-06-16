user=bradleybossard

sudo apt-get update
sudo apt-get -y remove ack
sudo apt-get -y install git tmux vim ack-grep curl wget grc tree fail2ban logwatch

curl -sSL https://get.docker.com/ | sh
sudo usermod -aG sudo $user
