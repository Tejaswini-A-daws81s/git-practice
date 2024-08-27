#!/bin/bash

USERID=$(id -u) # Passing command to check user id is equal to 0 or not

if [ $USERID -ne 0 ]
then
   echo "Please run this script with root privileges"
   exit 1 # If user id is other than 0 come out of the if condition. Donot execute further
fi

dnf install git -y

if [ $? -ne 0]
then
   echo "Not Installed please check it............"
   install dnf git -y


if [ $? -ne 0]
then 
   echo "Installation Failed"
   exit 1
else
   echo "Installation Successfull"   

fi

else
   echo "Git already installed........."

fi   