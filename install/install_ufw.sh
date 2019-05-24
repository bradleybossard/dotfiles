# https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-18-04
sudo apt install --yes ufw


sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow https
sudo ufw allow http
sudo ufw allow ssh
sudo ufw enable
sudo ufw status

# Enable logging
# sudo ufw logging on
