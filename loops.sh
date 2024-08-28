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
 VALIDATE(){
    if [ $? -ne 0 ]
 then
    echo "$2 is being installing"
 else
    echo "$2 ALREADY installed succefully"

 fi
 }

 #GIT_INSTALL() {
 dnf list installed git -y
 if [ $? -ne 0 ]
 then
    dnf install git -y
    VALIDATE $? "GIT STATUS"
 fi
 #}
 

#  SQL_SERVER()
#  {
    dnf list installed mysql-server -y
    if [ $? -ne 0 ]
    then
        dnf install mysql-server -y
        VALIDATE $? "my-sql STATUS"
        
    fi
 #}
 

#  ROOT_CHECK

#  GIT_INSTALL

#  SQL_SERVER



