#!/bin/bash
##################################################
# install app index
# - GAZEBO-ardupilot-gazebo


# install ardupilot-gazebo plugin to connect gazebo with ardupilot
cd ~/
git clone https://github.com/khancyr/ardupilot_gazebo
cd ardupilot_gazebo
mkdir build
cd build
cmake ..
make -j4
sudo make install