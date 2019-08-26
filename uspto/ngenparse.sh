#!/bin/bash
/usr/local/bin/x2s_convert.pl -c uspto_conf.xml -o $1.sql  -r us-patent-grant -i "pubref:doc_num" -f $1  --database_mode postgres --xreplace "pdxhmco" -l -s
