#!/usr/bin/env perl

use 5.018;
use strict;
use warnings;
use Perl::Critic;
use Path::Iterator::Rule;

sub main {
    my $rule = Path::Iterator::Rule -> new() -> file() -> not_empty();
    
    $rule -> skip_dirs(".git") -> file();
    $rule -> name("*.pl", "*.pm", "*.t");

    for my $file ($rule -> all(@ARGV)) {
        my $critic = Perl::Critic -> new();
        my @violations = $critic -> critique($file);

        if (@violations) {
            print "
                \r[-] $file
                \r[+] @violations
            \r"; 
        }
    }
}

main();
exit;