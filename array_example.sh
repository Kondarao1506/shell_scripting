#!/bin/bash
FRUITS=( "APPLE" "BANNANA" "GRAPES" "GUOA" )
echo "First fruit name is : $FRUITS[0]"
echo "last fruit name is : ${FRUITS[3]}"
echo "all the fruits names : ${FRUITS[@]}"
echo "present working directory : $PWD"
DATE=$(date +%F)
echo "Today date is $DATE"
echo "ALL THE VARIABLE USED AT A TIME IN SCRIPT $@"
echo "number of variables passed : $#"
echo "script name $o"
echo "home directory $HOME"
echo "pid of script executing is : $$ "
sleep 100 &
echo "last background command $!"