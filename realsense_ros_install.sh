#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the directory
REALSENSE_install_DIR=~/catkin_ws/src

sudo apt install -y ros-noetic-rgbd-launch

# Initialize the catkin workspace
cd $REALSENSE_install_DIR
catkin_init_workspace
cd ..
catkin_make clean
catkin_make -DCATKIN_ENABLE_TESTING=False -DCMAKE_BUILD_TYPE=Release
catkin_make install

# Add source command to .bashrc if not already present
if ! grep -qxF 'source ~/catkin_ws/devel/setup.bash' ~/.bashrc; then
    echo 'source ~/catkin_ws/devel/setup.bash' >> ~/.bashrc
fi

# Source the setup.bash file
source ~/.bashrc
echo "Setup complete."
