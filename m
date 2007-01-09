From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Mon, 8 Jan 2007 22:15:01 -0500 (EST)
Message-ID: <200701090315.l093F1fI015830__22853.4834961922$1416624260$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440701081830o2d242fe9g806108c74c798726@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 T-Bone@parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440701081830o2d242fe9g806108c74c798726@mail.gmail.com>
	from "Carlos O'Donell" at Jan 8, 2007 09:30:40 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On 1/8/07, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> > I managed to get gdb backtraces for the hung java processes yesterday.
> > It looks like the hang could be a result of the clone bug in glibc.
> > clone is used in thread creation.
> 
> The clone bug is a failure to restore r19 correctly. This results in
> an immediate crash when attempting to access a variable via the PIC
> register. It doesn't matter in 99% of the cases where the $$dyncall
> sets r19 and we jump to the target plabel.
> 
> I argue that this is not the clone bug.
> 
> > Of course, this doesn't explain why killing the processes crashes the
> > system.
> 
> It doesn't explain it ... because it's not that bug.

Another example:

dave     22128     1  0 13:03 ?        00:00:00 /home/dave/gnu/gcc-4.3/objdir/hppa-linux/libjava/testsuite/Process_2.exe
dave     22129     1 85 13:03 ?        07:33:07 /home/dave/gnu/gcc-4.3/objdir/hppa-linux/libjava/testsuite/Process_2.exe
dave     22130 22129  0 13:03 ?        00:00:00 [sh] <defunct>

>>>From top:
22128 dave      15   0 50948  28m  20m S  0.0  2.9   0:00.00 Process_2.exe
22129 dave      25   0 50948  28m  20m T  0.0  2.9 457:14.08 Process_2.exe
22130 dave      20   0     0    0    0 Z  0.0  0.0   0:00.01 sh <defunct>

$ gdb Process_2.exe 22129
...
(gdb) bt
#0  0x40601a30 in __pthread_manager () from /lib/libpthread.so.0
#1  0x41a50498 in _Jv_CondWait (cv=0x40b4e000, mu=0xeae0c29,
    millis=<value optimized out>, nanos=208)
    at ../../../gcc/libjava/posix-threads.cc:179
#2  0x41a31794 in gnu::gcj::runtime::FinalizerThread::run (
    this=<value optimized out>)
    at ../../../gcc/libjava/gnu/gcj/runtime/natFinalizerThread.cc:57
#3  0x41a45c50 in _Jv_ThreadRun (thread=0x4052fd70)
    at ../../../gcc/libjava/java/lang/natThread.cc:302
#4  0x41a4fdd4 in really_start (x=0x400c38a0)
    at ../../../gcc/libjava/posix-threads.cc:445
#5  0x42738714 in GC_start_routine (arg=0x400e2f80)
    at ../../../gcc/boehm-gc/pthread_support.c:1294
#6  0x4060128c in pthread_start_thread () from /lib/libpthread.so.0
#7  0x409ff780 in clone () from /lib/libc.so.6
#8  0x409ff780 in clone () from /lib/libc.so.6
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

As far as I can tell, this process is "stuck" at 0x40601a30 although
I don't think setting breaks on a running process works.  The process
isn't doing anything special:

(gdb) disass 0x40601a20 0x40601a40
Dump of assembler code from 0x40601a20 to 0x40601a40:
0x40601a20 <__pthread_manager+1012>:    ldw 0(r22),r20
0x40601a24 <__pthread_manager+1016>:    add,l r20,ret0,r20
0x40601a28 <__pthread_manager+1020>:    ldi 1,ret0
0x40601a2c <__pthread_manager+1024>:    stw r20,0(r22)
0x40601a30 <__pthread_manager+1028>:    stw ret0,c(r5)
0x40601a34 <__pthread_manager+1032>:    ldo 1bc(r5),ret0
0x40601a38 <__pthread_manager+1036>:    add,l r20,r7,r3
0x40601a3c <__pthread_manager+1040>:    depw,z r7,30,31

gdb Process_2.exe 22129
...
(gdb) bt
#0  0x409e68b4 in sched_yield () from /lib/libc.so.6
#1  0x406055f0 in __pthread_acquire () from /lib/libpthread.so.0
#2  0x4060585c in __pthread_alt_unlock () from /lib/libpthread.so.0
#3  0x406024d4 in pthread_mutex_unlock () from /lib/libpthread.so.0
#4  0x41ebcea0 in java.lang.ConcreteProcess$ProcessManager.run()void (
    this=0x40542e40) at java/lang/ConcreteProcess.java:35
#5  0x41a45c50 in _Jv_ThreadRun (thread=0x40542e40)
    at ../../../gcc/libjava/java/lang/natThread.cc:302
#6  0x41a4fdd4 in really_start (x=0x400c3800)
    at ../../../gcc/libjava/posix-threads.cc:445
#7  0x42738714 in GC_start_routine (arg=0x400e2ec0)
    at ../../../gcc/boehm-gc/pthread_support.c:1294
#8  0x4060128c in pthread_start_thread () from /lib/libpthread.so.0
#9  0x409ff780 in clone () from /lib/libc.so.6
#10 0x409ff780 in clone () from /lib/libc.so.6
Backtrace stopped: previous frame identical to this frame (corrupt stack?)

This process appears to be trying to acquire a lock in __pthread_acquire
which is always locked.  So, it spins calling sched_yield and/or
nanosleep.

When I quit gdb, I see:

(gdb) quit
The program is running.  Quit anyway (and detach it)? (y or n) y
Quitting: Can't detach LWP 22125: No such process

kill -9 22128 22129
just crashed the system.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
