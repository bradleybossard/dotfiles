sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install --yes certbot python-certbot-nginx
sudo certbot --nginx
sudo certbot --authenticator standalone --installer nginx -d bradleybossard.com -d www.bradleybossard.com --pre-hook "service nginx stop" --post-hook "service nginx start"
