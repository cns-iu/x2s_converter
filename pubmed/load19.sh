#!/bin/bash
/usr/local/pgsql/bin/psql -p 5433 -d pubmed19 -c "\i $1" > load_$1.log 2> load_$1.err
