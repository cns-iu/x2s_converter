#!/bin/bash
FILES=$1
while read f ; do
    echo process $[FILES] $f
    ./ngenparse.sh $f 
    /usr/local/bin/naptime 300
done < ${FILES}
