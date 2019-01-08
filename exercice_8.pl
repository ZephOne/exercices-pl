#!/usr/bin/perl
use strict;
use utf8;

my $licence_plate;

sub is_correct_licence_plate_number {
  my $licence_plate_number_to_check = shift;
  if ($licence_plate_number_to_check =~ m/^\d{1,3}(\d[A-Z]{1,2}|[A-Z]{1,3})(\d{1,2}|2(A|B))$/) {
    return 1;
  } 
}

if (scalar(@ARGV) == 0) {
  print "Give me a licence plate number so that I can check if it is a correct licence plate number\n";
  $licence_plate = <STDIN>;
  chomp($licence_plate);
} else {
  $licence_plate = $ARGV[0]
}

if ($licence_plate =~ m/^\d{1,3}(\d[A-Z]{1,2}|[A-Z]{1,3})(\d{1,2}|2(A|B))$/) {
  print "This licence plate number is correct!";
} else {
  print "Wrong!!! This licence plate number is not correct!";
}
