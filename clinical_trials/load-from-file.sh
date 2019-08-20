#!/bin/bash
# use the same concept to load the datafiles since CT has 300,000+ files
FILES=$1
while read f ; do
    echo process  $f
    /usr/local/pgsql/bin/psql -p 5433 -d clinical_trials -c "\i $f.sql" > load.log 2> load.err
done < ${FILES}
