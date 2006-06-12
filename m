From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Sun, 11 Jun 2006 21:55:43 -0400 (EDT)
Message-ID: <200606120155.k5C1tiwb028878@hiauly1.hia.nrc.ca>
References: <119aab440606111734j3226f013l78e4c2fa22c08709@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440606111734j3226f013l78e4c2fa22c08709@mail.gmail.com>
	from "Carlos O'Donell" at Jun 11, 2006 08:34:33 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> That is good news! It's an unfortuante side-effect of our lock code.
> Which goes away in NPTL ... thankfully.

Here's another one (libjava Process_3.exe):

(gdb) bt
#0  0x4005e1f4 in nanosleep () from /lib/libpthread.so.0
#1  0x40059270 in __pthread_timedsuspend_new () from /lib/libpthread.so.0
#2  0x40056414 in pthread_cond_timedwait@GLIBC_2.2 () from /lib/libpthread.so.0
#3  0x41872de8 in _Jv_CondWait (cv=0x402bde20, mu=0x402bde30,
    millis=<value optimized out>, nanos=0)
    at ../../../gcc/libjava/posix-threads.cc:169
#4  0x4185f3d0 in java::lang::Object::wait (this=0x0, timeout=1000, nanos=0)
    at ../../../gcc/libjava/java/lang/natObject.cc:1333
#5  0x4184a48c in java.lang.Object.wait(long)void (this=0x432fd9d0,
    timeout=35486947928) at ../../../gcc/libjava/java/lang/Object.java:449
#6  0x41c97ee0 in java.lang.ConcreteProcess$ProcessManager.run()void (
    this=0x40536f50) at ConcreteProcess.java:142
#7  0x41864104 in _Jv_ThreadRun (thread=0x40536f50)
    at ../../../gcc/libjava/java/lang/natThread.cc:302
#8  0x41872770 in really_start (x=0x401d9830)
    at ../../../gcc/libjava/posix-threads.cc:432
#9  0x424d93e0 in GC_start_routine (arg=0x401f6e80)
    at ../../../gcc/boehm-gc/pthread_support.c:1191
#10 0x40057498 in pthread_start_thread () from /lib/libpthread.so.0
#11 0x40933754 in clone () from /lib/libc.so.6
#12 0x40933754 in clone () from /lib/libc.so.6
Previous frame identical to this frame (corrupt stack?)

After the testsuite had completed, I noticed that two Process_3 processes
were still running.  I attached to both with strace but there wasn't any
syscall activity in either.  I then killed the process that top said was
using almost 100% of the cpu with SIGABRT and got a core dump with the
above backtrace.  I'm now left with:

dave      7124     1 92 08:13 ?        12:29:14 [Process_3.exe]

>>From past experience, rebooting is the only way to get rid of this
task.  This was using a 32-bit c3k kernel (2.6.17-rc3-pa3).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
