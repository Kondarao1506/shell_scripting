#!/bin/bash
LOGS_FOLDER="/var/log/shell_script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIME_STAMP.log"
mkdir -p $LOGS_FOLDER
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

 ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R RUN WITH ROOT PRIVILIZES $N"&>>$LOG_FILE
        exit 1
    else
        echo -e "$G YOU ARE IN ROOT PRIVILAGES $N"&>>$LOG_FILE
    fi
    }
 VALIDATE(){
    if [ $? -ne 0 ]
 then
    echo "$2 is failed to install"&>>$LOG_FILE
 else
    echo "$2 ALREADY installed succefully"&>>$LOG_FILE

 fi
 }
 USAGE(){
    echo "please eneter arguments like sudo sh redirectors.sh git mysql"
    exit 1
 }
 ROOT

    if [ $# -eq 0 ]
    then
        
        USAGE
    fi
 
for package in $@
  do
    dnf list installed $package -y &>>$LOG_FILE
    if [ $? -ne 0 ]
    then    
        echo "$package is installing"
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo "$package installed already" &>>$LOG_FILE
    fi
  done