#!/usr/bin/perl
use strict;
use utf8;

my $n = $ARGV[0];
my $res = 1;
for my $i (1 .. $n) {
  $res = $res * $i;
}
print $res;
