import numpy as np
import os
import cv2
import datetime


filename = 'test_video.mp4'
frames_per_second = 10.0
split_duration = 30
res = '720p'

# Set resolution for the video capture
# Function adapted from https://kirr.co/0l6qmh
def change_res(cap, width, height):
    cap.set(3, width)
    cap.set(4, height)

# Standard Video Dimensions Sizes
STD_DIMENSIONS =  {
    "480p": (640, 480),
    "720p": (1280, 720),
    "1080p": (1920, 1080),
    "4k": (3840, 2160),
}


# grab resolution dimensions and set video capture to it.
def get_dims(cap, res='1080p'):
    width, height = STD_DIMENSIONS["480p"]
    if res in STD_DIMENSIONS:
        width,height = STD_DIMENSIONS[res]
    ## change the current caputre device
    ## to the resulting resolution
    change_res(cap, width, height)
    return width, height

# Video Encoding, might require additional installs
# Types of Codes: http://www.fourcc.org/codecs.php
VIDEO_TYPE = {
    'avi': cv2.VideoWriter_fourcc(*'XVID'),
    #'mp4': cv2.VideoWriter_fourcc(*'H264'),
    'mp4': cv2.VideoWriter_fourcc(*'XVID'),
}

def get_video_type(filename):
    filename, ext = os.path.splitext(filename)
    if ext in VIDEO_TYPE:
      return  VIDEO_TYPE[ext]
    return VIDEO_TYPE['avi']

while True:
    cap = cv2.VideoCapture(0)
    dt = datetime.datetime.now()
    filename = "/home/nano/" + str(dt.year) + "-" + str(dt.month) + "-" + str(dt.day) + "_" + str(dt.hour) + "-" + str(dt.minute) + "-" + str(dt.second) + ".mp4"
    print(filename)
    out = cv2.VideoWriter(filename, get_video_type(filename), frames_per_second, get_dims(cap, res))
    frameCount = 0
    while True:
        # print(frameCount)
        ret, frame = cap.read()
        # print(ret)
        out.write(frame)
        frameCount += 1
        if frameCount > split_duration * frames_per_second:
            break

    cap.release()
    out.release()
