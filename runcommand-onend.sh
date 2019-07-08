#!/bin/sh

bash ./xboxdrvend.sh > /dev/null 2>&1
sudo pkill -CONT mpg123 > /dev/null 2>&1
