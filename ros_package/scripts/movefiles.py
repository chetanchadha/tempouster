import os
import glob
from shutil import move
videofiles = glob.glob("/home/nano/*.mp4")
lidarfiles = glob.glob("/home/nano/*.bag")
csvfiles = glob.glob("/home/nano/*.csv")
metafiles = glob.glob("/home/nano/*.json")
if len(videofiles) > 0:

    length = 0 if len(os.listdir("/home/nano/lidar_files")) == 0 else int(max([int(x) for x in os.listdir("/home/nano/lidar_files")]))    
    
    dir_name = "/home/nano/lidar_files/"+str(length+1)
    os.mkdir(dir_name)

    for f in videofiles:
        move(f, dir_name)
        
    for c in csvfiles:
        move(c, dir_name)
    for m in metafiles:
        move(m,dir_name)
        
    if len(lidarfiles) > 0:
        for v in lidarfiles:
            move(v, dir_name)
