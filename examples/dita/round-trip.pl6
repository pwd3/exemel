#!/usr/bin/env perl6
use v6;
use lib '../../lib';

use XML;

#####################################################################
# round-trip  --  Basic start of processing a DITA file. Read
# 	the input and write the output with no changes.
#####################################################################
sub MAIN ($infile, $outfile ) {
	my $xml = from-xml-file($infile);

	my $fh = open $outfile, :w;
	## at some point I need to add a method tidy that will do what XML::Tidy of perl5 does
	# 	but for now we will just force string with the ~ and output that 
	$fh.say(~$xml);
	}
