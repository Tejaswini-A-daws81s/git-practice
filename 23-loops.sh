#!/bin/bash

USERID=$(id -u)

G="\e[31m"
R="\e[32m"
Y="\e[33m"

CHECK_ROOT=(){
    if [ $USERID -ne 0 ]
    then
      echo "Please run the script with root privileges"
      exit 1
    fi  
}  

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 is.... $R FAILED $N"
    else
      echo -e "$2 is...... $G SUCCESS $N"
    fi

}


CHECK_ROOT

# sh 15-loops.sh git mysql postfix nginx
for package in $@   # $@ refers to all arguments passed to it
do
 dnf list installed $package

 if [ $? -ne 0 ]
 then
   echo "$package is not installed going to install it........"
   dnf install $package
   VALIDATE $? "Installing $package"
 else
   echo "$package is already installed nothing to do with it......."  
 fi
done