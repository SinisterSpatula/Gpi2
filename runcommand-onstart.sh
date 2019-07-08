#!/bin/sh

bash ./xboxdrvstart.sh $1 $2 $3 > /dev/null 2>&1
sudo pkill -STOP mpg123 > /dev/null 2>&1
