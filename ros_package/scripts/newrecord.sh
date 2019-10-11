#!/bin/bash

#source /opt/ros/melodic/setup.bash
#source /etc/ubiquity/env.sh
#export ROS_PARALLEL_JOBS=-j2 # Limit the number of compile threads due to memor$
source /home/nano/newousterws/devel/setup.bash

sleep 5
for i in {1..5000}
do
  rosbag record --split --size=35 /os1_node/imu_packets /os1_cloud_node/points
  sleep 1

done

