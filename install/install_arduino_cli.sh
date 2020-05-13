  cd /tmp
  wget https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_64bit.tar.gz
  tar -zxf arduino-cli_latest_Linux_64bit.tar.gz
  sudo cp arduino-cli /usr/bin
  cd -
  arduino-cli core update-index
