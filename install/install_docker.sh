# create new system group, add $USER and login
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker

# install docker via snap
sudo snap install docker

# TODO: No longer needed if user/group run before snap command.  To verify.
# docker needs to be restarted to absorb group change
#sudo snap disable docker
#sudo snap enable docker
