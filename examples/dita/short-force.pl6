#!/usr/bin/env perl6
use v6;
use lib '../../lib';

use XML;

#####################################################################
# short-force  --  Each dita topic can have a short description but some
# 	don't have to. This will find the short description and print 
# 	it if it is there, if not it will add one. It will then output
# 	a new dita topic with the change. (will output in all cases)
#####################################################################
sub MAIN ($infile, $outfile ) {
	my $xml = from-xml-file($infile);

	my @sdesc = $xml.getElementsByTagName('shortdesc');
	if @sdesc.elems == 1 {
		say "we have a shortdesc element of " ~ @sdesc[0];
		}
	elsif @sdesc.elems > 1 {
		say "That's odd, we have more than one shortdesc " ~ @sdesc;
		}
	else {
		say "We don't have a shortdesc, we will need to insert one";
		}
	
	my $fh = open $outfile, :w;
	$fh.say(~$xml);
	}
