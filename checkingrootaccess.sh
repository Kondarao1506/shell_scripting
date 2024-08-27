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
    if [ $? -ne 0 ]
    then
        echo "git installation not success bye"
        exit 1
    else
        echo "git installation success"
    fi
else
    echo "Git already installed"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "my sql is going to installed"
    dnf install mysql-server -y
    if [$? -ne 0]
    then 
        echo "my sql not installed successfully"
    else
        echo "my sql installed succesfully ok"
    fi

else
    echo "mysql installed allredy"
fi