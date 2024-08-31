#!/bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) # $0 gives the execution file name, pipe | takes $0 as input and cuts .sh and returns file name
TIMESTAMP=$(date +%Y-%M-%D-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME/$TIMESTAMP"
mkdir -p $LOGS_FOLDER  # -p checks whether the folder is created or not if folder is not created it will create or else it will not create


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
      echo -e "Please use $Y root Priveleges $N to run this script" &>>$LOG_FILE
      exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 is...... $R FAILED $N" &>>$LOG_FILE

    else
      echo -e "$2 is...... $G SUCCESS $N" &>>$LOG_FILE
    fi
}


CHECK_ROOT

for package in $@
do
 dnf list installed $package
 if [ $? -ne 0]
 then
   echo -e "$package is..... $Y not installed........ going to install it $N" &>>$LOG_FILE
   dnf install $package -y
   VALIDATE $? "$package installation"

 else
   echo -e "$package is..... $Y already installed Nothing to do...... $N" &>>$LOG_FILE
 fi

done