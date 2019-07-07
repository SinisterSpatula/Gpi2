#!/bin/sh

fbset -g 320 240 320 240 8
fbset -g 320 240 320 240 32
sudo killall xboxdrv
sudo pkill -CONT mpg123 > /dev/null 2>&1
