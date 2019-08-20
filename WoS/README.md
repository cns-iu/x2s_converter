Here are the files used to run the conversions on the Clarivate WoS data files.

# Converting
## Preparing

put list of filenames in file_list.txt
use sort - sort -R file_list.txt > file_random.txt
split -d -l 16 file_random.txt - creates x00 to x46

## Scripts:
launch-all.sh - launches one process put x** file
launch-one.sh - reads the lines in the x** file and runs ngenparse.pl on the file

## files:
WR_2017_20190216071953_CORE_0007.xml
WR_2017_20190216071953_CORE_0007.xml.err
WR_2017_20190216071953_CORE_0007.xml.r
WR_2017_20190216071953_CORE_0007.xml.sql
load_WR_2017_20190216071953_CORE_0007.xml.sql.err
load_WR_2017_20190216071953_CORE_0007.xml.sql.log
