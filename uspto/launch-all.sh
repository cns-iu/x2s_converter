#!/bin/bash

for f in $(ls -1 x*)
do
    echo "converting $f"
    nohup ./launch-one.sh $f > $f.log 2>&1 & 
done
