#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


while IFS= read -r file
do 
  
  USAGE=$(echo $file | grep xfs | awk -F " " '{print $6F}'| cut -d "%" -f1)

  partition=$(echo $file | grep xfs | awk -F " " '{print $NF}')

   if [ $USAGE -ge $DISK_THRESHOLD ]

  then
     echo -e  " $G $partition $N is more than $DISK_THRESHOLD... $Y CURRENT VALUE $N : $USAGE .. PLEASE CHECK"
  fi
  done <<< $DISK_USAGE