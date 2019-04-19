#!/bin/bash

source /opt/ros/kinetic/setup.bash
source /home/catkin_ws/devel/setup.bash
export ROS_IP=$(hostname -i)

exec "$@"


