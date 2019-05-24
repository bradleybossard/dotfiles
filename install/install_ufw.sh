sudo apt install --yes ufw
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow https
sudo ufw allow http
sudo ufw allow ssh
sudo ufw enable
sudo ufw status
