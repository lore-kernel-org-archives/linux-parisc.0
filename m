From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Wed, 6 Apr 2005 22:45:06 -0400 (EDT)
Message-ID: <200504070245.j372j6YF008446@hiauly1.hia.nrc.ca>
References: <200504062012.j36KCW74007167@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504062012.j36KCW74007167@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Apr 6, 2005 04:12:31 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> 0x4016f05c in __pthread_sigsuspend (set=0xbff00dc8)
>     at ../linuxthreads/sysdeps/unix/sysv/linux/pt-sigsuspend.c:54
>     54      ../linuxthreads/sysdeps/unix/sysv/linux/pt-sigsuspend.c: No such file or directory.
> 	    in ../linuxthreads/sysdeps/unix/sysv/linux/pt-sigsuspend.c
> (gdb) bt
> #0  0x4016f05c in __pthread_sigsuspend (set=0xbff00dc8)
>     at ../linuxthreads/sysdeps/unix/sysv/linux/pt-sigsuspend.c:54
> #1  0x4016ede0 in __pthread_wait_for_restart_signal (self=0x40184b80)
>     at pthread.c:1203
> #2  0x4017081c in __pthread_alt_lock (lock=0x406c2980, self=0x40184b80)
>     at restart.h:34
> #3  0x4016d480 in *__GI___pthread_mutex_lock (mutex=0x406c2970) at mutex.c:123
> #4  0x40662234 in __unregister_atfork (dso_handle=0x40184ac0) at list.h:72
> #5  0x4016a930 in __do_global_dtors_aux () from /usr/lib/debug/libpthread.so.0
> #6  0x40173bb0 in _fini () from /usr/lib/debug/libpthread.so.0
> #7  0x400b6898 in _dl_fini () from /lib/ld.so.1
> #8  0x400b6898 in _dl_fini () from /lib/ld.so.1

I think there is a race condition between the parent and child regarding
the lock used for __unregister_atfork.  As a result, the parent suspends
itself waiting for a restart signal that never gets generated.  If I add
an alarm(2) call to exit_on_signal, then parent exits when the alarm occurs.

Based on my testing, we get a SIGCHLD signal delivered before the
SIGUSR2, and no restart after the wait:

dave@hiauly6:~/gcc_test/pthr/carlos$ ./foo
Parent = 26338
restart signal 18
Exiting on signal from child
Waited for child 26339

Don't fully understand the use of the __status field in
struct _pthread_fastlock but the parent suspends when it's nonzero.
It's set twice at 0x401707c0:

(gdb) r
The program being debugged has been started already.
Start it from the beginning? (y or n) y

Starting program: /home/dave/gcc_test/pthr/carlos/foo
[Thread debugging using libthread_db enabled]
[New Thread 16384 (LWP 26626)]
Parent = 26626
[Switching to Thread 16384 (LWP 26626)]

Breakpoint 5, 0x401707c0 in __pthread_alt_lock (lock=0x406c2980, self=0x0)
    at spinlock.c:374
374     spinlock.c: No such file or directory.
    in spinlock.c
(gdb) bt
#0  0x401707c0 in __pthread_alt_lock (lock=0x406c2980, self=0x0)
    at spinlock.c:374
#1  0x4016d480 in *__GI___pthread_mutex_lock (mutex=0x406c2970) at mutex.c:123
#2  0x4016dad8 in __pthread_fork (b=0x406c2970) at ptfork.c:33
#3  0x4062011c in __libc_fork ()
    at ../linuxthreads/sysdeps/unix/sysv/linux/fork.c:40
#4  0x000109d4 in main () at foo.c:42
(gdb) c
Continuing.
Child = 26627
Parent done.

Breakpoint 5, 0x401707c0 in __pthread_alt_lock (lock=0x406c2980, self=0x0)
    at spinlock.c:374
374     in spinlock.c
(gdb) c
Continuing.
restart signal 18

Breakpoint 3, exit_on_signal (signr=17) at foo.c:17
17        fprintf(stderr, "Exiting on signal from child\n");
(gdb) c
Continuing.
Exiting on signal from child
Waited for child 26627

Program exited normally.

With the break 5 enabled, the __status field is 0 when exit_on_signal
is entered.  When it's disabled, the __status is 1 when exit_on_signal
is entered and the parent fails to to terminate.  When 5 is disabled,
we also don't get the Parent done message.

The second break 5 occurs here:

Breakpoint 5, 0x401707c0 in __pthread_alt_lock (lock=0x406c2980, self=0x0)
    at spinlock.c:374
374     in spinlock.c
(gdb) bt
#0  0x401707c0 in __pthread_alt_lock (lock=0x406c2980, self=0x0)
    at spinlock.c:374
#1  0x4016d480 in *__GI___pthread_mutex_lock (mutex=0x406c2970) at mutex.c:123
#2  0x40662234 in __unregister_atfork (dso_handle=0x40184ac0) at list.h:72
#3  0x4016a930 in __do_global_dtors_aux () from /usr/lib/debug/libpthread.so.0
#4  0x40173bb0 in _fini () from /usr/lib/debug/libpthread.so.0
#5  0x400b6898 in _dl_fini () from /lib/ld.so.1
#6  0x400b6898 in _dl_fini () from /lib/ld.so.1

Here we are unregistering the fork handlers.  I have the feeling
that we die when the SIGUSR2 signal is taken while the __status
field is 1 in the first attempt at doing __unregister_atfork.

It seems that the problem is with exit when it's used in a
signal handler receiving signals from children.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
