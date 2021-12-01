#!/usr/bin/env perl
use 5.34.0;
use List::Util qw(sum);
open my $filehandle, "<", $ARGV[0] or die;
my @input = <$filehandle>;
my $incs = 0;
my $last;

foreach (@input) {
	state $index = 0;
	if ($index > 2) {
		my $window = sum(@input[($index - 2)..$index]);
		if ($window > $last) {
			$incs += 1;
		}
		$last = $window;
	}
	$index += 1;
}

say $incs;
