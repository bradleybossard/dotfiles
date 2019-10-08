wget -O - "https://packagecloud.io/rabbitmq/rabbitmq-server/gpgkey" | sudo apt-key add -
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.deb.sh | sudo bash

sudo apt-get update --yes
sudo apt-get install --yes rabbitmq-server

sudo systemctl enable rabbitmq-server
