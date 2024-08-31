#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    echo "exit status is: $1"

}

if [ $USERID -ne 0 ]
then
   echo "Please run the script with root privileges"
   
fi


dnf list installed git

VALIDATE $?

dnf install git -y

if [ $? -ne 0 ]
then
  echo "Not installed please check it............."

else
  echo "Already installed Nothing to do.................."
  
fi

