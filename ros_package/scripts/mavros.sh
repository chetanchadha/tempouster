#!/bin/bash

#source /opt/ros/kinetic/setup.bash

source /home/nano/mavrosws/devel/setup.bash
#cd /home/nvidia/mavrosws
sleep 5
for i in {1..5000}
do
  roslaunch mavros apm.launch 
  sleep 1
done
