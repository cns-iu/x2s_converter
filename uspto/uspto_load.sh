#!/bin/bash
/usr/local/pgsql/bin/psql -p 5433 -d uspto -c "\i datafiles/ipg/$1" > datafiles/ipg/load_$1.log 2> datafiles/ipg/load_$1.err
