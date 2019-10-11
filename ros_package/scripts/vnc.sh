#!/bin/bash
echo "This has started" `date` > vnc.log
sudo -u nvidia vncserver -geometry 1024x728 -depth 24
