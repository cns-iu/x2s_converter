# x2s_converter
xlm to sql conversion similar to the the generic_parser

The generic_parser (https://github.com/cns-iu/generic_parser/edit/master/README.md) but there were some issues that made me crazy.   
- needed more error checking during running.  Often getting a dump during processing with no idea why.
- needed more checking of the meta data conf.xml file versus the actual incoming data stream.  Sometimes items missing from the conf.xml would not be flagged and just be missed.
- needed a way to separate the html from the xml and a way to separate the junky markup from the actual xml.
- needed a way to handle primary master key that was nested below the top level of the xml tree.
- a nice to have was a way to generate the schema and constraints files

Not a complete list of things that would make my life easier but a good start

generic_parser was originally setup to process Clarivate (proviously Thomson-Reuters) Web of Science data to start with and then go on to do MedLine and Clinical Trials data.  The new one did WoS, PubMed/MedLine, Cinical Trials, and USPTO.

We wanted to get ready to process incremental updates so some other features were added that we'll expand on later.

We will have:
- core directory with the common code
- wos, with the scripts and configuration files to process wos
- pubmed, with the scripts and configuration files to process pubmed/medline
- clinical_trials, with the scripts and configuration files to process clinical trials
- uspto, with the scripts and configuration files to process USPTO xml files
