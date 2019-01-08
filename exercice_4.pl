#!/usr/bin/perl
use strict;
use utf8;

my %hash_name_phone;
my $name;
my $phone;

do {
  print "Give me a name\n";
  $name = <STDIN>;
  chomp($name);

  if($name ne "END") {
    print "Give me a phone number\n";
    $phone = <STDIN>;
    chomp($phone);

    $hash_name_phone{$name} = $phone;
  }

} while ($name ne "END");

my %hash_phone_name = reverse %hash_name_phone;

print "Give me a name or a phone number\n";

my $input = <STDIN>;
chomp($input);

if (exists $hash_name_phone{$input}) {
  print $input, "'s phone number is ", $hash_name_phone{$input};
}

if (exists $hash_phone_name{$input}) {
  print "The name associated to the phone number: ", $input, " is ", $hash_phone_name{$input};
}
