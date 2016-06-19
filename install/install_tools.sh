# Research for securing Ubuntu servers
# http://www.codelitt.com/blog/my-first-10-minutes-on-a-server-primer-for-securing-ubuntu/
# https://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers

user=bradleybossard

sudo apt-get update
sudo apt-get -y remove ack
sudo apt-get -y install git tmux vim ack-grep curl wget grc bc tree fail2ban \
                        logwatch flex bison pandoc context golang-go

curl -sSL https://get.docker.com/ | sh
sudo usermod -aG sudo $user
echo "Added user bradleybossard to group docker, must log out to take effect"
