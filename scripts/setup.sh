#!/usr/bin/env bash

# Build TB3 from src
source /opt/ros/humble/setup.bash
mkdir -p ~/turtlebot3_ws/src
cd ~/turtlebot3_ws/src/
git clone -b humble https://github.com/ROBOTIS-GIT/DynamixelSDK.git
git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b humble https://github.com/ROBOTIS-GIT/turtlebot3.git
cd ~/turtlebot3_ws
colcon build --symlink-install
# Sources required to find ROS and TB3
echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc 
echo "source ~/turtlebot3_ws/install/setup.bash" >> ~/.bashrc
# Silence warnings
echo 'export XDG_RUNTIME_DIR=/tmp/runtime-root
mkdir -p $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR' >> ~/.bashrc
# Attempt to find correct NIC (if unset, find and define manually)
echo 'export DEFAULT_IFACE="$(ip route get 1.1.1.1 | awk '\''/dev/ {print $5; exit}'\'')" ' >> ~/.bashrc

source ~/.bashrc
echo 'Setup complete...'