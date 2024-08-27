#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "run with root privilages"
else
    echo "installing software"
fi
dnf install git -y