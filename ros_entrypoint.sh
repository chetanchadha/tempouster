#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
source "/home/ros_packages/tempouster/devel/setup.bash"
roslaunch ouster_ros os1.launch os1_hostname:=192.168.1.11 os1_udp_dest:=192.168.1.1  lidar_mode:=2048x10  metadata:=/home/nano/metadata.json
exec "$@"

