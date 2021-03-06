# SUSE's openQA tests
#
# Copyright © 2009-2013 Bernhard M. Wiedemann
# Copyright © 2012-2016 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

use base "opensusebasetest";
use testapi;
use utils;

sub run() {
    wait_idle;

    #send_key "ctrl-alt-delete"; # does open task manager instead of reboot
    x11_start_program "lxsession-logout";
    assert_screen "logoutdialog", 20;
    send_key "tab";    # reboot
    save_screenshot;
    send_key "ret";    # confirm
    wait_boot;
}

sub test_flags() {
    return {important => 1, milestone => 1};
}
1;

# vim: set sw=4 et:
