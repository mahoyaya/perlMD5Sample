#!/usr/bin/env perl

use strict;
use warnings;

use Digest::MD5;

my $file = shift(@ARGV);
my $md5 = Digest::MD5->new;
open(my $fh, "<", $file) or die "can\'t open file: $file";
flock($fh, 1);
$md5->addfile($fh);
my $digest = $md5->hexdigest;
close($fh);
print $digest . " " . $file . "\n";

