#!/bin/bash
# parse each file
echo x2s_convert $1
/usr/local/bin/ngenparse.pl -c ct_config.xml -o $1.sql  -r clinical_study us-patent-grant -i "ct_master:nct_id" -f $1  --database_mode postgres  -l -s
