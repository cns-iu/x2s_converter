# uspto load process

put list of filenames in file_list.txt (ls -1 *.xml > file_list.txt)

use sort - sort -R file_list.txt > file_random.txt

split -d -l 16 file_random.txt - creates x00 to x46

## Scripts:
launch-all.sh - launches one process put x** file

launch-one.sh - reads the lines in the x** file and runs ngenparse.pl on the file

uspto_load.sh - loads one file into database

uspto-load-all.sh - loads the files in the file_list.txt into the database

ngenparse.sh - calls the x2s_converter.pl for one file

ngenparse-schema.sh - calls the x2s_converter.pl for creating the schema

## files:

uspto_schema_20190731.sql has the postgresq schema

uspto_schema_20190731_constraints.sql - has the added contraints that need applied

## quick start

You can get the last uspto.sql file here https://info.ils.indiana.edu/~gallantm/uspto_baseline.sql.gz  
