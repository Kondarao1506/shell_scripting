#!/bin/bash
SOURCE_DIR=$1
DEST_FILE=$2
DAYS=${3:-14}

USAGE(){
echo "you must paas argumets like source file path and destination file path"
}

if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR : not exist"
fi
 
if [ ! -d $DEST_FILE ]
then
    echo "$DEST_FILE : not exist"
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)

if [ -n $FILES ]
then
    echo "there are   files found older than $DAYS"
    exit 1
else
    echo "there are no files found above $DAYS"
fi

