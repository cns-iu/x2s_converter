#!/bin/bash

cd /data5/pubmed/datafiles19/$1
for f in $(ls -1 *.sql)
do
    echo "loading $f"
    time ./load19.sh $f
done
