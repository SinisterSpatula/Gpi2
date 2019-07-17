#!/bin/sh

source /opt/retropie/configs/all/xboxdrvend.sh > /dev/null 2>&1
sudo pkill -CONT mpg123 > /dev/null 2>&1
fbset -g 320 240 320 240 8
fbset -g 320 240 320 240 32
