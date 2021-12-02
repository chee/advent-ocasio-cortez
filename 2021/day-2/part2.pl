#!/usr/bin/env perl
use 5.34.0;
no warnings 'experimental';

my $horizont = 0;
my $depth = 0;
my $aim = 0;

for (<>) {
	my ($direction, $distance) = (/(\w+)\s+(\d+)/);
	given ($direction) {
		when ("forward") {
			$horizont += $distance;
			$depth += ($aim * $distance);
		}
		when ("up") {
			$aim -= $distance;
		}
		when ("down") {
			$aim += $distance;
		}
	}
}

say $horizont;
say $depth;
say $horizont * $depth;
