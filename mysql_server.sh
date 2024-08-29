#!/bin/bash
#GETTING LOG PATH
FOLDER_PATH="/var/log/my_sql_logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
FILE_LOG=$FOLDER_PATH/$SCRIPT_NAME-$TIME_STAMP.log
mkdir -p $FOLDER_PATH
#SETTING COLLLORS
R="\e[32m"
G="\e[33m"
Y="\e[34m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 INSTALLATION : $R FAILED $N"
        exit 1
    else
        echo -e "$2 INSTALLATION : $G SUCCESS $N"
    fi
}
#getting user id
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e "$R Please change to sudo privilages $N" | tee -a >>$FILE_LOG #OR | &>>$FILE_LOG and tee -a used to print both user side and logs.
    exit 1
fi

dnf list installed mysql-server -y  &>>$FILE_LOG
if [ $? -ne 0 ]
then
    echo -e "MYSQL is not installed...$Y going to install $N" #| tee -a >>$FILE_LOG
    dnf install mysql-server -y &>>$FILE_LOG
    VALIDATE $? "MYSQL"
else
    echo -e "$G MYSQL is already installed... $N" # | tee -a >>$FILE_LOG
fi

systemctl enable mysqld 
VALIDATE $? "MYSQL_enable"

systemctl start mysqld
VALIDATE $? "started"

mysql -h 172.31.84.7 -u root -pExpenseApp@1 -e show databases | tee -a >>$FILE_LOG

if [ $? -ne 0 ]
then
    echo -e "$Y PASSWORD GOING TO SETTING $N" | tee -a >>$FILE_LOG
    mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$FILE_LOG
else
    echo -e "My sql-server established :-$G succesfully $N" | tee -a >>$FILE_LOG
fi





