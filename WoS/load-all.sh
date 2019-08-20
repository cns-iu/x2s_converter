#!/bin/bash
cd /data5/wos_2018/CORE_1900-2018
for f in $(ls -1 *.sql)
do
    echo "loading $f"
    time /data5/wos_2018/load-one.sh $f
done
