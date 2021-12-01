#!/usr/bin/env perl
$last;
$incs = 0;

foreach (<>) {
	 if ($last and $last < $_) {
		  $incs += 1;
	 }
	 $last = $_;
}

say $incs;
