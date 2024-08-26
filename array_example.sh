#!/bin/bash
FRUITS=( "APPLE" "BANNANA" "GRAPES" "GUOA" )
echo "First fruit name is : $FRUITS[0]"
echo "last fruit name is : ${FRUITS[3]}"
echo "all the fruits names : ${FRUITS[@]}"
echo "present working directory : $PWD"