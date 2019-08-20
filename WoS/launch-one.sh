#!/bin/bash
# read the x.. file line by line and run the processing script
FILES=$1
while read f ; do
    echo process $[FILES] $f
    /data5/wos_2018/ngenparse.sh $f 
    /usr/local/bin/naptime 300
done < ${FILES}
