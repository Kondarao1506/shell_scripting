#!/bin/bash
SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
    echo " $SOURCE_DIR Directory exist"
else
    echo " $SOURCE_DIR Directory not exit"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14 )
echo "Files : $FILES"

while IFS= read -r line 
do
    echo "deleting line :- $line"
    rm -rf $line

done <<< $FILES