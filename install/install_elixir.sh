PACKAGE_NAME=erlang-solutions_2.0_all.deb
wget https://packages.erlang-solutions.com/$PACKAGE_NAME
sudo dpkg -i $PACKAGE_NAME
sudo apt-get update
sudo apt-get install --yes esl-erlang
sudo apt-get install --yes elixir
rm $PACKAGE_NAME
