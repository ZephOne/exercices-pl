#!/usr/bin/perl
use strict;
use utf8;

foreach my $i (1 .. $ARGV[0]) {
  foreach my $j (1 .. $ARGV[1]) {
    printf("%4d", $i*$j);
  }
  print "\n";
}
