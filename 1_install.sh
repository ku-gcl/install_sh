#!/bin/bash

#################
# install app index
# - ROS
# - ROS-mocap-optitrack
# - Mission Planner
# - mono
# - Gazebo
# - Ardupilot


##################################################
# install ROS 
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install ros-noetic-desktop-full
sudo apt install ros-noetic-rqt*
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install python3-rosdep
sudo rosdep init
rosdep update
echo "run 'roscore' to confirm ROS proper work"

##################################################
# install ros-optitrack plugin
echo "install mocap-optitrack ROS plugin ..."
# if you are not using ROS Noetic, change ros-"ROS_YOUR_VERSION_NAME"-mocap-optitrack
sudo apt install ros-noetic-mocap-optitrack

##################################################
# install Mission Planner
# https://ardupilot.org/planner/docs/mission-planner-installation.html#mission-planner-on-linux
# https://www.mono-project.com/download/stable/
echo "install Mission Planner ..."
sudo apt install gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
##################################################
# install mono 
echo "install mono ..."
sudo apt install mono-devel
mono MissionPlanner/MissionPlanner.exe

##################################################
# install Gazebo
# move to HOME directory
cd ~/
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install gazebo11
gazebo --verbose

##################################################
# install Ardupilot
sudo apt-get update
sudo apt-get install git
sudo apt-get install gitk git-gui
# move to HOME directory
cd ~/
# ↓it does take a bit time
echo "install ardupilot ..."
git clone https://github.com/Ardupilot/ardupilot.git
cd ardupilot
git submodule update --init --recursive
# ↓it does take a bit time
Tools/environment_install/install-prereqs-ubuntu.sh -y
. ~/.profile
# after installed Ardupilot, you should reboot
echo "reboot ..."
sudo reboot