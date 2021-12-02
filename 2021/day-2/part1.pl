#!/usr/bin/env perl
use 5.34.0;
no warnings 'experimental';

my $horizont = 0;
my $depth = 0;

for (<>) {
	my ($direction, $distance) = (/(\w+)\s+(\d+)/);
	given ($direction) {
		when ("forward") {
			$horizont += $distance;
		}
		when ("up") {
			$depth -= $distance;
		}
		when ("down") {
			$depth += $distance;
		}
	}
}

say $horizont;
say $depth;
say $horizont * $depth;
