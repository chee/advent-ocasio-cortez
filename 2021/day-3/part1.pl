#!/usr/bin/env perl
use 5.34.0;
use List::Util qw(reduce);
open my $filehandle, "<", $ARGV[0] or die;
my @input = <$filehandle>;
my @bits;

for (<>) {
	chomp;
	my $index = 0;
	foreach my $bit (split //) {
	   if ($bit == 1) {
			$bits[$index] += 1;
		} elsif ($bit == 0) {
			$bits[$index] -= 1;
		}
		$index += 1;
	}
}

my $gamma = 0;
my $sigma = 0;
my $bgamma = reduce {
	state $times = 0;
	if ($times == 0) {
		$a = $a > 0 ? 1 : 0;
	}
	$times++;
	$a . ($b > 0 ? 1 : 0);
} @bits;

my $gamma = eval("0b$bgamma");
my $bsigma = join('', map { $_ == 0 ? 1 : 0 } split(//, $bgamma));
my $sigma = eval("0b$bsigma");

say $gamma * $sigma;
