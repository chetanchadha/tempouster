#!/bin/bash

#source /opt/ros/melodic/setup.bash
#source /etc/ubiquity/env.sh
#export ROS_PARALLEL_JOBS=-j2 # Limit the number of compile threads due to memor$
source /home/nano/tempouster/devel/setup.bash

for i in {1..5000}
do
  roslaunch ouster_ros os1.launch os1_hostname:=192.168.1.10 os1_udp_dest:=192.168.1.1  lidar_mode:=2048x10  metadata:=/home/nano/metadata.json

  sleep 1
done
