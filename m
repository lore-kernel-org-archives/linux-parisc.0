From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Sun, 11 Jun 2006 23:09:42 -0400
Message-ID: <119aab440606112009k2ac16f20l1fa30c694b0f9c3b@mail.gmail.com>
References: <119aab440606111734j3226f013l78e4c2fa22c08709@mail.gmail.com>
	<200606120155.k5C1tiwb028878@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606120155.k5C1tiwb028878@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 6/11/06, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> (gdb) bt
> #0  0x4005e1f4 in nanosleep () from /lib/libpthread.so.0
> #1  0x40059270 in __pthread_timedsuspend_new () from /lib/libpthread.so.0
> #2  0x40056414 in pthread_cond_timedwait@GLIBC_2.2 () from /lib/libpthread.so.0
> #3  0x41872de8 in _Jv_CondWait (cv=0x402bde20, mu=0x402bde30,
>     millis=<value optimized out>, nanos=0)
>     at ../../../gcc/libjava/posix-threads.cc:169
> #4  0x4185f3d0 in java::lang::Object::wait (this=0x0, timeout=1000, nanos=0)
>     at ../../../gcc/libjava/java/lang/natObject.cc:1333
> #5  0x4184a48c in java.lang.Object.wait(long)void (this=0x432fd9d0,
>     timeout=35486947928) at ../../../gcc/libjava/java/lang/Object.java:449
> #6  0x41c97ee0 in java.lang.ConcreteProcess$ProcessManager.run()void (
>     this=0x40536f50) at ConcreteProcess.java:142
> #7  0x41864104 in _Jv_ThreadRun (thread=0x40536f50)
>     at ../../../gcc/libjava/java/lang/natThread.cc:302
> #8  0x41872770 in really_start (x=0x401d9830)
>     at ../../../gcc/libjava/posix-threads.cc:432
> #9  0x424d93e0 in GC_start_routine (arg=0x401f6e80)
>     at ../../../gcc/boehm-gc/pthread_support.c:1191
> #10 0x40057498 in pthread_start_thread () from /lib/libpthread.so.0
> #11 0x40933754 in clone () from /lib/libc.so.6
> #12 0x40933754 in clone () from /lib/libc.so.6
> Previous frame identical to this frame (corrupt stack?)

The code in __pthread_timedsuspend_new is *very* signal sensitive.
It masks all signals except the restart signal. If this signal is missed, then
the restart never happens.

   1377       /* Sleep for the required duration. If woken by a signal,
   1378          resume waiting as required by Single Unix Specification.  */
   1379       if (reltime.tv_sec < 0 || __libc_nanosleep(&reltime, NULL) == 0)
   1380         break;
   1381     }

It may be that the kernel timer routines are rounding, and we never
finish off that last little bit of time? If you debug this again, it
would be nice to see what the sleep times are in those variables?

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
