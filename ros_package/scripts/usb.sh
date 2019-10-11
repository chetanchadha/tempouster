#!/bin/bash

for i in {1..10}
do
usb_modeswitch -v 12d1 -p 1f01 -J
done

