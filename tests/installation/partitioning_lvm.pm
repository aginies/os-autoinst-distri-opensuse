#!/usr/bin/perl -w
use strict;
use base "y2logsstep";
use bmwqemu;

sub run() {
    my $self = shift;

    send_key "alt-d";
    sleep 2;

    send_key "alt-l", 1;    # enable LVM-based proposal
    if ( $vars{ENCRYPT} ) {
        send_key "alt-y", 1;
        assert_screen "inst-encrypt-password-prompt";
        sendpassword;
        send_key "tab";
        sendpassword;
        send_key "ret", 1;
        assert_screen "partition-cryptlvm-summary", 3;
    }
    else {
        assert_screen "partition-lvm-summary", 3;
    }
    wait_idle 5;
    send_key "alt-o";
}

1;
# vim: set sw=4 et: