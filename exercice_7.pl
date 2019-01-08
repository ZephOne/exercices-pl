#!/usr/bin/perl
use strict;
use utf8;

my %stock;

sub add_wine {
  my ($name, $quantity) = @_;
  if (exists $stock{$name}) {
    $stock{$name} += $quantity;
  } else {
    $stock{$name} = $quantity;
  }

  open(HANDLE, "+>Stock") or die $!;
  for my $key (keys %stock) {
    print HANDLE $key, ": ", $stock{$key}, "\n";
  }
  close(HANDLE);
}

sub print_stock {
  for my $key (keys %stock) {
    print $key, ": ", $stock{$key}, "\n";
  }
}

while (1) {
  print "Give me the name of the wine you bought\n";
  my $name = <STDIN>;
  chomp($name);
  if ($name eq "") {
    print_stock();
  } else {
    print "How many bottles did you buy?\n";
    my $quantity = <STDIN>;
    chomp($quantity);

    add_wine($name, $quantity);
  }
}
