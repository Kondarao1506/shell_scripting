#!/bin/bash
#GETTING LOG PATH
FOLDER_PATH="/var/log/my_sql_logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
FILE_LOG=$FOLDER_PATH/$SCRIPT_NAME-$TIME_STAMP.log
mkdir -p $FOLDER_PATH
#SETTING COLLLORS
G="\e[32m"
Y="\e[33m"
R="\e[31m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2  : $R FAILED $N"
        exit 1
    else
        echo -e "$2  : $G SUCCESS $N"
    fi
}
#getting user id
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e "$R Please change to sudo privilages $N" | tee -a $FILE_LOG #OR | &>>$FILE_LOG and tee -a used to print both user side and logs.
    exit 1
fi

dnf list installed mysql-server -y  &>>$FILE_LOG
if [ $? -ne 0 ]
then
    echo -e "MYSQL is not installed...$Y going to install $N" | tee -a $FILE_LOG
    dnf install mysql-server -y &>>$FILE_LOG
    VALIDATE $? "MYSQL installation"
else
    echo -e "$G MYSQL is already installed... $N"  | tee -a $FILE_LOG
fi

systemctl enable mysqld 
VALIDATE $? "MYSQL_enabled"

systemctl start mysqld
VALIDATE $? "MYSQL started"

mysql -h 172.31.84.7 -u root -pExpenseApp@1 -e 'show databases;' &>>$FILE_LOG

if [ $? -ne 0 ]
then
    echo -e "$Y PASSWORD GOING TO SETTING $N" | tee -a $FILE_LOG
    mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$FILE_LOG
    VALIDATE $? "Setting up root password"
else
    echo -e "My sql-server established :-$G succesfully $N" | tee -a $FILE_LOG
fi
# sudo mysql
# show databases;





