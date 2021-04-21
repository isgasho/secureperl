#!/usr/bin/env perl

use 5.018;
use strict;
use warnings;
use Perl::Critic;
use Path::Iterator::Rule;
use Getopt::Long qw(:config no_ignore_case);

sub main {
    my (@target, $notify);

    GetOptions (
        "t|target=s"   => \@target,
        "n|notify=f"   => \$notify
    );

    my $rule = Path::Iterator::Rule -> new() -> file() -> not_empty();
    
    $rule -> skip_dirs(".git") -> file();
    $rule -> name("*.pl", "*.pm", "*.t");
    
    for my $file ($rule -> all(@target)) {
        my $critic = Perl::Critic -> new();
        my @violations = $critic -> critique($file);

        if (@violations) {
            print "\n[!] $file \n[+] @violations"; 

            if ($notify) {
                # secrets.GIT_TOKEN
            }
        }
    }
}

main();
exit;