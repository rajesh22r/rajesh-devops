#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5


while IFS = read -r file
do 
  
  USAGE=$(echo $file | grep xfs | awk -F " " '{print $6F}'| cut -d "%" -f1)

  partition=$(echo $file | grep xfs | awk -F " " '{print $NF}')

   if [ $USAGE -ge $DISK_THRESHOLD ]

  then
     echo "$partition is more than $DISK_THRESHOLD CURRENT VALUE : $USAGE .. PLEASE CHECK"
  fi
  done <<< $DISK_USAGE