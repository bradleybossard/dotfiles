# install docker via snap
sudo snap install docker

# create new system group, add $USER and login
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker

# docker needs to be restarted to absorb group change
sudo snap disable docker
sudo snap enable docker
