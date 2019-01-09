#!/usr/bin/perl
use strict;
use utf8;
use Math::Complex;
binmode(STDOUT, ":utf8");

print "For an equation like this: ax² + bx + c = 0\n";
print "Give me a:\n";
my $a = <STDIN>;
chomp($a);
print "Give me b:\n";
my $b = <STDIN>;
chomp($b);
print "Give me c:\n";
my $c = <STDIN>;
chomp($c);

my $Δ = $b*$b - 4*$a*$c;

if ($Δ == 0) {
  my $r = -$b/(2*$a);
  print "The double solution of your equation is $r";
} else {
  my $r1;
  my $r2;
  if ($Δ > 0) {
    $r1 = ($b*$b + sqrt($Δ))/(2*$a);
    $r2 = ($b*$b - sqrt($Δ))/(2*$a);
  } else {
    $r1 = ($b*$b + i*sqrt(-$Δ))/(2*$a);
    $r2 = ($b*$b - i*sqrt(-$Δ))/(2*$a);
  }
  print "The solutions of your equation are $r1 and $r2";
}
