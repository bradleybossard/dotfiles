# https://www.howtoforge.com/tutorial/install-mongodb-on-ubuntu-16.04/

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update

sudo apt-get install -y mongodb-org

#vim mongod.service
sudo cp mongo.service /lib/systemd/system/
sudo systemctl daemon-reload

sudo systemctl start mongod
sudo systemctl enable mongod

netstat -plntu


# Securing mongo
#
# mongo  ## start mongo
# use admin
# db.createUser({user:"admin", pwd:"admin123", roles:[{role:"root", db:"admin"}]})   ## don't use this password
# exit
# sudo vim /lib/systemd/system/mongod.service
# ## Add --auth to line 9
# ExecStart=/usr/bin/mongod --quiet --auth --config /etc/mongod.conf
# Save and exit

#sudo systemctl daemon-reload
#sudo service mongod restart

# Now mongo can only be accessed like
# mongo -u admin -p admin123 --authenticationDatabase admin
