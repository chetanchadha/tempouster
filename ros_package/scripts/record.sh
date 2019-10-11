#!/bin/bash

source /opt/ros/melodic/setup.bash
#source /etc/ubiquity/env.sh
#export ROS_PARALLEL_JOBS=-j2 # Limit the number of compile threads due to memor$
source /home/nano/ousterws/devel/setup.bash

sleep 30
for i in {1..5000}
do
  rosbag record --split --size=100 /os1_node/imu_packets /os1_node/lidar_packets
  sleep 1

done

