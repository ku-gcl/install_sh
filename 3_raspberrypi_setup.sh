##################################################
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
sudo apt-get install ros-noetic-mavros ros-noetic-mavros-extras 
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh chmod a+x install_geographiclib_datasets.sh 
sudo ./install_geographiclib_datasets.sh

