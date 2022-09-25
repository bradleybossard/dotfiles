#!/bin/bash

sudo apt install --yes software-properties-common
sudo add-apt-repository universe --yes

sudo apt update && sudo apt install curl gnupg lsb-release
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

sudo apt update

sudo apt upgrade

sudo apt install --yes ros-humble-desktop

# set up zsh env vars
source /opt/ros/humble/setup.zsh


exit

# ensure things are working
# https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html#try-some-examples

# in one terminal, start talker
source /opt/ros/humble/setup.bash
ros2 run demo_nodes_cpp talker

# in another terminal, start listener
source /opt/ros/humble/setup.bash
ros2 run demo_nodes_py listener
