#!/usr/bin/perl
use strict;
use utf8;
use Math::Complex;
use Switch;

print "For an equation like this: ax² + bx + c = 0\n";
print "Give me a:\n";
my $a = <STDIN>;
chomp($a);

while(!($a =~ /^-?[0-9]+$/)) {
  print "Oh no! You didn't give me an integer for a!!!";
  print "Give me an integer for a:\n";
  $a = <STDIN>;
  chomp($a);
}

print "Give me b:\n";
my $b = <STDIN>;
chomp($b);

while(!($b =~ /^-?[0-9]+$/)) {
  print "Oh no! You didn't give me an integer for b!!!";
  print "Give me an integer for b:\n";
  $b = <STDIN>;
  chomp($b);
}

print "Give me c:\n";
my $c = <STDIN>;
chomp($c);

while(!($c =~ /^-?[0-9]+$/)) {
  print "Oh no! You didn't give me an integer for c!!!";
  print "Give me an integer for c:\n";
  $c = <STDIN>;
  chomp($c);
}


if ($a == 0) {
  if ($b == 0) {
    print "$c = 0, Nobel prize!!!\n";
  } else {
    print "The solution of your equation is ", (-$c/$b), "\n";
  }
} else {

  my $Δ = $b*$b - 4*$a*$c;

  switch($Δ) {
    case 0 {
      my $r = -$b/(2*$a);
      print "The double solution of your equation is $r";
    }
    case { $_[0] > 0 } {
      my $r1 = ($b*$b + sqrt($Δ))/(2*$a);
      my $r2 = ($b*$b - sqrt($Δ))/(2*$a);
      print "The solutions of your equation are $r1 and $r2";
    }
    case  { $_[0] < 0 } {
      my $r1 = ($b*$b + i*sqrt(-$Δ))/(2*$a);
      my $r2 = ($b*$b - i*sqrt(-$Δ))/(2*$a);
      print "The solutions of your equation are $r1 and $r2";
    }
  }
}
