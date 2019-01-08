#!/usr/bin/perl
use strict;
use utf8;

print "Which letter are you looking for?\n";
my $char_to_find = <STDIN>;
chomp($char_to_find);

my $count = 0;
my $filename = "Perec.txt";
open(HANDLE, $filename) or die $!;
while (<HANDLE>) {
  while (length($_)) {
    my $char = chop($_);
    if($char eq $char_to_find || $char eq uc($char_to_find)) {
      $count += 1;
    }
  }
}
close(HANDLE);

print $count;
