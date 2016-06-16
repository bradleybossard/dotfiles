# http://www.codelitt.com/blog/my-first-10-minutes-on-a-server-primer-for-securing-ubuntu/

user=bradleybossard

sudo apt-get update
sudo apt-get -y remove ack
sudo apt-get -y install git tmux vim ack-grep curl wget grc tree fail2ban logwatch

curl -sSL https://get.docker.com/ | sh
sudo usermod -aG sudo $user
echo "Added user bradleybossard to group docker, must log out to take effect"
