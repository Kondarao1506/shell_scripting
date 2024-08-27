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
    dnf install git -y
else
    echo "already installed"
fi