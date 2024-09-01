#!/bin/bash
SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
    echo " $SOURCE_DIR Directory exist"
else
    echo " $SOURCE_DIR Directory not exit"
fi
