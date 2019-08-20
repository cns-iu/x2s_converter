#!/bin/bash
cd /data5/wos_2018/CORE_1900-2018
echo $1
time /usr/local/pgsql/bin/psql -p 5433 -d wos_2018 -c "\i $1" > load_$1.log 2> load_$1.err
echo
