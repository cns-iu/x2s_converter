#!/bin/bash
#
# use the wos_conf.xml
# important to note the --xreplace settings
#
echo x2s_convert $1
/usr/local/bin/x2s_convert.pl -c wos_config.xml -o $1.sql  -r REC -i "wos_summary:uid" -f $1  --database_mode postgres --xreplace="ph" -s -l
