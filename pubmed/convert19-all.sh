#!/usr/bin/bash

for f in $(ls -1 datafiles19/pubmed*$1.xml)
do
    echo "converting $f"
   ./convert19.sh $f > $f.out 2>&1
done
