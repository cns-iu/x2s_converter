#!/bin/bash
# get a file with a list of datafiles
# do each one
FILES=$1
while read f ; do
    echo process $[FILES] $f
    ./ngenparse.sh $f 
done < ${FILES}
