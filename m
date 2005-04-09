From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Sat, 9 Apr 2005 19:44:22 -0400 (EDT)
Message-ID: <200504092344.j39NiNMM024348@hiauly1.hia.nrc.ca>
References: <20050409063750.GQ1833@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050409063750.GQ1833@baldric.uwo.ca> from "Carlos O'Donell" at
	Apr 9, 2005 02:37:50 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sat, Apr 09, 2005 at 01:58:52AM -0400, Carlos O'Donell wrote:
> > On Fri, Apr 08, 2005 at 06:54:20PM -0400, John David Anglin wrote:
> > > > Since technically this is not possible, the mutex .lock in __fork_block
> > > > makes sure that such a thing can't occur.
> > > 
> > > The program hangs doesn't it?
> > 
> > I just realized the program doesn't call pthread_atfork and it still
> > hangs. Though it doesn't hang on i386. Is there a relied upon semantic
> > we are missing here?
> 
> The following hangs and I don't really know why... maybe I'm just
> sleepy :)

I think it all comes down to the timing of the signal.

(gdb) r
The program being debugged has been started already.
Start it from the beginning? (y or n) y

Starting program: /home/dave/gcc_test/pthr/carlos/foo
[Thread debugging using libthread_db enabled]
[New Thread 16384 (LWP 1051)]
Parent = 1051

Program received signal SIGUSR2, User defined signal 2.
[Switching to Thread 16384 (LWP 1051)]
0x4016db24 in __pthread_fork (b=0x406c2970) at ptfork.c:46
46      ptfork.c: No such file or directory.
        in ptfork.c
(gdb) p *((struct _pthread_fastlock *)0x406c2980)
$33 = {__spinlock = {lock = {1, 1, 1, 1}}, __status = 1}

or

Breakpoint 4, exit_on_signal (signr=17) at foo.c:17
17        fprintf(stderr, "Exiting on signal from child\n");
(gdb) bt
#0  exit_on_signal (signr=17) at foo.c:17
#1  0x40171e80 in __pthread_sighandler (signo=17, ctx=0x0) at sighandler.c:39
#2  <signal handler called>
#3  0x4016db24 in __pthread_fork (b=0x406c2970) at ptfork.c:46
#4  0x4062011c in __libc_fork ()
    at ../linuxthreads/sysdeps/unix/sysv/linux/fork.c:40
    #5  0x000108f4 in main () at foo.c:34
(gdb) p *((struct _pthread_fastlock *)0x406c2980)
$34 = {__spinlock = {lock = {1, 1, 1, 1}}, __status = 1}

If you look, you will see that __pthread_alt_lock has obtained a
lock with __status = 0, set __status to 1, then released the lock.
We then get the signal with __status == 1.  When the signal handler
exits with exit(0), __cxa_finalize tries to deregister the fork
handlers.  When it gets the lock, __status is 1.  This causes
the process to suspend itself.

The same thing could occur while the lock is taken.  In that case,
I think the process would spin trying to acquire the lock.

I number of other things to note.  If the signal handler uses
_exit() or _Exit(), the program doesn't hang.  If exit() is called
twice, the behavior is undefined.  I would argue that we don't call
exit twice but that's timing depend with the current testcase.
exit() isn't listed as async-signal-safe, so it's probably not
legit to call it from a signal handler.  Thus, this isn't a bug.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

PS: I think the ldcw_align macro can be improved.  It looks like GCC
is treating the pointer as volatile and generating icky code.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
