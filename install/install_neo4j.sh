sudo wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb http://debian.neo4j.org/repo stable/' | sudo tee -a /etc/apt/sources.list.d/neo4j.list
sudo apt-get update --fix-missing

sudo apt-get install --yes neo4j

sudo service neo4j start

# In order to access the server from non-local host, uncomment the following line in
# /etc/neo4j/neo4j.conf
#
# dbms.connectors.default_listen_address=0.0.0.0
#
# Access the browser on port :7474

# Instructions for install Awesome Procedures on Cyper
#
# cd /var/lib/neo4j/plugins
# sudo su neo4j
# # Based on version of neo4j running, get url for plugin release
# # https://github.com/neo4j-contrib/neo4j-apoc-procedures#version-compatibility-matrix
# wget <url>
# chmod 755 <plugin-filename>
# sudo service neo4j restart
