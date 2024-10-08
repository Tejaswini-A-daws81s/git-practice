#!/bin/bash
LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) # $0 gives the execution file name, pipe | takes $0 as input and cuts .sh and returns file name
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER  # -p checks whether the folder is created or not if folder is not created it will create or else it will not create


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
      echo -e "Please use $R root Priveleges $N to run this script" | tee -a $LOG_FILE
      exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 is...... $R FAILED $N" | tee -a $LOG_FILE

    else
      echo -e "$2 is...... $G SUCCESS $N" | tee -a $LOG_FILE
    fi
}

USAGE(){
     echo -e "$R USAGE:: $N sudo sh 16-redirectors.sh package1 package2 ..."
     exit 1
}

echo "Script started executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
then 
  USAGE
fi  

for package in $@ 
do
 dnf list installed $package &>>$LOG_FILE
 if [ $? -ne 0 ]
 then
   echo -e "$package is..... $Y not installed........ going to install it $N" | tee -a $LOG_FILE
   dnf install $package -y &>>$LOG_FILE
   VALIDATE $? "$package installation"

 else
   echo -e "$package is..... $Y already installed Nothing to do...... $N" | tee -a $LOG_FILE
 fi

done