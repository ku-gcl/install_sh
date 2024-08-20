#!/bin/bash
##################################################
# install app index
# - ardupilot-gazebo
# - MAVROS
# - custom code



# install ardupilot-gazebo plugin to connect gazebo with ardupilot
cd ~/
git clone https://github.com/khancyr/ardupilot_gazebo
cd ardupilot_gazebo
mkdir build
cd build
cmake ..
make -j4
sudo make install



# install MAVROS ##################################################
# reference
# https://docs.px4.io/main/en/ros/mavros_installation.html

sudo apt-get install python3-catkin-tools python3-rosinstall-generator python3-wstool -y

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
# catkin_init_workspace
catkin init
wstool init src


# If this is your first time using wstool you will need to initialize your source space with:
wstool init ~/catkin_ws/src
# Install MAVLink
rosinstall_generator --rosdistro noetic mavlink | tee /tmp/mavros.rosinstall


# Install MAVROS from source using either released (stable) or latest version
# Stable
rosinstall_generator --upstream mavros | tee -a /tmp/mavros.rosinstall
# Latest
# rosinstall_generator --upstream-development mavros | tee -a /tmp/mavros.rosinstall


# Create workspace & deps
wstool merge -t src /tmp/mavros.rosinstall
wstool update -t src -j4
rosdep install --from-paths src --ignore-src -y

# install geographiclib
cd ~/catkin_ws/src/mavros/mavros/scripts
sudo chmod 777 install_geographiclib_datasets.sh
sudo ./install_geographiclib_datasets.sh


cd ~/catkin_ws && catkin build
source ~/catkin_ws/devel/setup.bash



# install custom code ##################################################
cd ~/catkin_ws/src
git clone https://github.com/ku-gcl/px4_sim_pkg.git
cd ~/catkin_ws
catkin build
# or catkin_make
