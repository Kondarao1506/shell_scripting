#!/bin/bash
ROOT(){
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
    echo "$2 is failed to install"
 else
    echo "$2 ALREADY installed succefully"

 fi
 }
 ROOT
 #installing all the packages at a time by passing in runtime here $@ = mysql-server git
for package in $@
  do
    dnf list installed $package -y
    if [ $? -ne 0 ]
    then    
        echo "$package is installing"
        dnf install $package -y
        VALIDATE $? "$package"
    else
        echo "$package installed already"
    fi
  done