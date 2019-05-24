sudo add-apt-repository --yes universe
sudo add-apt-repository --yes ppa:certbot/certbot
sudo apt-get update --fix-missing
sudo apt-get install --yes certbot python-certbot-nginx
sudo certbot --authenticator standalone --installer nginx -d bradleybossard.com -d www.bradleybossard.com --pre-hook "service nginx stop" --post-hook "service nginx start"
