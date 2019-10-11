#!/bin/sh 

#Set Path for ffmpeg Libraries 

export LD_LIBRARY_PATH=/usr/lib/

echo $LD_LIBRARY_PATH
#sleep 30

for i in {1..5000}
do
 # ffmpeg -f video4linux2 -input_format mjpeg -s 1280x720 -i /dev/video0 -vf "drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf: \ text='%{localtime\: %m/%d/%Y %I.%M.%S %p}': fontsize=30:fontcolor=white@00.8: x=900: y=690"  -vcodec libx264 -preset veryfast  -f segment -strftime 1 -segment_time 30 -segment_format mp4 -y /home/nano/%Y-%m-%d_%H-%M-%S.mp4 
 ffmpeg -f video4linux2 -input_format mjpeg -s 1280x720 -i /dev/video0  -f segment -strftime 1 -segment_time 30 -segment_format mp4 -y /home/nano/%Y-%m-%d_%H-%M-%S.mp4 
 
  sleep 1

done
#EOF
