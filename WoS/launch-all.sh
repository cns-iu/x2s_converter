#!/bin/bash
# make a list of the x* files and then launch the script to read and parse each one of them, create separate log files.

for f in $(ls -1 x*)
do
    echo "converting $f"
   nohup /data5/wos_2018/launch-one.sh $f > $f.log 2>&1 & 
done
