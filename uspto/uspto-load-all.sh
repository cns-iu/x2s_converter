#!/bin/bash
cd datafiles/ipg
for f in $(ls -1 *.sql)
do
    echo "loading $f"
    time ../uspto_load.sh $f
done
