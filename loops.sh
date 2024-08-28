#!/bin/bash

USERID=$(id -u)
R="\e[30m"
G="\e[32m"
N="\e[0m"

ROOT_CHECK() {
    if [ $USERID -ne 0 ]
    then
        echo -e "$R RUN WITH ROOT PRIVILIZES $N"
        exit 1
    else
        echo -e "$G YOU ARE IN ROOT PRIVILAGES $N"
    fi
    }

GIT_INTALL() {
 dnf list installed git -y
 if [ $? -ne 0 ]
 then
    echo "git is being installing"
    dnf install git -y
 else
    echo "git ALREADY installed succefully"

 fi
 }

 ROOT_CHECK()

 GIT_INTALL() 



