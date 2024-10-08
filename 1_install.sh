#!/bin/bash

#################
# install app index
# - ROS
# - ROS-mocap-optitrack
# - Mission Planner
# - mono
# - Gazebo
# - Ardupilot
#################
# run command below
# chmod 755 ./1_install.sh
# ./1_install.sh

# or 

# source 1_install.sh
# https://qiita.com/Lambda34/items/7d24ebe6f7bde5bedddc
#################


##################################################
# install dependent module
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
sudo apt-get install gitk git-gui
sudo apt-get install code       # vscodeをダウンロード


# ダウンロードフォルダがなければ作成
mkdir -p ~/Downloads


##################################################
# install ROS 
cd ~/
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install -y curl # if you haven't already installed curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
echo -e "\n apt update \n"
sudo apt update
sudo apt install -y ros-noetic-desktop-full
sudo apt install -y ros-noetic-rqt*
source /opt/ros/noetic/setup.bash
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
sudo apt install -y python3-rosdep
sudo rosdep init
rosdep update
echo -e "\n run 'roscore' to confirm ROS proper work \n"

##################################################
# install ros-optitrack plugin
cd ~/
echo -e "\n install mocap-optitrack ROS plugin \n"
# if you are not using ROS Noetic, change ros-"ROS_YOUR_VERSION_NAME"-mocap-optitrack
sudo apt install -y ros-noetic-mocap-optitrack

##################################################
# install Mission Planner
# https://ardupilot.org/planner/docs/mission-planner-installation.html#mission-planner-on-linux
# https://www.mono-project.com/download/stable/
cd ~/
echo -e "\n install Mission Planner \n"
echo -e "\n Installing Mission Planner from here -> https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-latest.zip \n"
# 以下のURLからMission Plannerのzipファイルをダウンロード。
# Downloadsフォルダに保存
cd ~/Downloads
wget https://firmware.ardupilot.org/Tools/MissionPlanner/MissionPlanner-latest.zip
# zipファイルを解凍する
# 以下の記事より、文字化けを防ぐため、zipファイルの解凍にはunarを使用する。
# https://qiita.com/supersaiakujin/items/c6b54e9add21d375161f
sudo apt install -y unar
# HOME directoryでzipを解凍
cd ~/
unar ~/Downloads/MissionPlanner-latest.zip
# MissionPlanner-latestというフォルダが作成される。
# MissionPlannerというフォルダ名に変更
mv ~/MissionPlanner-latest ~/MissionPlanner

##################################################
# install mono 
echo -e "\n install mono \n"
sudo apt install -y gnupg ca-certificates
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update
cd ~/
sudo apt install -y mono-devel
# mono MissionPlanner/MissionPlanner.exe

##################################################
# install Gazebo
# move to HOME directory
cd ~/
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y gazebo11
# gazebo --verbose

##################################################
# install Ardupilot
cd ~/
echo -e "\n install Ardupilot \n"
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y gitk git-gui
# move to HOME directory
cd ~/
# ↓it does take a bit time
echo -e "\n install Ardupilot ...\n"
git clone https://github.com/Ardupilot/ardupilot.git
cd ardupilot
git submodule update --init --recursive
# ↓it does take a bit time
Tools/environment_install/install-prereqs-ubuntu.sh -y
. ~/.profile
# after installed Ardupilot, you should reboot
echo -e "\n reboot \n"
sudo reboot
