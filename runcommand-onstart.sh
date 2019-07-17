#!/bin/sh

source /opt/retropie/configs/all/xboxdrvstart.sh > /dev/null 2>&1
sudo pkill -STOP mpg123 > /dev/null 2>&1
fbset -g 320 240 640 480 16
