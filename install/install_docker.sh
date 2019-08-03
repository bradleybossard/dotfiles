sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker << END
# install docker via snap
sudo snap install docker
END
