#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOG_FOLDER

userid=$(id -u)
if [ $userid -ne 0 ]
then 
  echo "$R please run through root privileges $N"
  exit 1
fi

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

validate (){
    if [ $1 -ne 0 ]
    then 
       echo -e "$2 is $R failed.. $N check it " &>>$LOG_FILE
    else 
       echo -e " $2 is $G success $N" &>>$LOG_FILE
    fi
}


for package in $@
do 
   dnf list installed $package &>>$LOG_FILE
   if [ $? -ne 0 ]
   then 
     echo "$package is not installed, going to install it" &>>$LOG_FILE
     dnf install $package -y &>>$LOG_FILE
   validate $? "installing $package"
   else 
   echo "$package is already installed" &>>$LOG_FILE
   fi
 done  