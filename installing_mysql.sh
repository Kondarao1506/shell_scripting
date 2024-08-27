#!/bin/bash
USER=$(id -u)
R="\e[31m"
N="\e[0m"
if[ $USER -ne 0 ]
then
    echo -e "$R please run with privilages $N"
    exit 1
else
    dnf installed mysql-server -y
    if[ $? -ne 0 ]
    then
        echo "mysql is installing"
        dnf install mysql-server -y
    else
        echo "my sql server already installed";
    fi
fi