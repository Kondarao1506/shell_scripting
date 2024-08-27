#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "run with root privilages"
    exit 1
fi

dnf list installed git -y

if [ $? -ne 0 ]
then
    echo "installing git"
    dnf install gittt -y
    if [ $? -ne 0 ]
    then
        echo "git installation not success"
    else
        echo "git installation success"
    fi
else
    echo "already installed"
fi