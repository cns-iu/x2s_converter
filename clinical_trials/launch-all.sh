#!/bin/bash
# start a background process for each x file in the directory
for f in $(ls -1 x*)
do
    echo "converting $f"
   nohup ./launch-one.sh $f > $f.log 2>&1 & 
done
