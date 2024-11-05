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
       echo -e " $2 is $G success $N"
    fi
}


for package in $@
do 
   dnf list installed $package
   if [ $? -ne 0 ]
   then 
     echo "$package is not installed, going to install it"
     dnf install $package -y
   validate $? "installing $package"
   else 
   echo "$package is already installed"
   fi
 done  