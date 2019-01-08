#!/usr/bin/perl
use strict;

my %stock;

my %price = (
  'Bordeaux' => 25,
  'Bourgogne' => 40,
  'Bourgueil' => 33,
  'Bandol' => 29,
);

sub add_wine {
  my ($name, $quantity) = @_;
  if (exists $stock{$name}) {
    $stock{$name} += $quantity;
  } else {
    $stock{$name} = $quantity;
  }
}

sub print_stock {
  for my $key (keys %stock) {
    print $key, ": ", $stock{$key}, "\n";
  }
}

sub calculate_stock_price {
  my $stock_price = 0;
  for my $key (keys %stock) {
    if (exists($price{$key})) {
      $stock_price += $price{$key} * $stock{$key};
    } else {
      $stock_price += 12 * $stock{$key};
    }
  }

  return $stock_price;
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
  my $stock_price = calculate_stock_price();
  print "Your stock costs ", $stock_price, "€\n";
}
