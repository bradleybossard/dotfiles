DEB_FILE=elasticsearch-6.6.1.deb
wget https://artifacts.elastic.co/downloads/elasticsearch/$DEB_FILE

# Enable elastic search to start on boot
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service

# Start the service
sudo systemctl start elasticsearch.service
# sudo systemctl stop elasticsearch.service

# Verify the system is working
curl -X GET "localhost:9200/"

# Tail the journal output of the service
# sudo journalctl --unit elasticsearch --follow

# Guide to file layout, etc
# https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html
