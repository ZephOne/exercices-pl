#!/usr/bin/perl
use strict;
use utf8;

sub eratosthene {
  my ($n) = @_;
  my @prime = ();
  if ($n > 2) {
    my @L = (2 .. $n);
    my $p;

    while(scalar(@L) != 0) {
      $p = shift(@L);
      push(@prime, $p);
      @L = grep(($_ % $p) != 0, @L);
    }

    return @prime;
  }
}

my $nombre = $ARGV[0];
my @prime = eratosthene($nombre);
foreach my $prime_number (@prime) {
  print("  ",$prime_number);
}
