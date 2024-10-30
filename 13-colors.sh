#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]
then 
  echo "please run through root privileges"
  exit 1
fi

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

validate (){
    if [ $1 -ne 0 ]
    then 
       echo -e "$2 is $R failed.. $N check it "
    else 
       echo -e " $2 is $G success "
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
   dnf install mysqlll -y
   validate $? "installing mysql"
else 
   echo "mysql is already installed"
fi