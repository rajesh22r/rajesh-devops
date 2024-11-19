#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE(){
    echo -e " $R USAGE $N: sh 18-backup.sh <source dir> <dest dir> <days (optional)>"
}

if [ $# -lt 2 ]
then 
   USAGE
   exit 1
fi

if [ ! -d $SOURCE_DIR ]
then 
    echo "$SOURCE_DIR DOes not exist... please check"
fi

if [ ! -d $DEST_DIR ]
then 
    echo " $DEST_DIR does not exist.... please check "
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "files : $FILES"

if [  -z ${FILES} ]
then 
   echo "Files are found "
   
else 
   echo "no files older than $DAYS"
fi




