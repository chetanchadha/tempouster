#!/bin/bash

#source /opt/ros/kinetic/setup.bash

source /home/nano/mavrosws/devel/setup.bash
#sleep 5
for i in {1..5}
do
  rosrun mavros mavsys rate --all 10
done
