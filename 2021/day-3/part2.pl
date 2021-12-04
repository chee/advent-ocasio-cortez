#!/usr/bin/env perl
use 5.34.0;
use List::Util qw(reduce);
open my $filehandle, "<", $ARGV[0] or die;
my @input = <$filehandle>;

sub bits {
	my @bits;
	for (@_) {
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
	return @bits;
}

sub oxy {
	my $len = @_;
	my $common = @_[0];
	my $index = @_[1];
	my @terms = @_[2..$#_];
	my @bits = bits(@terms);

	if ($len == 3) {
		return $_[2];
	}

	my $bit = $common ? $bits[$index] >= 0 : $bits[$index] < 0;

	my @next = grep { substr($_, $index, 1) == $bit } @terms;
	return oxy($common, $index + 1, @next);
}

my $boxygen = oxy(1, 0, @input);
my $bco2 = oxy(0, 0, @input);

my $oxygen = eval("0b$boxygen");
my $co2 = eval("0b$bco2");

say $oxygen * $co2;
