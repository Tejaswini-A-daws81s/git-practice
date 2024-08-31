#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"


CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
      echo "Please execute this script using root privileges"
      exit 1
    fi 
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 is....$R FAILED $N"
      exit 1
    else
      echo -e "$2 is......$G SUCCESS $N"
    fi
}

CHECK_ROOT

dnf list installed git 

if [ $? -ne 0 ]
then
  echo "Git is not installed going to install it.........."
  dnf insall git -y
  VALIDATE $? "Installing Git"

else
  echo "Already insatlled nothing to do with it"  

fi
