# Clinical Trials setup 

put list of filenames in file_list.txt (ls -1 *.xml > file_list.txt)

use sort - sort -R file_list.txt > file_random.txt

split -d -l 16 file_random.txt - creates x00 to x46

## Scripts:
launch-all.sh - launches one process put x** file

launch-one.sh - reads the lines in the x** file and runs ngenparse.pl on the file

load-from-file.sh - loads the files in the file_list.txt into the database

ngenparse.sh - calls the x2s_converter.pl for one file

ct_schema.sh - calls the x2s_converter.pl for creating the schema

## files:

ct_schema.sql has the postgresq schema

ct_schema_contraints.sql has the contraints 

## quick start

You can get the last uspto.sql file here https://info.ils.indiana.edu/~gallantm/ct_20190826.sql.gz
