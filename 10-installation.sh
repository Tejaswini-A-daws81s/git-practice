#!/bin/bash


USERID=$(id -u) # Passing command to check user id is equal to 0 or not

VALIDATE () {
      echo "Git list is success: $1"
}


if [ $USERID -ne 0 ]
then
   echo "Please run this script with root privileges"
   exit 1 # If user id is other than 0 come out of the if condition. Donot execute further
fi

# dnf install gittt -y

# if [ $? -ne 0 ]
# then
#    echo "Not Installed please check it............"
#    install dnf git -y
#    exit 1


# # if [ $? -ne 0 ]
# # then 
# #    echo "Installation Failed"
# #    exit 1
# # else
# #    echo "Installation Successfull"   

# # fi

# else
#    echo "Git already installed........."

# fi   

dnf list installed mysql

if [ $? -ne 0 ]
then 
   echo "Mysql is not installed..........Please check it..."

   VALIDATE $? 
   
   dnf install mysql -y
   if [ $? -ne 0 ]
   then
      echo "Mysql installation failed......."
      exit 1
    else
       echo "Mysql installation is successfull..........."

    fi  

else
   echo "Mysql is already installed nothing to do with it......."

fi