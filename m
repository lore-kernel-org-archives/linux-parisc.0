From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: futex wait failure
Date: Tue, 22 Dec 2009 10:03:51 -0500 (EST)
Message-ID: <20091222150352.120CB516F@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I recently update gsyprf11 to the latest debian testing.  I also
tried 2.6.32.2, first SMP, then UP because of /bin/sh segmentation
faults.

I think the /bin/sh segmentation faults are the vfork issue, but
the vfork testcases run successfully on the above.

My first attempt at running the GCC testsuite hung:

dave@gsyprf11:~/gcc-4.5/objdir$ ps -ef|grep dave|grep 18073
dave     18073 18064  2 Dec21 ?        00:11:07 expect -- /usr/share/dejagnu/runtest.exp --tool gfortran
dave     18091 18073  0 02:09 ?        00:00:00 [gfortran] <defunct>

dave@gsyprf11:~/gcc-4.5/objdir$ strace -p 18073
Process 18073 attached - interrupt to quit
futex(0x1c538, FUTEX_WAIT_PRIVATE, 2, NULL <unfinished ...>
Process 18073 detached
dave@gsyprf11:~/gcc-4.5/objdir$ strace -p 18091
attach: ptrace(PTRACE_ATTACH, ...): Operation not permitted

This is the backtrace for expect:

0x4039934c in __lll_lock_wait () from /lib/libpthread.so.0
(gdb) bt
#0  0x4039934c in __lll_lock_wait () from /lib/libpthread.so.0
#1  0x4038f9c4 in pthread_mutex_lock () from /lib/libpthread.so.0
#2  0x40b73008 in pthread_mutex_lock () from /lib/libc.so.6
#3  0x4085eeb8 in Tcl_WaitForEvent () from /usr/lib/libtcl8.5.so.0
#4  0x4081ccdc in Tcl_DoOneEvent () from /usr/lib/libtcl8.5.so.0
#5  0x4003d9c4 in exp_get_next_event () from /usr/lib/libexpect.so.5.44.1.14
#6  0x4001c6bc in expRead () from /usr/lib/libexpect.so.5.44.1.14
#7  0x4001eea0 in Exp_ExpectObjCmd () from /usr/lib/libexpect.so.5.44.1.14
...

This is just a guess but I would guess that the gfortran task either
didn't update the futex address, or is blocked from doing so.

libc6 is 2.10.2-2.

This is probably related to the long standing problem with expect
and tcl8.4 and later.  expect-tcl8.3 works better.

Any thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
