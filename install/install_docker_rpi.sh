# https://manre-universe.net/how-to-run-docker-and-docker-compose-on-raspbian/

curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh

sudo apt-get install --yes python python-pip python-setuptools python-dev libffi-dev

sudo pip install docker-compose

git clone https://github.com/OctoPrint/docker.git octoprint-docker && cd octoprint-docker

docker-compose up -d
