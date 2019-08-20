#!/usr/bin/perl

##
## Copyright (C) 2019 Michael T. Gallant.  All rights reserved.
##
## MIT License
##
## Copyright (c) 2019 Michael Gallant
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
##  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.
##----------------------------------------------------------------------
## Function name: x2s_converter
## Author       : mike t gallant
## Date Written : April 30, 2019
##----------------------------------------------------------------------
## Function Title.  replacement for generic_parser
## Function Description.
##----------------------------------------------------------------------
## modified:
##
##----------------------------------------------------------------------
##

use strict;
use warnings;
#use feature qw(say);
use utf8;
use Encode;
use XML::LibXML;
use Getopt::Long;
#use Data::Dumper;

# varables
my $filename = "";
my $filename_short = "";
my $directory = "";
my $config_file = "";
#my $template_file = "";
my $output = "";
my $parent = "";
my $record = "";
#my $namespace = "";
my $identifier = "";
my $use_filename = 0;
my $file_name_xml = "";
my $database_mode = "";
my $single_trans = "";
my $generate_schema = 0;
#my $recurse = "";
my $db_mode = '"';
my $root_tag = "";
my $rec_tag = "";
my $id_tag = "";
my $debug = 0;
my $fh_out;
my $fh_out_c;
#my $fh_err;
#my $fh_dbp;
my $file_out_suffix = "sql";
my $file_dbg_suffix = "dbg";
my $file_err_suffix = "err";
my $xml = "";
my $parent_start = 0;
my $parent_end = 0;
my $parent_start_text = "";
my $parent_end_text = "";
my $record_start = 0;
my $record_start_text = "";
my $record_end = 0;
my $record_end_text = "";
my $record_next_record = "";
my $record_id = "";
my $single_record = "";
my $identifier_path = "";
my $padl = "ngenparse.padl";
#my %html_remove = (ul=>"ul",il=>"il");
my %html_keep = (0=>'i',1=>'b',2=>'sub',3=>'sup',4=>'ul',5=>'il',6=>'u',7=>'smallcaps',8=>'sup2',9=>'sub2',10=>'o',11=>'p');
my %look_aside;
my $look_aside_counter = 0;
my $look_aside_start = 'NGENLAS-';
my $look_aside_end = 'NGEN';
my $xreplace = "";
my @schema_constraints;
my %table_priority;
my $table_priority_built = 0;
my @table_priority_list;
# file handles
my $INFILE;
my $INFILE2;
my $ERRFILE;
my $OUTSINGLEREC;
# data store
# from config
# - xml-path table ctr1
# xml-path table:col data
#  {tablename}=
my %config_path_to_tables; # key=xpath value=table:column  config
my %config_path_to_attr; # key=xpath+attr value=value  config
my %path_to_data;
my %table_to_counter; # list of counters  config
my %attributes;

my %element;  # from config: xpath table:column  config
my %c_node_element; # from config: xpath table:column  config
my %c_attr_element; # from config: xpath table:column  config
my %c_ctr_element; # from config: xpath table:column  config
my %counters;  # key=counter_name (p_ctr) value=count  config
my %path_to_counter;  # xpath => counter (list)  config
my %schema_db_table; # has of all tables and columns
#
#  list of counters startig with id
my @counter_path; # config
#
#  key=tablename => hash key=ctr => hash key = column_name = value
#  db{tablename}{ctr}{col} = value
my %db_tables;  # fnode 

# -V --version - opt_V - version
use vars qw($opt_V);
# -h --help - opt_h - help text
use vars qw($opt_h);
# -v --verbose erbose - more user entertainment
use vars qw($verbose);
# -f --file
#-f optional, but must be either -f or -d, defines a single file to parse
use vars qw($opt_f);
# -d --ddebug
#-d optional, run in debug mode
use vars qw($opt_d);
# -c --config
#-c REQUIRED, defines the configuration file mapping from XML to DB
use vars qw($opt_c);
# -o --output
#-o REQUIRED, can be either a directory, or if a single-file run, a file name.
use vars qw($opt_o);
# -p --parent
#-p optional, marks the container tag for a collection of records, would not be used for single record files
use vars qw($opt_p);
# -r --record
#-r REQUIRED, the tag that defines an individual record
use vars qw($opt_r);
# -n --namespace (not implemented)
#-n optional, if the XML has a namespace, give it here. Assumes a single namespace for the entire file
#use vars qw($opt_n);
# -i --identifier
#-i REQUIRED, the tag that gives the unique identifier for the record. If this is a direct child of the record root, just give the child name, otherwise, starting at that level, give the path.
use vars qw($opt_i);
# -l --filenumber
#-l optional, ran out of good letters, required to use file numbers\
use vars qw($opt_l);
# -m --database_mode
#-m, database mode, a toggle between MySQL and PostgreSQL, text?
use vars qw($opt_m);
# -s --single_line records
# -s, creates single lines xml records in a file
use vars qw($opt_s);
# -g --_gen_schema
use vars qw($opt_g);
# -x --xreplace, replace xml (p), html, other odd characters
# p - clean_para
# d - clean_description
# h - clean_html
# m - clean_maths
# n - clean_nml_maths
# c - clean_claim
# o - clean_oddml
use vars qw($opt_x);
#
my %STATUS=('OK'=>0,'WARNING'=>1,'CRITICAL'=>2,'UNKNOWN'=>3,'DEPENDENT'=>4);
my %conf;
#&parseconf("./test.conf");
#
# sort out command line options
#
Getopt::Long::Configure('bundling');
GetOptions
	("V"     => \$opt_V,   "version"    => \$opt_V,
	 "h"     => \$opt_h,   "help"       => \$opt_h,
	 "d"     => \$opt_d,   "debug"      => \$opt_d,
	 "v"     => \$verbose, "verbose"    => \$verbose,
     "f=s"   => \$opt_f,   "file=s"   => \$opt_f,
     "c=s"   => \$opt_c,   "config=s"   => \$opt_c,
     "o=s"   => \$opt_o,   "output=s"   => \$opt_o,
	 "p=s"   => \$opt_p,   "parent=s"  => \$opt_p,
     "r=s"   => \$opt_r,   "record=s"   => \$opt_r,
	 #"n=s"   => \$opt_n,   "namespace=s"  => \$opt_n,
     "i=s"   => \$opt_i,   "identifier=s"   => \$opt_i,
	 "l"     => \$opt_l,   "filename"  => \$opt_l,
     "m=s"   => \$opt_m,   "database_mode=s"   => \$opt_m,
	 "s"   => \$opt_s,   "single_trans"  => \$opt_s,
	 "g"	=> \$opt_g,	 "gen_schema"	=> \$opt_g,
	 "x=s"	=> \$opt_x,	 "xreplace=s"	=> \$opt_x
     );
#
# print version and exit
#
if ($opt_V) {
	print "$0,1.0.0\n";
	exit $STATUS{'OK'};
}
# use debug
if ($opt_d) {
	$debug = 1;
	print "debug on\n";
}
else {
	$debug = 0;
}
# print help and exit
if ($opt_h) {
    &help;
}
# use verbose
if ($verbose) {
    #
}
# 
if ($opt_f) {
    $filename = $opt_f;
	open($INFILE,"<",$filename) || die "file $filename not found\n";
	open($ERRFILE,">","$filename.err") || die "could not open file $filename.err \n";
	my (@filename_list) = split(/\//,$filename);
	$filename_short = pop @filename_list;
	print "filename_short $filename_short\n" if $debug;
}
else {
    print "no file \n";
    exit 0;
}
#
if ($opt_c) {
    $config_file = $opt_c;
}
else {
    print "config file required\n";
    exit 0;
}
#
if ($opt_p) {
    $parent = $opt_p;
    $root_tag = $opt_p;
	$parent_start_text = $parent;
	# remove <>
	$parent_start_text =~ s/<//g;
	$parent_start_text =~ s/>//g;
	# put ending <? on parent
	$parent_end_text = "</$parent_start_text";
	# put leading < on parent
	$parent_start_text = "<$parent_start_text";
}
#
if ($opt_r) {
    $record = $opt_r;
    $rec_tag = $opt_r;
	$record_start_text = $record;
	# remove <>
	$record_start_text =~ s/<//g;
	$record_start_text =~ s/>//g;
	# put ending <? on parent
	$record_end_text = "</$record_start_text";
	# put leading < on parent
	$record_start_text = "<$record_start_text";
}
else {
    print "record required\n";
    exit 0;
}
#
#if ($opt_n) {
#    $namespace = $opt_n;
#}
#
if ($opt_i) {
    $identifier = $opt_i;
	push @counter_path,$identifier;
}
else {
    print "identifier required\n";
    exit 0;
}
#
if ($opt_l) {
    $use_filename = 1;
}
#
if ($opt_m) {
    $database_mode = $opt_m; 
}
else {
    $database_mode = "postgres";
}
#
if ($opt_s) {
    $single_trans = 1;
	my (@filename_list) = split(/\./,$filename);
	pop @filename_list;
	push @filename_list,"xmlr";
	my $single_filename = join('.',@filename_list);
	open($OUTSINGLEREC,">","$single_filename") || die "can not open $single_filename\n";
}
else {
    $single_trans = 0;
}
#
if ($opt_g) {
	$generate_schema = 1;
	$filename = $config_file;
	print "M:filename:$filename\n" if $debug;
}
else {
	$generate_schema = 0;
}
if ($opt_x) {
	$xreplace = $opt_x;
}
else {
	$xreplace = "";
}
#
my $table_quote = '"';
if ($database_mode eq "mysql") {
    $file_out_suffix = "sql";
	$db_mode = "\'";
}
elsif ($database_mode eq "postgres") {
    $file_out_suffix = "sql";
    }
elsif ($database_mode eq "text") {
	$file_out_suffix = "txt";
}
else {
	print "database mode must be text, mysql or postgres\n";
    exit 0;
}
if ($opt_o) {
	$output = $opt_o;
}
else {
	my (@tmp_out_list) = split(/\./,$filename);
	pop @tmp_out_list;
	push @tmp_out_list, $file_out_suffix;
	$output = join('.',@tmp_out_list);
}
if ($output) {
	open($fh_out,">",$output) || die "can not open $output\n";
	my (@output_list) = split(/\./,$output);
	my $const_output = "";
	if ($opt_g) {
		if (defined $output_list[0]) {
			$const_output = $output_list[0]."_constraints.sql";
		}
		open($fh_out_c,">",$const_output) || die "can not open $const_output\n";
	}
}
#
# process xml config file
#
if (-f $config_file) {
    &process_config;
}
else {
	print "config file $config_file not found\n";
	exit 1;
}
#
# get the path of the id
#
if ($identifier_path eq "") {
	foreach my $i (keys %c_node_element) {
		if ($c_node_element{$i} eq $identifier) {
			$identifier_path = $i;
		}
	}
}
if ($identifier_path eq "") {
	foreach my $i (keys %c_attr_element) {
		if ($c_attr_element{$i} eq $identifier) {
			$identifier_path = $i;
		}
	}
}
#
# use padl input file
#
&padl_read_config($padl);
print "M2:identifier_path $identifier_path\n\n" if $debug;
#
# read file in
# find start of xml record
# then process that group of text
#
print "M3:filename: $filename\n" if $debug;
if (-f $filename) {
	while(<$INFILE>) {
		chomp;
		my $line = $_;
		$line =~ s/\n//g;
		$line =~ s/\r//g;
		# if not parent_start then check for text
		if ($parent ne "") {
			if ($parent_start eq 0) {
				if ($line =~ m/$parent_start_text/) {
					$parent_start = 1;
					#print "dbg1: parent_start\n" if $debug;
				}
			}
			# otherwise start processing records
			else {
				if ($line =~ m/$parent_end_text/) {
					$parent_start = 0;
					#print "dbg12: parent_stop\n" if $debug;
				}

			}
		}
		else {
			# if no parent record needed
			$parent_start = 1;
		}
		# see if we are in a record
		if ($record_start == 0) {
			#print "dbg3: record_start\n$record_start_text\n$line\n" if $debug;
			if ($line =~ m/$record_start_text[\s|>]/) {
				print "dbg4: parent_start\n" if $debug;
				$record_start = 1;
				$xml .= &trim($line)." ";
				print "record_start:$xml\n" if $debug;
			}
		}
		# we are in a record
		else {
			#rint "dbg5: parent_start\n" if $debug;
			$xml .= &trim($line)." ";
			# if we find the record_end
			if ($line =~ m/$record_end_text/) {
				#print "dbg6: parent_start\n" if $debug;
				#if ($parent ne "") {
					#print "dbg7: parent_start\n" if $debug;
				    #$xml = $parent_start_text.">".$xml.$parent_end_text.">";
					
			    #}
				#else {
					
				#}
				if ($single_trans) {
					$single_record = $xml;
				}
				# remove bogus or bad html here
				print "record_end\n" if $debug;
				if (index($xreplace,"d") > -1) {
					&clean_description;
				}
				if (index($xreplace,"p") > -1) {
					print "x:$xreplace:x\n" if $debug;
					&clean_para;
				}
				if (index($xreplace,"h") > -1) {
					&clean_html;
				}
				if (index($xreplace,"m") > -1) {
					&clean_maths;
				}
				if (index($xreplace,"n") > -1) {
					&clean_nml_math;
				}
				if (index($xreplace,"c") > -1) {
					&clean_claim;
				}
				if (index($xreplace,"o") > -1) {
					&clean_oddml;
				}
				#
				# process the record in $line
				#
				print "process_xml\n" if $debug;
				&process_xml;
				#
				# clean up vars and arrays
				#
				$xml = "";
				%look_aside = ();
				$look_aside_counter = 0;
				$record_start = 0;
				if ($single_trans) {
					$single_record = "";
				}
			}
		}
	}
	close $INFILE;
	close $ERRFILE;
}

exit;
#&process_file;

sub process_config {
	my $qcount = 0;
    #
    # header stuff
    #
	print "********** Header **********\nconfig_file:$config_file\n" if $debug;
	#
	# load config into dom
    #
	my $dom = XML::LibXML->load_xml(location => $config_file, no_blanks=>1);
    print "dom is ".ref($dom)."\n" if $debug;
    print '$dom->nodeName is '.$dom->nodeName."\n" if $debug;
    print 'XML Version is: '. $dom->version."\n" if $debug;
    print 'Document encoding is: '. $dom->encoding."\n" if $debug;
    my $is_or_not = $dom->standalone ? 'is' : 'is not';
    print "Document $is_or_not standalone\n" if $debug;
	print "********** Header End **********\n" if $debug;
    #
    # get the root of the document
    #
    my $topdoc = $dom->documentElement();
    print '$topdoc is a '. ref($topdoc)."\n" if $debug;
    print '$topdoc->nodeName is: '. $topdoc->nodeName."\n" if $debug;
	# record (passed in) and primary counter (identifier) need to be set
	$path_to_counter{"/".$parent."/".$record} = $identifier;
	my ($tabc,$colc) = split(/:/,$identifier);
	$table_to_counter{$tabc} = $identifier;
    #
	# start processing the configuration nodes
	#
	print "C0:process_cnode\n" if $debug;
    process_cnode($topdoc);
	#
	# Look at internal tables
	#
	
	print "******** unwind path_to_data ********\n" if $debug;
	foreach my $i (keys %path_to_data) {
		print "T1:$i $path_to_data{$i}\n" if $debug;
	}
	print "******** unwind attributes ********\n" if $debug;
	foreach my $i (keys %attributes) {
		print "T2:$i $attributes{$i}\n" if $debug;
	}
	print "******** unwind counter_path ********\n" if $debug;
	foreach my $i ( @counter_path) {
		print "T3:$i\n" if $debug;
	}
	print "******** unwind db_tables ********\n" if $debug;
	foreach my $i (keys %db_tables) {
		print "T4:$i $db_tables{$i}\n" if $debug;
	}
	#
	# updated in cnode
	#
	$qcount = 0;
	print "\n******** unwind element ********\n" if $debug;
	# element { internal_path } = childNodes->data or a->getValue
	# from nodes and attributes
	foreach my $i (sort(keys %element)) {
		print "C1:$i $element{$i}\n" if $debug;
		$qcount += 1;
	}
	print "Count:$qcount\n" if $debug;
	$qcount = 0;
	print "\n******** unwind c_node_element ********\n" if $debug;
	# c_node_element { internal_path } = childNodes->data
	# from nodes
	foreach my $i (sort(keys %c_node_element)) {
		print "C2:$i $c_node_element{$i}\n" if $debug;
		$qcount += 1;
	}
	print "Count:$qcount\n" if $debug;
	$qcount = 0;
	print "\n******** unwind counters ********\n" if $debug;
	# counter { ctr_id } = initialize
	# from attributes
	foreach my $i (keys %counters) {
		print "C3:$i $counters{$i}\n" if $debug;
		$qcount += 1;
	}
	print "Count:$qcount\n" if $debug;
	$qcount = 0;
	print "\n******** unwind path_to_counter ********\n" if $debug;
	# path_to_counter { internal_path } = ctr_id
	# from attributes
	foreach my $i (keys %path_to_counter) {
		print "C4:$i $path_to_counter{$i}\n" if $debug;
		$qcount += 1;
	}
	print "Count:$qcount\n" if $debug;
	$qcount = 0;
	print "\n******** unwind c_ctr_element ********\n" if $debug;
	# c_ctr_element { internal_path } = a->getValue
	# from attributes
	foreach my $i (sort(keys %c_ctr_element)) {
		print "C5:$i $c_ctr_element{$i}\n" if $debug;
		$qcount += 1;
	}
	print "Count:$qcount\n" if $debug;
	$qcount = 0;
	print "\n******** unwind path_to_attr ********\n" if $debug;
	# config_path_to_attr { internal_path } = a->getValue
	# from attributes
	foreach my $i (keys %config_path_to_attr) {
		print "C6:$i $config_path_to_attr{$i}\n" if $debug;
		$qcount += 1;
	}
	print "Count:$qcount\n" if $debug;
	$qcount = 0;
	print "\n******** unwind table_to_counter ********\n" if $debug;
	# table_to_counter { table part of internal path } = counter_path
	# from attributes
	foreach my $i (keys %table_to_counter) {
		print "C7:$i $table_to_counter{$i}\n" if $debug;
		$qcount += 1;
	}
	print "Count:$qcount\n" if $debug;
	$qcount = 0;
	print "\n******** unwind c_attr_element ********\n" if $debug;
	# c_sttr_element { internal_path/ic_nodename } = a->getValue
	foreach my $i (sort(keys %c_attr_element)) {
		print "C8:$i $c_attr_element{$i}\n" if $debug;
		$qcount += 1;
	}
	print "Count:$qcount\n" if $debug;
	$qcount = 0;
	print "\n******** unwind path_to_tables ********\n" if $debug;
	# config_path_to_tables { internal_path } = data
	# from data  ( but not attributes - ? )
	foreach my $i (keys %config_path_to_tables) {
		print "C9:$i $config_path_to_tables{$i}\n" if $debug;
		$qcount += 1;
	}
	print "Count:$qcount\n" if $debug;
	$qcount = 0;
	print "\n\n" if $debug;
    return;
}

sub process_xml {
    #
	# we get the $xml string and create the $dom tree then start processing
	#
    # header stuff
    #
    #my $dom = XML::LibXML->load_xml(location => $filename, no_blanks=>1);
	print "XStart processing\n" if $debug;
	my $dom = XML::LibXML->load_xml(string => $xml, no_blanks=>1);
    print "Xdom is ".ref($dom)."\n" if $debug;
    print 'X$dom->nodeName is '.$dom->nodeName."\n" if $debug;
    print 'XXML Version is: '. $dom->version."\n" if $debug;
    print 'XDocument encoding is: '. $dom->encoding."\n" if $debug;
    my $is_or_not = $dom->standalone ? 'is' : 'is not';
    print "XDocument $is_or_not standalone\n" if $debug;
    #
    # get the root of the document
    #
    my $topdoc = $dom->documentElement();
    print 'X$topdoc is a '. ref($topdoc)."\n" if $debug;
    print 'X$topdoc->nodeName is: '. $topdoc->nodeName."\n" if $debug;
	#
	# find the id
	#
    my $id = process_find_id($topdoc);
	$record_id = $id;
	$counters{$identifier} = $id;
	print "Xcounter id is $identifier set to $id\n" if $debug;
	print "Xcounter id is $id\n" if $debug;
	#
	#
	#
	if ($single_trans) {
		print $OUTSINGLEREC $id."\t".$single_record."\n";
	}
	#
	# process the xml with xmltree and id
	#
	print "X0:generate_schema:$generate_schema:$topdoc:$id\n" if $debug;
	if (!$generate_schema) {
        &process_fnode($topdoc,$id);
	}
	else {
		&process_schema($topdoc,$id);
	}
	#
	# dump the results
	#
	
	print "Xfinished: dumping\n" if $debug;
	if ($use_filename) {
		print "if_use_filename $file_name_xml:$id\n" if $debug;
		my ($tab,$col) = split(/:/,$file_name_xml);
		if (defined $tab) {
			if (defined $col) {
				my ($tab2,$col2) = split(/:/,$identifier);
				if (defined $tab2) {
					if (defined $col2) {
				        $db_tables{$tab}{"$col2:$id"}{$col} = $filename_short;
					}
				}
			}
		}
	}
	#
	# add back the look_aside data
	#
	foreach my $tbl (keys %db_tables) {
		foreach my $id (keys %{$db_tables{$tbl}}) {
			foreach my $col (keys %{$db_tables{$tbl}{$id}}) {
				#print "looking:".$db_tables{$tbl}{$id}{$col}."\n" if $debug;
				#print "for:".$look_aside_start.'(\d)'.$look_aside_end."\n" if $debug;
				while ($db_tables{$tbl}{$id}{$col} =~ m/$look_aside_start(\d+)$look_aside_end/ ){
					my $out_string = "";
					$out_string = "$tbl,$id,$col,$db_tables{$tbl}{$id}{$col}";
					print "LAS1: ".encode('UTF-8',$out_string)."\n" if $debug;
					#print "found lookaside $1\n" if (defined $1) ;
					my $replace = $look_aside{$look_aside_start.($1).$look_aside_end};
					print "LAS2: ".encode('UTF-8',$replace)."\n" if $debug;
					$db_tables{$tbl}{$id}{$col} =~ s/$look_aside_start(\d+)$look_aside_end/$replace/;
					$out_string = "$tbl,$id,$col,$db_tables{$tbl}{$id}{$col}";
					print "LAS3: ".encode('UTF-8',$out_string)."\n" if $debug;
					#print $db_tables{$tbl}{$id}{$col}."\n" if $debug;
				}
				my $out_string = "";
				$out_string = "$tbl,$id,$col,$db_tables{$tbl}{$id}{$col}";
				print "LAS4: ".encode('UTF-8',$out_string)."\n" if $debug;
			}
		}
	}
	
	#
	# if a text dump run this
	#
	if ($database_mode eq "text") {
	    foreach my $tbl (keys %db_tables) {
		    foreach my $id (keys %{$db_tables{$tbl}}) {
			    foreach my $col (keys %{$db_tables{$tbl}{$id}}) {
				    print $fh_out "tbl:$tbl\tid:$id\tcol:$col\tvalue:$db_tables{$tbl}{$id}{$col}\n";
			    }
		    }
	    }
	}
	#
	# if a postgresql output run this
	#
	if ($database_mode eq "postgres") {
		# generate insert sql 
		if (!$generate_schema) {
			# unwind the db_table HoH
			#  key=tablename => hash key=ctr => hash key=column_name = value
            #  db{tablename}{ctr}{col} = value
			#
			# start with table
			my ($del_tab,$del_col) = split(/:/,$identifier);
			my $results_del_line = "delete from $del_tab where $del_col = \'$id\';\n";
			print $fh_out encode('UTF-8',$results_del_line);
			if (!$table_priority_built) {
				&order_tables;
				$table_priority_built = 1;
			}
			#foreach my $tbl (keys %db_tables) {
			foreach my $tbl (@table_priority_list) {
				my $results_line = "";
				if (exists $db_tables{$tbl}) {
					foreach my $id (keys %{$db_tables{$tbl}}) {
						my @value_list;
						my @col_list;
						foreach my $col (keys %{$db_tables{$tbl}{$id}}) {
							print "tbl:$tbl\tid:$id\tcol:$col\tvalue:$db_tables{$tbl}{$id}{$col}\n" if $debug;
							my $value = $db_tables{$tbl}{$id}{$col};
							$value =~ s/\'/\'\'/g;
							push @col_list,"\"$col\"";
							#if ($value =~ m/^[\d|\.|\,|\']+$/) {
							#if ($value !~ m/[[:punct:]]/g) {
							if ($value =~ m/^[0-9]+$/) {
								push @value_list, "$value";
							}
							else {
								push @value_list, "\'$value\'";
							}
						}
						$results_line = "insert into \"$tbl\" (".join(",",@col_list).') values ('.join(",",@value_list).");\n";
						print $fh_out encode('UTF-8',$results_line);
					}
				}
			}
		}
		#
		# generate schema sql
		#
		else {
			# use elements to get a list of all tables an columns
			foreach my $tc_data (keys %element) {
				if (index($element{$tc_data},":") >= 0) {
				    my ($tab,$col) = split(":",$element{$tc_data});
				    if (defined $tab) {
					    if (defined $col) {
							if (exists $counters{"$tab:$col"}) {
							    $schema_db_table{$tab}{$col} = "int";
							}
							else {
								$schema_db_table{$tab}{$col} = "varchar";
							}
					    }
				    }
				}
			}
			# order the tables
			&order_tables;
			my $identifier_table = "";
			my $identifier_column = "";
			if (index($identifier,":") >= 0) {
				($identifier_table,$identifier_column) = split(/:/,$identifier);
			}
			#foreach my $tbl (keys %db_tables) {
			foreach my $tbl (@table_priority_list) {
				my @column_list;
				my @unique_ids;
				my @foreign_tbl;
				my @foreign_ids;
				print "schema_dump:1:t:$tbl\n" if $debug;
				my $results_line = "";
				# need list of counters
				my (@table_counter_list) = split(/\s+/,$table_to_counter{$tbl});
				foreach my $ctrs (@table_counter_list) {
					my($tbl,$col) = split(/:/,$ctrs);
					if ($ctrs eq $identifier) {
						if ($col eq $identifier_column) {
							push @column_list,"$col varchar";
							push @unique_ids,$col;
							push @foreign_ids,$col;
							push @foreign_tbl,$tbl;
							$schema_db_table{$tbl}{$col} = "x";
						}
					}
					else {
						push @column_list,"$col int";
						push @unique_ids,$col;
						push @foreign_ids,$col;
						push @foreign_tbl,$tbl;
						$schema_db_table{$tbl}{$col} = "x";
					}
				}
				# need remaining items
				foreach my $cols (keys %{$schema_db_table{$tbl}}) {
					if ($schema_db_table{$tbl}{$cols} ne "x") {
						push @column_list,"$cols varchar";
					}
				}
				
				$results_line .= "create table $tbl (\n\t";
				$results_line .= join(",\n\t",@column_list);
				$results_line .= "\n);\n\n";
				print $fh_out $results_line;
				#
				# create the constraints
				#
				$results_line = "";
				#$results_line .= join(",",@unique_ids)."\n";
				#$results_line .= join(",",@foreign_ids)."\n";
				#$results_line .= join(",",@foreign_tbl)."\n";
				$results_line .= "\nalter table only $tbl\n\tadd constraint uni_$tbl unique (";
				$results_line .= join(",",@unique_ids);
				$results_line .= ");\n";
				push @schema_constraints,$results_line;
				if ((scalar @foreign_tbl) > 1) {
					$results_line = "";
					$results_line .= "alter table only $tbl\n\tadd constraint fk_$tbl foreign key (";
					pop @foreign_ids;
					$results_line .= join(",",@foreign_ids);
					pop @foreign_tbl;
					$results_line .= ") references ".(pop @foreign_tbl)."(".join(",",@foreign_ids).") ";
					$results_line .= "on delete cascade;\n";
					push @schema_constraints,$results_line;
				}
			}
			foreach my $sc (@schema_constraints) {
				print $fh_out_c $sc;
			}
		}
	}
	print "\n" if $debug;
	print $fh_out "\n";
	# $db_tables{$tbl}{$identifier_id}{$col} = $b;
	%db_tables = ();
	# clear counters
	foreach my $c (keys %counters) {
		$counters{$c} = 0;
	}
    return;
}

sub process_find_id {
	#
	# id could be an attribute or a node, need to check both
	# use $identifier to find 
	#
    my $node = shift;
	#my $debug = 0;
    my $attributes = "";
    my $data = "";
    my $internal_path = "";
    my $nodename = "";
    my $result = "";
	my $found_id = "";
	my %attributes_hash;
    print "\npfid:process_find_id\n" if $debug;
	print "pfid:look for $identifier\n" if $debug;
    $internal_path = &clean_path($node->nodePath);
    print "pfid:1: ".$node->nodePath."\n" if $debug;
	print "pfid:1.1: ".$internal_path."\n" if $debug;
	#
	# general element check
	#
    my $path = $node->nodePath;
    if ($node->nodeType == XML_ELEMENT_NODE) {
        $nodename = $node->nodeName;
        print 'pfid:2: nodeName is: '. $node->nodeName."\n" if $debug;
        print 'pfid:3: node is a '. ref($node)."\n" if $debug;
        if ($node->hasChildNodes) {
            print "pfid:4: has child nodes\n" if $debug;
        }
        else {
            print "pfid:5: content_text2 ".$node."\n" if $debug;
        }
    }
    elsif ($node->nodeType == XML_TEXT_NODE) {
        print "pfid:6: is text".$node->to_literal."\n" if $debug;
    }
    #
	# check if one of the child nodes is a text node
	# which means has a value
    #$body = encode('UTF-8', $body);
	if ($node->hasChildNodes) {
        foreach my $child ($node->childNodes) {
            # Call process_node recursively.
            if ($child->nodeType == XML_TEXT_NODE) {
                $data = $child->to_literal;
                print "pfid:7: text: ".encode('UTF-8',$child->to_literal)."\n" if $debug;
				#my $ic_nodename = $a->nodeName;
			    #my $key = $internal_path;
				#$c_node_element{$ic_nodename} = $a->getValue;
			    print "pfid:7.1: $internal_path $identifier_path ".encode('UTF-8',$data)."\n" if $debug;
			    if ($internal_path eq $identifier_path) {
				    $result = $data;
			    }
            }
        }
    }
	print "pfid:7.2: d:".encode('UTF-8',$data)." r:".encode('UTF-8',$result)."\n" if $debug;
	#
	# if the childnode has data then
	# put in resutls 
	#
	#if ($data ne ""){
	#	$result = $data;
	#}
    #
	# check attributes
	#
    if ($node->hasAttributes) {
        my (@attr1) = $node->attributes;
        foreach my $a (@attr1) {
            $attributes .= " ".$a->nodeName."=".$a->getValue;
            print "pfid:8: attr= ".$a->nodeName." = ".$a->getValue."\n" if $debug;
			my $ic_nodename = $a->nodeName;
			my $key = $internal_path."/".$ic_nodename;
			# put all the attribues on a hash
			$attributes_hash{$ic_nodename} = $a->getValue;
			print "pfid:8.1: $key $identifier_path\n" if $debug;
			if ($key eq $identifier_path) {
				$result = $a->getValue;
			}
        }
    }
    #if (length($attributes) >= 0) {
    #    $result = "<$nodename$attributes>";
    #    $result .= "$data</$nodename>";
    #}
    #else {
    #    $result = "<$nodename>";
    #    $result .= "$data</$nodename>"; 
    #}
    print "pfid:9: d:".encode('UTF-8',$data)." r:".encode('UTF-8',$result)."\n" if $debug;
	#
	# should have all fields
	# process attributes
	#
	foreach my $b (keys %attributes_hash) {
		print "pfid:10: ".$internal_path."/".$b."\n" if $debug;
		#if (($internal_path."/".$b) eq $identifier_path) {
		#	$result = $attributes_hash{$b};
		#}
		# check if is defined
		if (exists $config_path_to_attr{$internal_path."/".$b}) {
			# have attribute path to a table:col
			print "pfid:11: ".$internal_path."/".$b." ".$config_path_to_attr{$internal_path."/".$b}."\n" if $debug;
			# we have table:column now
			my ($tbl,$col) = split(":",$config_path_to_attr{$internal_path."/".$b},2);
			print "pfid:12: $tbl,$col\n" if $debug;
			# have path
			# path -> table:col  table -> ctr_id
			
			#$db_tables{$tbl}{0}{$col} = $b;
		}
	}
	print "pfid:14: $result\n" if $debug;
	if ($result eq "") {
		print "pfid:15:check children\n" if $debug;
		# No need to check hasChildNodes. If there aren't any
		# children, childNodes will return an empty array.
		if ($node->nodeType == XML_ELEMENT_NODE) {
			if ($node->hasChildNodes) {
				foreach my $child ($node->childNodes) {
					# Call process_node recursively.
					if ($child->nodeType == XML_ELEMENT_NODE) {
						$result = process_find_id($child);
						if ($result ne "") {
							$found_id = $result;
						}
					}
				}
			}
			#else {
			#    say "content_text ".$node->textContent;
			#}
		}
	}
	else {
		print "pfid:result: $result\n" if $debug;
		$found_id = $result;
	}
	
    print "\n" if $debug;
	return($found_id);
}

sub process_fnode {
    my $node = shift;
	my $identifier_id = shift;
    my $attributes = "";
    my $data = "";
    my $internal_path = "";
    my $nodename = "";
    my $result = "";
	my %attributes_hash;
    print "\nprocess_fnode\n" if $debug;
	print "identifier_id: $identifier_id\n" if $debug;
    $internal_path = &clean_path($node->nodePath);
    print "F1: ".$node->nodePath."\n" if $debug;
	print "F1.1: ".$internal_path."\n" if $debug;
    my $path = $node->nodePath;
	# check if this has a path_to_counter
    if (exists $c_ctr_element{$internal_path}) {
        my $tabcol = $c_ctr_element{$internal_path};
		print "1.2:$tabcol\n" if $debug;
        if ($tabcol ne $identifier) {
			print "1.3:$tabcol\n" if $debug;
            if (exists $counters{$tabcol}) {
                $counters{$tabcol} += 1;
				print "1.4:$tabcol,$counters{$tabcol}\n" if $debug;
            }
            else {
                $counters{$tabcol} = 1;
            }
        }
    }
    if ($node->nodeType == XML_ELEMENT_NODE) {
        $nodename = $node->nodeName;
        print '2: nodeName is: '. $node->nodeName."\n" if $debug;
        print '3: node is a '. ref($node)."\n" if $debug;
        if ($node->hasChildNodes) {
            print "4: has child nodes \n" if $debug;
        }
        else {
            print "5: content_text2 ".$node."\n" if $debug;
        }
    }
    elsif ($node->nodeType == XML_TEXT_NODE) {
        print "6: is text",$node->to_literal."\n";
    }
    # check if one of the child nodes is a text node
    if ($node->hasChildNodes) {
        foreach my $child ($node->childNodes) {
            # Call process_node recursively.
            if ($child->nodeType == XML_TEXT_NODE) {
                $data = $child->to_literal;
                print "7: text: ".encode('UTF-8',$child->to_literal)."\n" if $debug;
				# get the tab:col from the config using the xpath
				if (!exists $c_node_element{$internal_path}) {
					print $ERRFILE "ERROR:F1: f:$filename:rec:$record_id:id:$identifier_id element not found:ip: $internal_path\n";
					#sleep(60);
					#exit;
				}
				else {
					my $cn_element = $c_node_element{$internal_path};
					# split the table and column
					if (defined $cn_element) {
						if (index($cn_element,':') >= 0) {
							# extract table:column
							my ($tab,$col) = split(/:/,$cn_element);
							# make sure the table is in the table_to_counter hash
							if (exists $table_to_counter{$tab}) {
								# use table_to_counter to get list of counters for that table
								my $cur_ptr = "";
								$cur_ptr = &new_key($tab);
								print "7.1:$table_to_counter{$tab}\n" if $debug;
								my (@tab_ctr_list) = split(/\s+/,$table_to_counter{$tab});
								# find the ctr for this entry
								#foreach my $r (@tab_ctr_list) {
								#	my ($t1,$c1) = split(/:/,$r);
								#	if ($t1 eq $tab) {
								#		$cur_ptr = $r;
								#	}
								#}
								print "7.2:cur_ptr=$cur_ptr\n" if $debug;
								# need to put the other counters in the array
								my %local_ctr;
								foreach my $r (@tab_ctr_list) {
									my ($t1,$c1) = split(/:/,$r);
									#$db_tables{$tab}{$counters{$cur_ptr}}{$c1} = $counters{$r};
									$db_tables{$tab}{$cur_ptr}{$c1} = $counters{$r};
									$local_ctr{$c1} = 1; # set local ptr in hash to check when adding values
									print "7.3:$tab $cur_ptr $c1 = $counters{$r} $r\n" if $debug;
								}
								# if the col is not a counter
								if (!exists $local_ctr{$col}) {
									# check if there are values (characters) in the string $child->to_literal
									# or maybe concatinate to previous entry - not sure
									my $string_test = $child->to_literal;
									# remove spaces
									$string_test =~ s/\s+//g;
									my $string_test_len = length($string_test);
									if ($string_test_len > 0) {
										if (!exists $db_tables{$tab}{$cur_ptr}{$col}) {
												$db_tables{$tab}{$cur_ptr}{$col} = $child->to_literal;
										}
										else {
											my $output = "ERROR:F2: f:$filename:id:$identifier_id element duplicate key ip:$internal_path tab:$tab ctr:$cur_ptr col:$col newlen: $string_test_len new-v:".$child->to_literal." old-v:$db_tables{$tab}{$cur_ptr}{$col}\n";
											print $ERRFILE encode('UTF-8',$output);
											#sleep(60);
											#exit;
										}
									}
								}
								print "7.4: $tab,$cur_ptr,{$col},".encode('UTF-8',$child->to_literal)." \n" if $debug;
							}
							else {
								print $ERRFILE "ERROR:F3: f:$filename:rec:$record_id:id:$identifier_id table_to_counter for $tab does not exist ip:$internal_path\n";
								#sleep(60);
								#exit;
							}
						}
						else {
							print $ERRFILE "ERROR:F4: f:$filename:rec:$record_id:id:$identifier_id e:$cn_element p:$internal_path $c_node_element{$internal_path} not formated properly\n";
							#sleep(60);
							#exit 1;
						}
					}
					else {
						print $ERRFILE "ERROR:F5: f:$filename:rec:$record_id:id:$identifier_id p:$internal_path internal_path not in c_node_element\n";
					}
					
				}
            }
        }
    }
    #print "content_value ".$node->nodeValue."\n";
    #print "content_text ".$node->textContent."\n";
    #print "content_literal".$node->to_literal."\n";
    # check attributes
	
    if ($node->hasAttributes) {
        my (@attr1) = $node->attributes;
        foreach my $a (@attr1) {
			my $debug = 0;
            $attributes .= " ".$a->nodeName."=".$a->getValue;
            print "8: attr= ".$a->nodeName." = ".$a->getValue."\n" if $debug;
			my $ic_nodename = $a->nodeName;
			my $key = $internal_path."/".$ic_nodename;
			# put all the attribues on a hash
			$attributes_hash{$ic_nodename} = $a->getValue;
			# need table name
			#      table pointer pointers
			#      column name
			#      value
			# have xpath
			#      value
			# c_attr_element xpath -> table : col
			# x_ctr_element  xpath -> table : col - ctr
			# table_to_counter ctr -> list of depend counters
			
			# get tab col from c_attr_element which is path => tab:col
			if (exists $c_attr_element{$key}) {
				my $a1 = $c_attr_element{$key};
				my ($tab,$col) = split(/:/,$a1);
				print "8.1: tab=$tab, col=$col\n" if $debug;
				#foreach my $z (keys %table_to_counter) {
				#	print "8.1.1:$z $table_to_counter{$z}," if $debug;
				#}
				#
				# get table_to_counter from table name
				# should get list of counters
				#
				if (exists $table_to_counter{$tab}) {
					# get the counter list, split counters onto list of counters
					my (@tab_ctr_list) = split(/\s+/,$table_to_counter{$tab});
					my $cur_ptr = "";
					$cur_ptr = &new_key($tab);
					print "8.1.1:$cur_ptr\n" if $debug;
					# find the ctr for this entry
					# look at each table:ctr for the current table
					# when found set the cur_ptr to that t:c pair
					#foreach my $r (@tab_ctr_list) {
					#	my ($t1,$c1) = split(/:/,$r);
					#	if ($t1 eq $tab) {
					#		$cur_ptr = $r;
					#	}
					#}
					# so should have $tab = table name and $cur_ptr for 
					my %local_ctr;
					# need to put the other counters in the array
					foreach my $r (@tab_ctr_list) {
						my ($t1,$c1) = split(/:/,$r);
						# each table:ctr goes on to the db_tables hash
						# will have table, pointer_value for this table, column name, value
						# put every counter into the hash
						#$db_tables{$tab}{$counters{$cur_ptr}}{$c1} = $counters{$r};
						$db_tables{$tab}{$cur_ptr}{$c1} = $counters{$r};					
						print "8.2 t:$tab cp:$cur_ptr id:$cur_ptr c:$c1 v:$counters{$r}\n" if $debug;
						$local_ctr{$c1} = 1; # put every counter in to local_ctr
					}
					# $db_tables{$tab}{$counters{$cur_ptr}}{$ic_nodename} = $a->getValue;
					if (!exists $local_ctr{$col}) {
						print "8.3 !exist $col\n" if $debug;
						if (!exists $db_tables{$tab}{$cur_ptr}{$col}) {
							$db_tables{$tab}{$cur_ptr}{$col} = $a->getValue;
						}
						else {
							print $ERRFILE "ERROR:F6: f:$filename:$identifier attr duplicate key ip:$internal_path t:$tab c:$cur_ptr col:$col n:$ic_nodename v:".$a->getValue."\n";
							#sleep(60);
							#exit;
						}
					}
					print "8.4: $tab,$cur_ptr,{$col},".$a->getValue." \n" if $debug;
					#$db_tables{$tab}{$counters{$cur_ptr}}{$ic_nodename} = $a->getValue;
				}
			}
			else {
				print $ERRFILE "ERROR:F7: f:$filename:rec:$record_id:id:$identifier_id attribute $ic_nodename on $internal_path does not exist\n";
				#sleep(60);
				#exit 0;
			}
        }
    }
    if (length($attributes) >= 0) {
        $result = "<$nodename$attributes>";
        $result .= "$data</$nodename>";
    }
    else {
        $result = "<$nodename>";
        $result .= "$data</$nodename>"; 
    }
    print "9: ".encode('UTF-8',$result)."\n" if $debug;
	# check if this has a path_to_counter
	#if (exists $path_to_counter{$internal_path}) {
	#		my $tabcol = $path_to_counter{$internal_path};
	#	my ($tab,$col) = split(/\s+/,$tabcol,2);
	#	if (exists $counters{$tab}) {
	#		$counters{$tab} += 1;
	#	}
	#	else {
	#		$counters{$tab} = 0;
	#	}
	#}
	#
	# should have all fields
	# process attributes
	#
	foreach my $b (keys %attributes_hash) {
		print "10: ".$internal_path."/".$b."\n" if $debug;
		# check if is defined
		if (exists $config_path_to_attr{$internal_path."/".$b}) {
			# have attribute path to a table:col
			print "11: ".$internal_path."/".$b." ".$config_path_to_attr{$internal_path."/".$b}."\n" if $debug;
			# we have table:column now
			my ($tbl,$col) = split(":",$config_path_to_attr{$internal_path."/".$b},2);
			print "12: $tbl,$col\n" if $debug;
			# have path
			# path -> table:col  table -> ctr_id
			
			#$db_tables{$tbl}{$identifier_id}{$col} = $b;
		}
	}
    # No need to check hasChildNodes. If there aren't any
    # children, childNodes will return an empty array.
    if ($node->nodeType == XML_ELEMENT_NODE) {
        if ($node->hasChildNodes) {
            foreach my $child ($node->childNodes) {
                # Call process_node recursively.
                if ($child->nodeType == XML_ELEMENT_NODE) {
                    process_fnode($child,$identifier_id);
                }
            }
        }
        #else {
        #    print "content_text ".$node->textContent;
        #}
    }
	
    print "\n" if $debug;
	return;
}

sub new_key {
	# key is the table name for $table_to_counter
	my ($tab) = shift;
	my $return_string = "";
	my @tmp_list;
	my (@tab_ctr_list) = split(/\s+/,$table_to_counter{$tab});
	foreach my $tc (@tab_ctr_list) {
		my ($t,$c) = split(/:/,$tc);
		push @tmp_list, $c.":".$counters{$tc};
	}
	$return_string = join(',',@tmp_list);
	return $return_string;
}

sub process_cnode {
    my $node = shift;
	#my $debug = 0;
    my $attributes = "";
    my $data = "";
    my $internal_path = "";
	my $full_path = "";
    my $nodename = "";
	my $nodetype = "";
    my $result = "";
	my $table_name = "";
	my $column_name = "";
	my $ctr_id = "";
	my $fount_ctr = 0;
	my @local_counter_path;
	# copy counter path
	@local_counter_path = @counter_path;
    print "\nprocess_cnode\n" if $debug;
	print "PC0:counter_path:".join(' ',@counter_path)."\n" if $debug;
	# get the xpath
    $internal_path = $node->nodePath;
    print "PC1:nodePath: ".$node->nodePath, "\n" if $debug;
	print "PC1.1:counter_path: ".join(" ",@counter_path)."\n" if $debug;
	print "PC1.2:local_counter_path: @local_counter_path\n" if $debug;
    #my $path = $node->nodePath;
	#
	# if the node is an element then check the
	# to see if there are children
	#
    if ($node->nodeType == XML_ELEMENT_NODE) {
        $nodename = $node->nodeName;
        print 'PC2: nodeName is: '. $node->nodeName."\n" if $debug;
        print 'PC3: node is a '. ref($node)."\n" if $debug;
		$nodetype = ref($node);
        if ($node->hasChildNodes) {
            print "PC4: has child nodes\n" if $debug;
        }
        else {
            print "PC5: content_text2 ",$node."\n" if $debug;
        }
    }
    elsif ($node->nodeType == XML_TEXT_NODE) {
        print "PC6: is text".$node->to_literal."\n" if $debug;
    }
    #
	# check if one of the child nodes is a text node
	# if it is then we have a data node
    #
	if ($node->hasChildNodes) {
        foreach my $child ($node->childNodes) {
            # Call process_node recursively.
            if ($child->nodeType == XML_TEXT_NODE) {
                $data = &trim( $child->to_literal );
                print "PC7:text:".&trim( $child->to_literal ).":" if $debug;
				my $ekey = $internal_path;
				# update element
				if (exists $element{$ekey}) {
					if ($element{$ekey} eq "") {
						if ($data ne "") {
						    $element{$ekey} = $data;
						}
					}
				} # doesnt make sense
				else {
					if ($data ne "") {
						$element{$ekey} = $data;
					}
				}
				&update_schema_db_table($data,"varchar");
				# update c_node_element
				if (exists $c_node_element{$internal_path}) {
					if ($c_node_element{$internal_path} eq "") {
						if ($data ne "") {
							$c_node_element{$internal_path} = $data;
						}
					}
				}
				else {
					if ($data ne ""){
						$c_node_element{$internal_path} = $data;
					}
				}
				print "\nPC7.1: $ekey : $internal_path : $data : $c_node_element{$internal_path} :\n" if $debug;
            }
        }
    }
	#print "7.2: $internal_path: $c_node_element{$internal_path}:$element{$internal_path}\n" if $debug;
    #print "content_value ".$node->nodeValue;
    #print "content_text ".$node->textContent;
    #print "content_literal".$node->to_literal;
    # check attributes
    if ($node->hasAttributes) {
        my (@attr1) = $node->attributes;
        foreach my $a (@attr1) {
            $attributes .= " ".$a->nodeName."=".$a->getValue;
            print "PC8: attr= ".$a->nodeName." = ".$a->getValue."\n" if $debug;
			my $ic_nodename = $a->nodeName;
			my $key = $internal_path."/".$ic_nodename;
			print "PC8.0: key = $key\n" if $debug;
			# if the attribute is a counter
			if ($ic_nodename eq "ctr_id") {
				push @counter_path,$a->getValue;
				print "PC8.1: @counter_path\n" if $debug;
				# get the pointer name
				$ctr_id = $a->getValue;
				# set counter of ctr
				$counters{$ctr_id} = 0;
				$path_to_counter{$internal_path} = $ctr_id;
				$element{$internal_path} = $a->getValue;
				$c_ctr_element{$internal_path} = $a->getValue;
				$config_path_to_attr{$internal_path} = $a->getValue;
				&update_schema_db_table($a->getValue,"int");
				# need table name
				print "PC8.2: $internal_path:$ctr_id:".$a->getValue."\n" if $debug;
				print "PC8.3: $config_path_to_attr{$internal_path}\n" if $debug;
				my ($tab,$col) = split(/:/,$config_path_to_attr{$internal_path});
				print "" if $debug;
				$table_to_counter{$tab} = join(" ",@counter_path);
				print "PC8.3.1:$tab:$table_to_counter{$tab}\n" if $debug;
			}
			# if the attribute is a table
			elsif ($ic_nodename eq "table") {
				$table_name = $a->getValue;
				if ("/$parent/$record" eq $internal_path) {
					$table_to_counter{$table_name} = $identifier;
					$path_to_counter{$internal_path} = $identifier;
					#push @counter_path,$identifier;
				}
			}
			# if the attribute is the filename
			elsif ($ic_nodename eq "xml_file_name") {
				$file_name_xml = $a->getValue;
				print "PC8.3.1:file_name_xml:$file_name_xml\n" if $debug;
				&update_schema_db_table($a->getValue,"varchar");
			}
			# everything else
			else {
				$config_path_to_attr{$key} = $a->getValue;
				my $ekey = $internal_path."/".$ic_nodename;
				$element{$ekey} = $a->getValue;
				$c_attr_element{$ekey} = $a->getValue;
				&update_schema_db_table($a->getValue,"varchar");
			}
        }
    }
	print "PC8.4: @counter_path\n" if $debug;
	$path_to_counter{$internal_path} = join(" ",@counter_path);
    if (length($attributes) >= 0) {
        $result = "<$nodename$attributes>";
        $result .= "$data";
    }
    else {
        $result = "<$nodename>";
        $result .= "$data"; 
    }
    print "PC9:".$result."\n" if $debug;
	$config_path_to_tables{$internal_path} = $data;
	print "PC10: $internal_path : $config_path_to_tables{$internal_path} : $data\n" if $debug;
	
    # No need to check hasChildNodes. If there aren't any
    # children, childNodes will return an empty array.
    if ($node->nodeType == XML_ELEMENT_NODE) {
        if ($node->hasChildNodes) {
            foreach my $child ($node->childNodes) {
                # Call process_node recursively.
                if ($child->nodeType == XML_ELEMENT_NODE) {
                    process_cnode($child);
                }
            }
        }
        #else {
        #    print "content_text ".$node->textContent;
        #}
    }
	@counter_path = @local_counter_path;
    print "PC11:</$nodename>\n\n" if $debug;
	return;
}

sub process_schema {
    my $node = shift;
	my $identifier_id = shift;
    my $attributes = "";
    my $data = "";
    my $internal_path = "";
    my $nodename = "";
    my $result = "";
	my %attributes_hash;
    print "\nprocess_schema\n" if $debug;
	print "identifier_id: $identifier_id\n" if $debug;
    $internal_path = &clean_path($node->nodePath);
    print "S1: ".$node->nodePath."\n" if $debug;
	print "S1.1: ".$internal_path."\n" if $debug;
    my $path = $node->nodePath;
	# check if this has a path_to_counter
    if (exists $c_ctr_element{$internal_path}) {
        my $tabcol = $c_ctr_element{$internal_path};
        if ($tabcol ne $identifier) {
			print "S1.2: $tabcol\n" if $debug;
            if (exists $counters{$tabcol}) {
                $counters{$tabcol} += 1;
            }
            else {
                $counters{$tabcol} = 1;
            }
        }
    }
    if ($node->nodeType == XML_ELEMENT_NODE) {
        $nodename = $node->nodeName;
        print 'S2: nodeName is: '. $node->nodeName."\n" if $debug;
        print 'S3: node is a '. ref($node)."\n" if $debug;
        if ($node->hasChildNodes) {
            print "S4: has child nodes \n" if $debug;
        }
        else {
            print "S5: content_text2 ".$node."\n" if $debug;
        }
    }
    elsif ($node->nodeType == XML_TEXT_NODE) {
        print "S6: is text".$node->to_literal."\n";
    }
    # check if one of the child nodes is a text node
    if ($node->hasChildNodes) {
        foreach my $child ($node->childNodes) {
            # Call process_node recursively.
            if ($child->nodeType == XML_TEXT_NODE) {
                $data = $child->to_literal;
                print "S7: text: ".$child->to_literal."\n" if $debug;
				# get the tab:col from the config using the xpath
				if (!exists $c_node_element{$internal_path}) {
					print $ERRFILE "ERROR:S1: f:$filename:$identifier_id element not found: $internal_path\n";
					#sleep(60);
					#exit;
				}
				my $cn_element = $c_node_element{$internal_path};
				# split the table and column
				if (defined $cn_element) {
					if (index($cn_element,':') < 0) {
						print $ERRFILE "ERROR:S2: f:$filename:$identifier e:$cn_element p:$internal_path $c_node_element{$internal_path} not formated properly\n";
						#sleep(60);
						#exit 1;
					}
				}
				else {
					print $ERRFILE "ERROR:S3: f:$filename:$identifier p:$internal_path internal_path not in c_node_element\n";
				}
				my ($tab,$col) = split(/:/,$cn_element);
				if (exists $table_to_counter{$tab}) {
					# use table_to_counter to get list of counters for that table
					my (@tab_ctr_list) = split(/\s+/,$table_to_counter{$tab});
					my $cur_ptr = "";
					# find the ctr for this entry
					foreach my $r (@tab_ctr_list) {
						my ($t1,$c1) = split(/:/,$r);
						if ($t1 eq $tab) {
							$cur_ptr = $r;
						}
					}
					# need to put the other counters in the array
					foreach my $r (@tab_ctr_list) {
						my ($t1,$c1) = split(/:/,$r);
						$db_tables{$tab}{$counters{$cur_ptr}}{$c1} = $counters{$r};
						print "S:$tab $counters{$cur_ptr} {$c1} = $counters{$r} $r\n" if $debug;
					}
					$db_tables{$tab}{$counters{$cur_ptr}}{$col} = $child->to_literal;
					print "S7.2: $tab,$counters{$cur_ptr},$col,".$child->to_literal." \n" if $debug;
				}
            }
        }
    }
    #print "content_value ".$node->nodeValue;
    #print "content_text ".$node->textContent;
    #print "content_literal".$node->to_literal;
    # check attributes
	
    if ($node->hasAttributes) {
        my (@attr1) = $node->attributes;
        foreach my $a (@attr1) {
            $attributes .= " ".$a->nodeName."=".$a->getValue;
            print "S8: attr= ".$a->nodeName." = ".$a->getValue."\n" if $debug;
			my $ic_nodename = $a->nodeName;
			my $key = $internal_path."/".$ic_nodename;
			# put all the attribues on a hash
			$attributes_hash{$ic_nodename} = $a->getValue;
			# need table name
			#      table pointer pointers
			#      column name
			#      value
			# have xpath
			#      value
			# c_attr_element xpath -> table : col
			# x_ctr_element  xpath -> table : col - ctr
			# table_to_counter ctr -> list of depend counters
			
			# get tab col from c_attr_element
			if (exists $c_attr_element{$key}) {
				# c_attr_element{key} path -> tab:col
				# get tab and col
				my $a1 = $c_attr_element{$key};
				my ($tab,$col) = split(/:/,$a1);
				print "S8.1: $tab, $col\n" if $debug;
				# check tab on table_to_counters
				if (exists $table_to_counter{$tab}) {
					# get the counter list 
					my (@tab_ctr_list) = split(/\s+/,$table_to_counter{$tab});
					my $cur_ptr = "";
					# find the ctr for this entry
					foreach my $r (@tab_ctr_list) {
						my ($t1,$c1) = split(/:/,$r);
						# if the t1 is found
						if ($t1 eq $tab) {
							$cur_ptr = $r;
						}
					}
					# need to put the other counters in the array
					foreach my $r (@tab_ctr_list) {
						my ($t1,$c1) = split(/:/,$r);
						# table pointer-counter-value col
						$db_tables{$tab}{$counters{$cur_ptr}}{$c1} = $counters{$r};
					}
					#
					my ($tabcol,$colcol) = split(/:/,$a->getValue);
					if (!defined $tabcol) {
						print $ERRFILE "ERROR:S3.1: tablcol for ".$a->getValue." not defined\n";
						print "ERROR:S3.1: tabcol for ".$a->getValue." not defined\n";
					}
					if (!defined $colcol) {
						print $ERRFILE "ERROR:S3.1: colcol for ".$a->getValue." not defined\n";
						print "ERROR:S3.1: colcol for ".$a->getValue." not defined\n";
					}
					$db_tables{$tab}{$counters{$cur_ptr}}{$colcol} = $a->getValue;
					# $db_tables{$tab}{$counters{$cur_ptr}}{$ic_nodename} = $a->getValue;
					print "S8.2: t:$tab,cp:$cur_ptr,ctr:$counters{$cur_ptr},ic:$ic_nodename,v:".$a->getValue." \n" if $debug;
					#$db_tables{$tab}{$counters{$cur_ptr}}{$ic_nodename} = $a->getValue;
				}
			}
			else {
				if ($key eq "$internal_path/table" || $key eq "$internal_path/ctr_id") {
					print "S warning: found $key\n" if $debug;
				}
				else {
				    print $ERRFILE "ERROR:S4: f:$filename:$identifier attribute $ic_nodename on $internal_path does not exist\n" if $debug;
				    exit 0;
				}
			}
        }
    }
    if (length($attributes) >= 0) {
        $result = "<$nodename$attributes>";
        $result .= "$data</$nodename>";
    }
    else {
        $result = "<$nodename>";
        $result .= "$data</$nodename>"; 
    }
    print "S9: ".$result."\n" if $debug;
	# check if this has a path_to_counter
	#if (exists $path_to_counter{$internal_path}) {
	#		my $tabcol = $path_to_counter{$internal_path};
	#	my ($tab,$col) = split(/\s+/,$tabcol,2);
	#	if (exists $counters{$tab}) {
	#		$counters{$tab} += 1;
	#	}
	#	else {
	#		$counters{$tab} = 0;
	#	}
	#}
	#
	# should have all fields
	# process attributes
	#
	foreach my $b (keys %attributes_hash) {
		print "S10: ".$internal_path."/".$b."\n" if $debug;
		# check if is defined
		if (exists $config_path_to_attr{$internal_path."/".$b}) {
			# have attribute path to a table:col
			print "S11: ".$internal_path."/".$b." ".$config_path_to_attr{$internal_path."/".$b}."\n" if $debug;
			# we have table:column now
			my ($tbl,$col) = split(":",$config_path_to_attr{$internal_path."/".$b},2);
			print "S12: $tbl,$col\n" if $debug;
			# have path
			# path -> table:col  table -> ctr_id
			
			#$db_tables{$tbl}{$identifier_id}{$col} = $b;
		}
	}
    # No need to check hasChildNodes. If there aren't any
    # children, childNodes will return an empty array.
    if ($node->nodeType == XML_ELEMENT_NODE) {
        if ($node->hasChildNodes) {
            foreach my $child ($node->childNodes) {
                # Call process_node recursively.
                if ($child->nodeType == XML_ELEMENT_NODE) {
                    process_schema($child,$identifier_id);
                }
            }
        }
        #else {
        #   print "content_text ".$node->textContent;
        #}
    }
	
    print "\n" if $debug;
	return;
}

sub clean_para {
	#my $debug = 0;
	my $done = 0;
	print "clean_xml:1:$xml\n" if $debug;
	print "clean_xml:2:len:".length($xml)."\n" if $debug;
	my $start = 0;
	my $start_off = 0;
	my $start_new = 0;
	my $finish = 0;
	while ($done == 0) {
		# look for <p id
		# find </p> after
		# if ($xml =~ m/<p id=(.+)<\/p>/) {
		# if ($xml =~ m/<p id=\"(P-\d+)\" num=\"(\d+)\">(.+)<\/p>/) 
		my $xml_delim = "p";
		# find starting <
		$start = index($xml,('<'.$xml_delim.' '),$start_new);
		if ($start < 0) {
			$start = index($xml,('<'.$xml_delim.'>'),$start_new);
		}
		print "clean_xml:3:$start\n" if $debug;
		if ($start < 0) {
			$done = 1;
		}
		else {
			# move index counter by 1
			$start_new = $start + 1;
		}
		if ($done == 0) {
			$look_aside_counter += 1;
			# build look aside string
		    my $local_counter = $look_aside_start.$look_aside_counter.$look_aside_end;
			# find end of >
			$start_off = index($xml,'>',$start);
			$finish = index($xml,('</'.$xml_delim.'>'),$start);
			print "clean_xml:".substr($xml,$start_off+1,(($finish)-$start_off-1))."\n" if $debug;
			print "clean_xml:s/f/len:$start,$start_off,$finish,".length($xml)."\n" if $debug;
			$look_aside{$local_counter} = substr($xml,$start_off+1,(($finish)-$start_off-1),"$local_counter");
			print "clean_xml:x:$local_counter:$look_aside{$local_counter}\n" if $debug;
			print "clean_xml:finish len:".length($xml)."\n" if $debug;
		}
	}
	print "clean_xml:End: $look_aside_counter\n\n" if $debug;
	return;
}

sub clean_maths {
	my $debug = 0;
	my $done = 0;
	print "clean_maths:1:$xml\n" if $debug;
	print "clean_maths:2:len:".length($xml)."\n" if $debug;
	my $start = 0;
	my $start_off = 0;
	my $start_new = 0;
	my $finish = 0;
	while ($done == 0) {
		# look for <p id
		# find </p> after
		# if ($xml =~ m/<p id=(.+)<\/p>/) {
		# if ($xml =~ m/<p id=\"(P-\d+)\" num=\"(\d+)\">(.+)<\/p>/) 
		my $xml_delim = "maths";
		$start = index($xml,('<'.$xml_delim.' '),$start_new);
		print "clean_maths:3:$start\n" if $debug;
		if ($start < 0) {
			$done = 1;
		}
		else {
			$start_new = $start + 1;
		}
		if ($done == 0) {
			$look_aside_counter += 1;
		    my $local_counter = $look_aside_start.$look_aside_counter.$look_aside_end;
			$start_off = index($xml,'>',$start);
			$finish = index($xml,('</'.$xml_delim.'>'),$start);
			print "clean_maths:".substr($xml,$start_off+1,(($finish)-$start_off-1))."\n" if $debug;
			print "clean_maths:s/f/len:$start,$start_off,$finish,".length($xml)."\n" if $debug;
			$look_aside{$local_counter} = substr($xml,$start_off+1,(($finish)-$start_off-1),"$local_counter");
			print "clean_maths:x:$local_counter:$look_aside{$local_counter}\n" if $debug;
			print "clean_maths:finish len:".length($xml)."\n" if $debug;
		}
	}
	print "clean_maths:End:$xml\n\n" if $debug;
	print "clean_maths: $look_aside_counter\n" if $debug;
	#exit;
	return;
}

sub clean_description {
	my $debug = 0;
	my $done = 0;
	print "clean_description:1:$xml\n" if $debug;
	print "clean_description:2:len:".length($xml)."\n" if $debug;
	my $start = 0;
	my $start_off = 0;
	my $start_new = 0;
	my $finish = 0;
	while ($done == 0) {
		# look for <p id
		# find </p> after
		# if ($xml =~ m/<p id=(.+)<\/p>/) {
		# if ($xml =~ m/<p id=\"(P-\d+)\" num=\"(\d+)\">(.+)<\/p>/) 
		my $xml_delim = "description";
		$start = index($xml,('<'.$xml_delim.' '),$start_new);
		print "clean_description:3:$start\n" if $debug;
		if ($start < 0) {
			$done = 1;
		}
		else {
			$start_new = $start + 1;
		}
		if ($done == 0) {
			$look_aside_counter += 1;
		    my $local_counter = $look_aside_start.$look_aside_counter.$look_aside_end;
			$start_off = index($xml,'>',$start);
			$finish = index($xml,('</'.$xml_delim.'>'),$start);
			print "clean_description:".substr($xml,$start_off+1,(($finish)-$start_off-1))."\n" if $debug;
			print "clean_description:s/f/len:$start,$start_off,$finish,".length($xml)."\n" if $debug;
			$look_aside{$local_counter} = substr($xml,$start_off+1,(($finish)-$start_off-1),"$local_counter");
			print "clean_description:x:$local_counter:$look_aside{$local_counter}\n" if $debug;
			print "clean_description:finish len:".length($xml)."\n" if $debug;
		}
	}
	print "clean_description:End:$xml\n\n" if $debug;
	print "clean_description: $look_aside_counter\n" if $debug;
	#exit;
	return;
}

sub clean_nml_math {
	my $debug = 0;
	my $done = 0;
	#print "clean_nml_math:1:$xml\n" if $debug;
	#print "clean_nml_math:2:len:".length($xml)."\n" if $debug;
	my $start = 0;
	my $start_off = 0;
	my $start_new = 0;
	my $finish = 0;
	my $finish_off = 0;
	my %xml_list;
	$xml_list{"1"} = "DispFormula";
	$xml_list{"2"} = 'mml:math';
	foreach my $xml_delim_key (sort (keys %xml_list)) {
		$done = 0;
		$start_new = 0;
		my $xml_delim = $xml_list{$xml_delim_key};
		print "$xml_delim\n" if $debug;
		while ($done == 0) {
			$start = 0;
			$start_off = 0;
			$finish = 0;
			$finish_off = 0;
			# look for <p id
			# find </p> after
			# if ($xml =~ m/<p id=(.+)<\/p>/) {
			# if ($xml =~ m/<p id=\"(P-\d+)\" num=\"(\d+)\">(.+)<\/p>/) 
			#my $xml_delim = 'mml:math';
			$start = index($xml,('<'.$xml_delim.' '),$start_new);
			if ($start < 0) {
				$start = index($xml,('<'.$xml_delim.'>'),$start_new);
			}
			#print "clean_nml_math:3:$start\n" if $debug;
			if ($start < 0) {
				$done = 1;
			}
			else {
				$start_new = $start + 1;
				print "clean_nml_math:4:$xml\n\n" if $debug;
				print "clean_nml_math:5:$xml_delim\n" if $debug;
			}
			if ($done == 0) {
				$look_aside_counter += 1;
				my $local_counter = $look_aside_start.$look_aside_counter.$look_aside_end;
				$start_off = index($xml,'>',$start);
				$finish = index($xml,('</'.$xml_delim.'>'),$start);
				$finish_off = $finish + length('</'.$xml_delim.'>');
				#print "clean_nml_math:5:".substr($xml,$start_off+1,(($finish)-$start_off-1))."\n" if $debug;
				print "clean_nml_math:6:$start,$start_off,$finish,$finish_off\n" if $debug;
				print "clean_nml_math:7:".substr($xml,$start,(($finish_off)-$start))."\n" if $debug;
				print "clean_nml_math:8:s/f/len:$start,$start_off,$finish,".length($xml)."\n" if $debug;
				$look_aside{$local_counter} = substr($xml,$start,(($finish_off)-$start),"$local_counter");
				print "clean_nml_math:9:x:$local_counter:$look_aside{$local_counter}\n" if $debug;
				print "clean_nml_math:10:finish len:".length($xml)."\n" if $debug;
			}
		}
	}
	#print "clean_nml_math:9:End:$xml\n\n" if $debug;
	#print "clean_nml_math:10: $look_aside_counter\n" if $debug;
	#exit;
	return;
}

sub clean_claim {
	my $debug = 0;
	my $done = 0;
	print "clean_claim:1:$xml\n" if $debug;
	print "clean_claim:2:len:".length($xml)."\n" if $debug;
	my $start = 0;
	my $start_off = 0;
	my $start_new = 0;
	my $finish = 0;
	while ($done == 0) {
		# look for <p id
		# find </p> after
		# if ($xml =~ m/<p id=(.+)<\/p>/) {
		# if ($xml =~ m/<p id=\"(P-\d+)\" num=\"(\d+)\">(.+)<\/p>/) 
		my $xml_delim = "claim";
		$start = index($xml,('<'.$xml_delim.' '),$start_new);
		print "clean_claim:3:$start\n" if $debug;
		if ($start < 0) {
			$done = 1;
		}
		else {
			$start_new = $start + 1;
		}
		if ($done == 0) {
			$look_aside_counter += 1;
		    my $local_counter = $look_aside_start.$look_aside_counter.$look_aside_end;
			$start_off = index($xml,'>',$start);
			$finish = index($xml,('</'.$xml_delim.'>'),$start);
			print "clean_claim:".substr($xml,$start_off+1,(($finish)-$start_off-1))."\n" if $debug;
			print "clean_claim:s/f/len:$start,$start_off,$finish,".length($xml)."\n" if $debug;
			$look_aside{$local_counter} = substr($xml,$start_off+1,(($finish)-$start_off-1),"$local_counter");
			print "clean_claim:x:$local_counter:$look_aside{$local_counter}\n" if $debug;
			print "clean_claim:finish len:".length($xml)."\n" if $debug;
		}
	}
	print "clean_claim:End:$xml\n\n" if $debug;
	print "clean_claim: $look_aside_counter\n" if $debug;
	#exit;
	return;
}

sub clean_html {
	my $done = 0;
	my $debug = 0;
	print "clean_html:1:$xml\n" if $debug;
	print "clean_html:2:len:".length($xml)."\n" if $debug;
	my $start = 0;
	my $start_off = 0;
	my $start_new = 0;
	my $finish = 0;
	foreach my $xml_delim (sort(keys %html_keep)) {
		$done = 0;
		$start = 0;
		$start_new = 0;
		my $short_ref = "<".$html_keep{$xml_delim}.">";
		my $long_ref = "<".$html_keep{$xml_delim}." ";
		my $end_ref = "</".$html_keep{$xml_delim}.">";
		my $oddball_ref = "<".$html_keep{$xml_delim}.'/>';
		&replace_short_tag($oddball_ref);
		&replace_short_tag($short_ref);
		&replace_short_tag($end_ref);
		&replace_long_tag($long_ref);
		print "clean_html:End:$xml\n" if $debug;
		#exit;
	}
	print "clean_html: $look_aside_counter\n" if $debug;
	return;
}
##----------------------------------------------------------------------
#
# clear_oddml
# clean up stuff with leading <?
# insert-start, insert-end, img, delete-start, delete-end
#
##----------------------------------------------------------------------
sub clean_oddml {
	my $done = 0;
	my $debug = 0;
	print "clean_oddml:1:$xml\n" if $debug;
	print "clean_oddml:2:len:".length($xml)."\n" if $debug;
	my $start = 0;
	my $start_off = 0;
	my $start_new = 0;
	my $finish = 0;
	my %oddml_keep;
	$oddml_keep{'0'} = '<?insert-start';
	$oddml_keep{'1'} = '<?insert-end';
	$oddml_keep{'2'} = '<?img';
	$oddml_keep{'3'} = '<?delete-start';
	$oddml_keep{'4'} = '<?delete-end';
	foreach my $xml_delim (sort(keys %oddml_keep)) {
		$done = 0;
		$start = 0;
		$start_new = 0;
		my $odd_ref = $oddml_keep{$xml_delim};
		&replace_odd_tag($odd_ref);
		print "clean_oddml:End:$xml\n" if $debug;
		#exit;
	}
	print "clean_html: $look_aside_counter\n" if $debug;
	return;
}
##----------------------------------------------------------------------
#
# replace_odd_tag
# find begining of tag
# find end of tag ?>
# replace with look_aside
#
##----------------------------------------------------------------------
sub replace_odd_tag {
	# this will replace a standard long tag like <u id="xyz"> 
	my ($tag) = shift;
	my $done = 0;
	my $start = 0;
	my $start_new = 0;
	my $finish = 0;
	my $start_off = 0;
	my $debug = 0;
	while ($done == 0) {
		# look for <p id
		# find </p> after
		# if ($xml =~ m/<p id=(.+)<\/p>/) {
		# if ($xml =~ m/<p id=\"(P-\d+)\" num=\"(\d+)\">(.+)<\/p>/)
		#
		# find tag start position
		$start = index($xml,$tag,$start_new);
		#print "replace_odd_tag:1:s $start\n" if $debug;
		if ($start < 0) {
			$done = 1;
		}
		else {
			$start_new = $start + 1;
		}
		if ($done == 0) {
			$look_aside_counter += 1;
			my $local_counter = $look_aside_start.$look_aside_counter.$look_aside_end;
			# find end of tag - start_offset
			$start_off = 2+index($xml,'?>',$start) - $start;
			#print $xml."\n";
			print "replace_odd_tag:2:s/f/l-".$start.",",$start_off,",".substr($xml,$start,$start_off).",".$local_counter."\n" if $debug;
			# replace start position, start_offset 
			$look_aside{$local_counter} = substr($xml,$start,$start_off,"$local_counter");
			#print $look_aside{$local_counter}.":::$xml\n";
		}
	}
	return;
}
##----------------------------------------------------------------------
#
# replace_short_tag
# this will replace a standard short tag like <u> or </u>
#
##----------------------------------------------------------------------
sub replace_short_tag {
	my ($tag) = shift;
	my $done = 0;
	my $start = 0;
	my $start_new = 0;
	my $finish = 0;
	my $debug = 0;
	while ($done == 0) {
		# look for <p id
		# find </p> after
		# if ($xml =~ m/<p id=(.+)<\/p>/) {
		# if ($xml =~ m/<p id=\"(P-\d+)\" num=\"(\d+)\">(.+)<\/p>/)
		#
		# find tag starting position
		$start = index($xml,$tag,$start_new);
		print "replace_short_tag:1:$start\n" if $debug;
		if ($start < 0) {
			$done = 1;
		}
		else {
			$start_new = $start + 1;
		}
		if ($done == 0) {
			$look_aside_counter += 1;
			my $local_counter = $look_aside_start.$look_aside_counter.$look_aside_end;
			# find length of tag
			$finish = length($tag);
			print "replace_short_tag:2:s/f/len:$start,$finish,".length($xml).",".substr($xml,$start,$finish)."\n" if $debug;
			# replace tag from start position, length
			$look_aside{$local_counter} = substr($xml,$start,$finish,"$local_counter");
			print "replace_short_tag:3:x:$local_counter:$look_aside{$local_counter}\n" if $debug;
			print "replace_short_tag:4:finish len:".length($xml)."\n" if $debug;
		}
	}
	return;
}
##----------------------------------------------------------------------
#
# replace_long_tag
# this will replace a standard long tag like <u id="xyz">
#
##----------------------------------------------------------------------
sub replace_long_tag {
	my ($tag) = shift;
	my $done = 0;
	my $start = 0;
	my $start_new = 0;
	my $finish = 0;
	my $start_off = 0;
	my $debug = 0;
	while ($done == 0) {
		# look for <p id
		# find </p> after
		# if ($xml =~ m/<p id=(.+)<\/p>/) {
		# if ($xml =~ m/<p id=\"(P-\d+)\" num=\"(\d+)\">(.+)<\/p>/)
		#
		# find tag start position
		$start = index($xml,$tag,$start_new);
		print "replace_long_tag:1:s $start\n" if $debug;
		if ($start < 0) {
			$done = 1;
		}
		else {
			$start_new = $start + 1;
		}
		if ($done == 0) {
			$look_aside_counter += 1;
			my $local_counter = $look_aside_start.$look_aside_counter.$look_aside_end;
			# find end of tag - start_offset
			$start_off = 1+index($xml,'>',$start) - $start;
			#print $xml."\n";
			print "replace_long_tag:2:s/f/l-".$start.",",$start_off,",".substr($xml,$start,$start_off).",".$local_counter."\n" if $debug;
			# replace start position, start_offset 
			$look_aside{$local_counter} = substr($xml,$start,$start_off,"$local_counter");
			#print $look_aside{$local_counter}.":::$xml\n";
		}
	}
	return;
}
##----------------------------------------------------------------------
#
# padl_read_config
# read padl file
#
##----------------------------------------------------------------------

sub padl_read_config {
	# padl parser
    my ($cfile) = @_;
    if (-f $cfile) {
        open($INFILE2, "<",$cfile) || die "Can't open $cfile\n";
        while (<$INFILE2>) {
            chomp;
            if (/^([a-z_]+)\s+(.*)/) {
                $conf{$1} = $2;
            }
        }
        close($INFILE2);
    }
	return;
}
##----------------------------------------------------------------------
#
# clean_path
# clean the internal path string and return
#
##----------------------------------------------------------------------
sub clean_path {
	my (@inlist) = @_;
	my $debug = 0;
	my $instring = "";
	if (defined $inlist[0]) {
		$instring = $inlist[0];
	}
	# print "instring: $instring\n";
	my $outstring;
	my @outlist;
	my (@liststring) = split(/\//,$instring);
	print "clean_path: @liststring\n" if $debug;
	foreach my $i (@liststring) {
		my $tmp = $i;
		$tmp =~ s/\[\d+\]$//g;
	    push @outlist, $tmp;
	}
	$outstring = join('/',@outlist);
	return $outstring;
}

##----------------------------------------------------------------------
#
# Perl trim function to remove whitespace from the start and end of the string
#
##----------------------------------------------------------------------
sub trim {
        my ($string) = @_;
        $string =~ s/^\s+//;
        $string =~ s/\s+$//;
        return $string;
}

sub update_schema_db_table {
	my ($input,$value) = @_;
	if (index($input,":") >= 0) {
		my ($tab,$col) = split(":",$input);
		if (defined $tab) {
			if (defined $col) {
				$schema_db_table{$tab}{$col} = $value;
			}
		}
	}
	return;
}

sub order_tables {
	# find look at table to counter to find which tables
	# have the fewest depend tables
	#foreach my $tbl (keys %db_tables) {
	#foreach my $tbl (keys %table_to_counter) {
	foreach my $tbl (keys %schema_db_table) {
		if (exists $table_to_counter{$tbl}) {
			my $tbl_txt = $table_to_counter{$tbl};
			my $tbl_len = scalar(split(/\s+/,$tbl_txt));
			# table_priority {numeric length } = list of tables with that length
			if (exists $table_priority{$tbl_len}) {
				$table_priority{$tbl_len} .= " ".$tbl;
			}
			else {
				$table_priority{$tbl_len} = $tbl;
			}
		}
		else {
			print "ERROR:X10: table $tbl is not in table_to_counter\n";
		}
	}
	# start with lowest dependent table and build table priority list
	foreach my $q (sort(keys %table_priority)) {
		my (@table_p_list) = split(/\s+/,$table_priority{$q});
		foreach my $l (@table_p_list) {
			push @table_priority_list,$l;
			print "priority:$q:$l\n" if $debug;
		}
	}
	return;
}

sub help {
    print '
    usage: %prog [options] arg"
	"-f", "--file", dest="filename", help="parse a single file")
	-f optional, but must be either -f or -d, defines a single file to parse
	"-d", "--debug", turn on all the debugging messages - there are a lot be warned
	-d optional
	"-c", "--config", dest="config_file", help="configuration file")
	-c REQUIRED, defines the configuration file mapping from XML to DB
	"-o", "--output", dest="output", help="output file")
	-o REQUIRED, a single-file run, a file name.
	"-p", "--parent", dest="parent", help="Name of the parent tag (tag containing the group of records")
	-p optional, marks the container tag for a collection of records, would not be used for single record files
	"-r", "--record", dest="record", help="Name of the tag that defines a single record")
	-r REQUIRED, the tag that defines an individual record
	"-i", "--identifier", dest="identifier", help="Name of the tag whose value contains the unique identifier for the record")
	-i REQUIRED, the tag that gives the unique identifier for the record. If this is a direct child of the record root, just give the child name, otherwise, starting at that level, give the path.
	"-l", "--file_number", dest="file_number_sheet", help="CSV file with the file name to file number lookup")
	-l optional, ran out of good letters, required to use file numbers\
	"-m", "--database_mode", dest="database_mode", help="MySQL or Postgres, defaults to Postgres")
	-m, database mode, a toggle between MySQL and PostgreSQL?
	"-s", "--single_trans", dest="single_trans", help="If true, will enable one transaction per file, cannot have transaction statements in the template, if so")
	-s, wraps the entire file\'s output into a single transaction, good for speed if DB has an autocommit that you can\'t disable.
    ';
    exit 0;
}