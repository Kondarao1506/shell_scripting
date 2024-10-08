#!/bin/bash

USERID=$(id -u)
R="\e[30m"
G="\e[32m"
N="\e[0m"

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

#  #GIT_INSTALL() {
#  dnf list installed git -y
#  if [ $? -ne 0 ]
#  then
#     dnf install git -y
#     VALIDATE $? "GIT STATUS"
#  else
#     echo -e "$G Git already installed $N"
#  fi
 #}
 

# #  SQL_SERVER()
# #  {
#     dnf list installed mysql-server -y
#     if [ $? -ne 0 ]
#     then
#         dnf install mysql-server -y
#         VALIDATE $? "my-sql STATUS"
#     else
#         echo -e "$G mysql installed allredy $N" 
#     fi
#  #}
 

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

        
#  GIT_INSTALL

#  SQL_SERVER



