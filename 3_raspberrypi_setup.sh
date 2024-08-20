#!/bin/bash
##################################################
# install app index
# - VSCode
# - ROS
# - MAVROS
# - custom code

##################################################
# install dependent module
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
sudo apt-get install code       # vscodeをダウンロード

# install ROS
cd ~/
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
echo -e "\n apt update \n"
sudo apt update
sudo apt install ros-noetic-desktop-full
sudo apt install ros-noetic-rqt*you
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install python3-rosdep
sudo rosdep init
rosdep update
echo -e "\n run 'roscore' to confirm ROS proper work \n"

##################################################
# install MAVROS
echo -e "\n install mavros ROS plugin \n"
sudo apt-get install -y ros-noetic-mavros ros-noetic-mavros-extras
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh chmod a+x install_geographiclib_datasets.sh 
sudo ./install_geographiclib_datasets.sh



##################################################
# install ros-optitrack plugin
cd ~/
echo -e "\n install mocap-optitrack ROS plugin \n"
# if you are not using ROS Noetic, change ros-"ROS_YOUR_VERSION_NAME"-mocap-optitrack
sudo apt install -y ros-noetic-mocap-optitrack



# install custom code ##################################################
sudo apt-get install -y python3-catkin-tools
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws
catkin init

cd ~/catkin_ws/src
git clone https://github.com/ku-gcl/px4_sim_pkg.git
cd ~/catkin_ws
catkin build
# or catkin_make
