#!/bin/bash

DISK-USAGE=$(df -hT | grep xfs)
DISK-THRESHOLD=5


while IFS = read -r file
do 
  
  USAGE=$(echo $file | grep xfs | awk -F " " '{print $6F}'| cut -d "%" -f1)

  partition=$(echo $file | grep xfs | awk -F " " '{print $NF}'

  if [ $USAGE -ge $DISK-THRESHOLD ]

  then
     echo "$partition is more than $DISK-THRESHOLD 
            CURRENY VALUE : $USAGE .. PLEASE CHECK"
  fi
done <<< $DISK-USAGE