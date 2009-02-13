From: Helge Deller <deller@gmx.de>
Subject: [RFC] pthread/signal problems on hppa (ruby1.9 problems)
Date: Fri, 13 Feb 2009 01:43:37 +0100
Message-ID: <4994C239.8010009@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Lucas Nussbaum <lucas@lucas-nussbaum.net>
To: linux-parisc <linux-parisc@vger.kernel.org>,
	Carlos O'Donell <carlos@systemhalted.org>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dann frazier <dannf@dannf.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

As you know we sometimes still see problems with signal handling with
multithreaded programs on hppa.
Up to now the assumption was, that signals were delivered to wrong threads/processes, which I now think is wrong.

We see exactly this kind of signal/threading problems while running the testcase when building the ruby1.9 package.
The test "test_thread.rb" will just hang.
If you want to reproduce the problem it's easy. Just get ruby1.9 source, run dpkg-buildpackage 
and you see it will hang while running the test_thread.rb testcase.

I asked Lucas if he could reduce the testcase, and his testcase is below. Just save this ruby program
as "rubytest.rb" and run it with ruby1.9, e.g. "ruby1.9 testcase.rb":
<----->
#!/usr/bin/ruby1.9
out = IO.popen("ruby1.9 -e 'STDERR.reopen(STDOUT)' -e 'at_exit{Process.kill(:INT, $$); loop{}}'") {|f| f.read }
<----->

The strace files for hppa and i386 are downloadable here: (The i386 version succeeds/finishes, while hppa hangs)
http://userweb.kernel.org/~deller/ruby1.9.bug/output.hppa.log
http://userweb.kernel.org/~deller/ruby1.9.bug/output.i386.log

This is what I think (somewhat simplified) happens:
a) The program starts, sets signal handlers (in this case for SIGINT).
b) The program calls clone().
c) The child thread unblocks SIGINT delivery.
d) The parent thread blocks SIGINT delivery.
e) The parent thread sends itself the SIGINT signal, aka kill(parent_pid, SIGINT)
f) Since parent thread blocked SIGINT signals to itself, this will now happen:
	- on i386: The child thread receives the signal (instead of the parent thread) and stops program execution successfully.
	- on hppa: Neither child nor parent threads receives the signal, both will just hang.

This is the example with i386:
rt_sigaction(SIGINT, {0x8048555, [], SA_SIGINFO}, {SIG_DFL}, 8) = 0
clone(Process 30263 attached (waiting for parent)
Process 30263 resumed (parent 30262 ready)
child_stack=0x804b904, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM) = 30263
[pid 30263] rt_sigprocmask(SIG_UNBLOCK, [INT], [], 8) = 0
[pid 30262] rt_sigprocmask(SIG_BLOCK, [INT], [], 8) = 0
[pid 30262] getpid()                    = 30262
[pid 30262] kill(30262, SIGINT)         = 0
[pid 30263] --- SIGINT (Interrupt) @ 0 (0) ---
[pid 30263] exit_group(1)               = ?
<sucessfully finished>

and here with hppa:
rt_sigaction(SIGINT, {0x8048555, [], SA_SIGINFO}, {SIG_DFL}, 8) = 0
clone(Process 30272 attached (waiting for parent)
Process 30272 resumed (parent 30271 ready)
child_stack=0x804b904, flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_SYSVSEM) = 30272
[pid 30272] rt_sigprocmask(SIG_UNBLOCK, [INT], [], 8) = 0
[pid 30271] rt_sigprocmask(SIG_BLOCK, [INT], [], 8) = 0
[pid 30271] getpid()                    = 30271
[pid 30271] kill(30271, SIGINT)         = 0
<no SIGINT is delivered, child and parent just hang>

The main question is now, why i386 and hppa differs in how they behave on signal delivery, or 
rephrased: why does i386 receives the SIGINT while hppa doesn't ?

My debugging seem to indicate that the only reason is due to the CLONE_THREAD flag in clone().
ruby1.9 on hppa does _not_ set this flag, while ruby1.9 on i386 does.

I wrote a small hacked-up test program, which is available here:
http://userweb.kernel.org/~deller/ruby1.9.bug/signal.c
With this test program I can reproduce the same (wrong) behaviour on i386 as I see on hppa.
Just change the "#if 0" to "#if 1" to switch between with/without CLONE_THREAD.

Since the clone() syscall in ruby is probably invoked by pthread_create(), I hacked together
this linuxthreads-patch for glibc: http://userweb.kernel.org/~deller/ruby1.9.bug/local-linuxthreads-CLONE_THREAD.diff
It's probably wrong though...(!!)

This information about CLONE_THREAD in the clone() manpage is pretty interesting and describes
what I was seeing:
              If kill(2) is used to send a signal to a thread  group,  and  the  thread  group  has
              installed  a handler for the signal, then the handler will be invoked in exactly one,
              arbitrarily selected member of the thread group that has not blocked the signal.   If
              multiple  threads  in  a  group  are waiting to accept the same signal using sigwait-
              info(2), the kernel will arbitrarily select one of these threads to receive a  signal
              sent using kill(2).
So, the behavior on i386 (which uses CLONE_THREAD) seems to be correct and on hppa, since we don't use
CLONE_THREAD, we behave correctly as well, just sadly not as the ruby1.9 author would have expected when
using pthread_create() and sending the own thread a signal...

Maybe we just need to add CLONE_THREAD to hppa/linuxthreads as well?
Your ideas/opinions?

Regards, Helge
