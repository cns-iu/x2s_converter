#!/usr/bin/bash
#
#/usr/local/bin/ngenparse.pl --gen_schema -c ct_config.xml -o ct_schema.sql  -r clinical_study -i "ct_master:nct_id" -f datafiles/NCT0000xxxx/NCT00000102.xml  --database_mode postgres  -l -s
/usr/local/bin/ngenparse.pl --gen_schema -c ct_config.xml -o ct_schema.sql  -r clinical_study -i "ct_master:nct_id" -f ct_config.xml  --database_mode postgres  -l -s
