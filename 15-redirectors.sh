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
       echo -e "$R $2 is  failed.. $N check it " | tee -a $LOG_FILE
    else 
       echo -e " $G $2 is  success $N" | tee -a $LOG_FILE
    fi
}
USAGE(){

echo -e "$R USAGE : $N sudo sh 15-redirectors.sh package1 package2 "
exit 1

}
if [ $# -eq 0 ]
then 
  USAGE
fi
echo "script started executing at : $(date)" | tee -a $LOG_FILE
for package in $@
do 
   dnf list installed $package &>>$LOG_FILE
   if [ $? -ne 0 ]
   then 
     echo "$R $package is not installed, $N going to install it" | tee -a $LOG_FILE
     dnf install $package -y &>>$LOG_FILE
   validate $? "installing $package"
   else 
   echo "$Y $package is already installed"$N  | tee -a $LOG_FILE
   fi
 done  