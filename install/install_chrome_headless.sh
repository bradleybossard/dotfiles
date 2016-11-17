# Add Google public key to apt
wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -

# Add Google to the apt-get source list
echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list

# Update app-get
sudo apt-get update

# Install Java, Chrome, Xvfb, and unzip
#apt-get -y install openjdk-7-jre google-chrome-stable xvfb unzip
sudo apt-get -y install google-chrome-stable dbus-x11 xvfb

#sudo apt-get install -y xvfb fluxbox x11vnc dbus libasound2 libqt4-dbus libqt4-network libqtcore4 libqtgui4 libxss1 libpython2.7 libqt4-xml libaudio2 libmng1 fontconfig liblcms1 lib32stdc++6 lib32asound2 ia32-libs libc6-i386 lib32gcc1 nano python-gobject-2 curl git
# sudo apt-get install -y python-gobject-2
# sudo apt-get install -y curl git
# sudo apt install -y xvfb
