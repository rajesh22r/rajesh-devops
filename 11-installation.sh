#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]
then 
  echo "please run through root privileges"
  exit 1
fi

dnf list installed git
if [ $? -ne 0 ]
then 
   echo "git is not installed, going to install it"
   dng install git -y
   if [ $? -ne 0 ]
   then 
      echo "git installation is not success... check it"
      exit 1
   else
      echo "git installation is success"
   fi
else 
   echo "git is already installed"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
   echo "mysql is not installed.. going to install it"
   dnf install mysql -y
   if [ $? -ne 0 ]
   then 
     echo "mysql installation is not success"
     exit 1
   else 
      echo " mysql installation is success"
   fi
else 
   echo "mysql is already installed"
fi