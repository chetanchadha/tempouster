#!/bin/bash

source /opt/ros/kinetic/setup.bash
#source /etc/ubiquity/env.sh
#export ROS_PARALLEL_JOBS=-j2 # Limit the number of compile threads due to memor$
source /home/nano/ousterws/devel/setup.bash
echo set_config_param lidar_mode 2048x10 | netcat -w 1 192.168.1.10 7501
echo write_config_txt | netcat -w 1 192.168.1.10 7501
echo reinitialize | netcat -w 10 192.168.1.10 7501
sleep 15
echo get_sensor_info | netcat -w 10  192.168.1.10 7501 |ts >>lidar_stat.txt

for i in {1..5000}
do
  roslaunch ouster_ros os1.launch os1_hostname:=192.168.1.10 os1_udp_dest:=192.168.1.1
  sleep 1
done
