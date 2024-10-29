#!/bin/bash

echo "all variables passed to the script : $@"
echo "number of variables passed : $#"
echo "script name : $0"
echo "current working directory : $PWD"
echo "home directory of user : $home"
echo "pid of script executing now: $$"
sleep 100 &
echo "pid of last background command: $!"