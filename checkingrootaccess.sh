#!/bin/bash

G="\e[36m"
N="\e[0m"
VALIDATE(){
  if [ $1 -ne 0 ]
  then
    echo "$2 comand is failed"
  else
    echo -e "$G $2 command is success $N"
  fi
  }
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
    VALIDATE $? "listing git"
    # if [ $? -ne 0 ]
    # then
    #     echo "git installation not success"
    # else
    #     echo "git installation success"
    # fi
else
    echo -e "$G Git already installed $N"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "my sql is going to installed"
    dnf install mysql-server -y
    VALIDATE $? "listing mysql"
    # if [ $? -ne 0 ]
    # then 
    #     echo "my sql not installed successfully"
    # else
    #     echo "my sql installed succesfully ok"
    # fi

else
    echo -e "$G mysql installed allredy $N"
fi