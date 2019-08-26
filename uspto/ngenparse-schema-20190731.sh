#!/bin/bash
/usr/local/bin/x2s_convert.pl -c uspto_conf.xml -o uspto_schema_20190731.sql  -r us-patent-grant -i "pubref:doc_num" -f uspto_conf-2.xml  --gen_schema --database_mode postgres --debug --xrecord=""
