#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "exit status is: $1"

}

if [ $USERID -ne 0 ]
then
   echo "Please run the script with root privileges"
   exit 1
fi


dnf list installed git

VALIDATE $?

