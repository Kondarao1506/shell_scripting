#!/bin/bash
SOURCE_DIR=$1
DEST_FILE=$2
DAYS=${3:-14}
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
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

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)

echo "files : $FILES"

if [ -z $FILES ]
then
    echo "there are no files found above $DAYS"
else
    echo "OLDER THAN $DAYS DAYS FILES FOUND "
    ZIP_FILE=$DEST_FILE/backuplogs-$TIME_STAMP.zip
    ZIP_FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14) | zip $ZIP_FILE -@
fi
while IFS= read -r file
do
    echo "files :- $file"




done <<< $ZIP_FILES
