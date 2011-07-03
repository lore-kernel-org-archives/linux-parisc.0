From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: tst-cputimer1 and tst-timer4
Date: Sun, 3 Jul 2011 13:16:25 -0400
Message-ID: <CADZpyizeDz0mRxLU3-Scx37DZ4jYMtKBjQn6_ZfxMyjhsT6Lkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dave,

Instrumenting tst-cputimer1 yields:
~~
carlos@firin:~/fsrc/glibc-work/tests/tst-cputimer1$ ./tst-cputimer1
clock_gettime returned timespec = { 0, 40000000 }
clock_getres returned timespec = { 0, 1 }
timer_helper_thread: creating thread...

timer_segev_thread: tid 1329
timer_helper_thread: creating thread...
~~~

The first thread starts, the second thread doesn't.

You expressed some worry over this failure:
~~~
1309709905.557733 futex(0xc043e2c8, FUTEX_WAKE_PRIVATE, 1) = 0
1309709905.557733 futex(0xc043e2c8,
FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME, 1, NULL, 0) = -1
EINVAL (Invalid argument)
~~~
This is part of nptl/npt-init.c where the threading system is trying
to determine, at runtime, certain functionality.
The first test is to determine if private futexes e.g.
FUTEX_PRIVATE_FLAG are available, and they are.
The second test is to determine if FUTEX_CLOCK_REALTIME is available,
and it is, the test looks only for ENOSYS on return.

The first thread has a futex operation fail completely:
~~~
[pid  8589] 1309709905.789735 clone(Process 8590 attached
child_stack=0x40e65040,
flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID,
parent_tidptr=0x416644e8, tls=0x41664900, child_tidptr=0x416644e8) =
8590
[pid  8590] 1309709905.789735 set_robust_list(0x416644f0, 0xc <unfinished ...>
[pid  8589] 1309709905.789735 rt_sigtimedwait([RTMIN],  <unfinished ...>
[pid  8590] 1309709905.789735 <... set_robust_list resumed> ) = 0
[pid  8590] 1309709905.789735 gettid()  = 8590
[pid  8590] 1309709905.789735 rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
[pid  8590] 1309709905.789735 clock_gettime(0xfffffffa /* CLOCK_???
*/, {0, 252000000}) = 0
[pid  8590] 1309709905.789735 futex(0x14548, FUTEX_WAKE_OP_PRIVATE, 1,
1, 0x14540, {FUTEX_OP_SET, 0, FUTEX_OP_CMP_GT, 1}) = -1 ENOSYS
(Function not implemented)
~~~
This is a worrisome problem, that's a feature that's expected to work
and doesn't.

It's part of the internal NPTL thread handling, I don't know
specifically which futext it is, but it's important :-)

This needs fixing. I'll look into that next.

Cheers,
Carlos.
