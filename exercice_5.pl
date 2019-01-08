#!/usr/bin/perl
use strict;
use utf8;

sub convert_from_c_to_k {
  my $t = shift;
  return $t + 273.15;
}
sub convert_from_f_to_k {
  my $t = shift;
  return $t*0.555556 + 255.37;
}
sub convert_from_k_to_c {
  my $t = shift;
  return $t - 273.15;
}
sub convert_from_k_to_f {
  my $t = shift;
  return ($t - 255.37)/0.555556;
}

sub add_temperature {
  my $sum = 0;
  foreach my $t (@_) {
    $sum = $sum + $t;
  }
  return $sum;
}

sub mean {
  return add_temperature(@_)/scalar(@_);
}

sub File_Tab {
  my $file = shift;
  open(HANDLE, "<$file") or die ("not open TempPt1");
  my @tab = ();
  while (<HANDLE>) {
    chomp($_);
    push(@tab, $_);
  }
  close(HANDLE);

  foreach my $t (@tab) {
    my $unit = chop($t);
    if ($unit eq "C") {
      $t = convert_from_c_to_k($t);
    } elsif ($unit eq "F") {
      $t = convert_from_f_to_k($t);
    }
  }

  return @tab;
}

my @Tab1 = File_Tab("TempPt1.txt");
my @Tab2 = File_Tab("TempPt2.txt");
my @Tab3 = File_Tab("TempPt3.txt");
my $tab1_mean = mean(@Tab1);
my $tab2_mean = mean(@Tab2);
my $tab3_mean = mean(@Tab3);

my @temp_moy = ();

for my $i (0 .. scalar(@Tab1) - 1) {
  push(@temp_moy, add_temperature($Tab1[$i], $Tab2[$i], $Tab3[$i])/3)
}


open(HANDLE, ">Resultat.txt") or die ("not open Resultat.txt");
for my $i (0 .. scalar(@Tab1) - 1) {
  my $first_80_lines =($i + 1).("\t").$Tab1[$i]."K "."\t".$Tab2[$i]."K"."\t".$Tab3[$i]."K"."\t".$temp_moy[$i]."K";
  print(HANDLE $first_80_lines, "\n\n");
}
  print(HANDLE $tab1_mean."K\t\t".$tab2_mean."K\t\t".$tab3_mean."K\n");
  print(HANDLE convert_from_k_to_f($tab1_mean)."F\t".convert_from_k_to_f($tab2_mean)."F\t".convert_from_k_to_f($tab3_mean)."F\n");
  print(HANDLE convert_from_k_to_c($tab1_mean)."C\t".convert_from_k_to_c($tab2_mean)."C\t".convert_from_k_to_c($tab3_mean)."C\n");
close(HANDLE);
