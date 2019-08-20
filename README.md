# x2s_converter
xlm to sql conversion similar to the the generic_parser

## History

The generic_parser (https://github.com/cns-iu/generic_parser/edit/master/README.md) but there were some issues that made me crazy.   
- needed more error checking during running.  Often getting a dump during processing with no idea why.
- needed more checking of the meta data conf.xml file versus the actual incoming data stream.  Sometimes items missing from the conf.xml would not be flagged and just be missed.
- needed a way to separate the html from the xml and a way to separate the junky markup from the actual xml.
- needed a way to handle primary master key that was nested below the top level of the xml tree.
- a nice to have was a way to generate the schema and constraints files

Not a complete list of things that would make my life easier but a good start

generic_parser was originally setup to process Clarivate (proviously Thomson-Reuters) Web of Science data to start with and then go on to do MedLine and Clinical Trials data.  The new one did WoS, PubMed/MedLine, Cinical Trials, and USPTO.

We wanted to get ready to process incremental updates so some other features were added that we'll expand on later.

## What we have here

We will have:
- core directory with the common code
- wos, with the scripts and configuration files to process wos
- pubmed, with the scripts and configuration files to process pubmed/medline
- clinical_trials, with the scripts and configuration files to process clinical trials
- uspto, with the scripts and configuration files to process USPTO xml files

## x2s_converter

The x2s_converter started out doing what generic_parser did even through it is a complete re-write.

First change was add a lot more debug lines.

Next was to do more testing on the information we were getting.  If we expected a table:column value then test for it.

If we had non-valid values then test and throw an error message.  Provide information like file, record identifer, xml parent/child leaf.  Try to give enough infomation so the config.xml can be corrected and the xml that caused it found.

The program should never dump/abort due to an error.

Next, pass the meta xml location of the primary id to the program.  Check the incoming xml, find the primary value in the file before formal processing the file (kinda preprocess part of the file).  Get the value and use for the actual processing of the xml.

The style of the meta xml conf file changed.  table and ctr_id (table and counter id) are still keywords for the parsing program.  The table=("table_name") is still ok (bare table_name) but all other references must be table_name:column_name.  This includes all attribute values and all data values.  I started to add a padl file to allow for different keywords but not finished yet.

One of the biggest challenges was the fixing of the non-xml from the files.  Some (most) had embedded html, which the parser thought was xml.  Stuff like <p>.   So what ever html that was found was fixed.  Some other the data had mathmatic markup (or other markup languages), this to had to be fixed prior to parsing.  A whole set of subroutines were created to fix the various markups.  The process was to extract the markup and store in a look-a-side table and replace the markup with a unique marker.   After the xml processing was completed, the unique marker was replaced with the original markup text.

Since I had to parse the conf.xml (sometimes referred to as the metadata xml) file, why not generate the sql schema?  I had all the info I needed, so I did.  I also created a sql constraints file.  The schema and constraints had to be created understanding the keys (nesting) from the primary down to the current table.  Thes has to be outputted in reverse order (fewest keys first).  The constraints file had the foreign keys and the cascading delete.  If another file had the same primary key, then the sql said to delete the primary key (which would cascade to all the other tables).  The the standard inserts would put the key and record back in the database.  I have been toying with generating the meta xml data from the actual datafiles but that will be a future update.

filenames feature changed to using the actual filename instead of a csv file with a list of indexes and filenames.

Thinking about future updates, a single record xml file can created with the primary key and the xml record.  I think I will use this to test newer updates we receive to determine is a change occured pre-existing data prior to adding to the sql output.  Only add records that have changed.  

