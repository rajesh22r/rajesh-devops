#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]
then 
  echo "please run through root privileges"
  exit 1
fi
validate (){
    if [ $1 -ne 0 ]
    then 
       echo "$2 is failed.. check it "
    else 
       echo " $2 is success"
    fi
}
dnf list installed git
if [ $? -ne 0 ]
then 
   echo "git is not installed, going to install it"
   dng install git -y
   validate $? "installing git"
else 
   echo "git is already installed"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
   echo "mysql is not installed.. going to install it"
   dnf install mysql -y
   validate $? "installing mysql"
else 
   echo "mysql is already installed"
fi