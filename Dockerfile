FROM ros:melodic-ros-base-stretch
RUN apt-get update \
&& apt-get dist-upgrade -y \
&& apt upgrade -y \
&& apt install python3-pip -y \
&& apt install python-pip -y \
&& apt install net-tools -y \
&& apt install iputils-ping -y \
&& apt install nano -y \
&& apt install cron -y \
&& apt install libjsoncpp-dev -y \
&& apt install libeigen3-dev -y \
&& apt install ros-melodic-tf2-geometry-msgs -y \
&& apt install ros-melodic-pcl-ros -y

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
RUN /bin/bash -c 'source $HOME/.bashrc; echo $HOME'
COPY ros_package /home/ros_packages/
RUN /bin/bash -c '. /opt/ros/melodic/setup.bash; cd /home/ros_packages/tempouster; catkin_make'
RUN echo "source /home/ros_packages/tempouster/devel/setup.bash" >> ~/.bashrc
RUN /bin/bash -c 'source $HOME/.bashrc; echo $HOME'
COPY  ros_entrypoint.sh  ros_entrypoint.sh
RUN chmod a+x  ros_entrypoint.sh
# ENTRYPOINT  /bin/bash -c 'source $HOME/.bashrc; cd home/ros_packages/scripts; cat $HOME/.bashrc; roslaunch'
# CMD []


