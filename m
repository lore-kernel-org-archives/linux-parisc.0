From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/tracehook
Date: Fri, 3 Jul 2009 04:51:24 GMT
Message-ID: <200907030451.n634pOiY024401@hera.kernel.org>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Rebased ref, commits from common ancestor:
commit a1a05b2c74e95132143d10fa2282982076f1b6da
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Mon Apr 27 00:51:13 2009 -0400

    parisc: TIF_NOTIFY_RESUME
    
    Not-yet-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 69ec70ca574565ec6423684bcebc9c543b6eacbc
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Mon Apr 27 00:29:53 2009 -0400

    parisc: tracehook_signal_handler
    
    This makes parisc call the standard tracehook_signal_handler hook
    in <linux/tracehook.h> after setting up a signal handler.
    
    Not-yet-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

commit 9b1332c0151b50526980891d96fe9dec09b5aaaf
Author: Kyle McMartin <kyle@phobos.i.jkkm.org>
Date:   Sun Apr 26 23:53:34 2009 -0400

    parisc: tracehook_report_syscall
    
    This makes parisc use the standard tracehook_report_syscall_entry
    and tracehook_report_syscall_exit hooks in <linux/tracehook.h>.
    
    To do this, we need to access current->thread.regs, and to know
    whether we're entering or exiting the syscall, so add this to
    syscall_trace.
    
    Not-yet-signed-off-by: Kyle McMartin <kyle@mcmartin.ca>

