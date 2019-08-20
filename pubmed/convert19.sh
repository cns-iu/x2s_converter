#!/usr/bin/bash
#

/usr/local/bin/x2s_convert.pl -c medline_config.xml -o $1.sql -r PubmedArticle -i "medline_master:pmid" -f $1  --database_mode postgres --xreplace="phn" -s -l
