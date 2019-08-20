#!/bin/bash
#
# create the schema and constraints files
# temp.xml was a single dummy wos entry (one record) - not sure still needed
#
/usr/local/bin/x2s_convert.pl -c wos_config.xml -o wos_schema_20190724.sql  -r REC -i "wos_summary:uid" -f temp.xml  --gen_schema --database_mode postgres --debug --xrecord="" -l
