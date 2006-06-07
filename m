From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Wed, 7 Jun 2006 00:09:11 -0400 (EDT)
Message-ID: <200606070409.k5749BK4009914@hiauly1.hia.nrc.ca>
References: <119aab440606061830peac8e3ah7030b831881e6f76@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440606061830peac8e3ah7030b831881e6f76@mail.gmail.com> from
	"Carlos O'Donell" at Jun 6, 2006 09:30:05 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Thoughts?
> 
> You've implemented almost exactly what glibc does for pthreads.
> However, glibc uses nanosleep without any adverse effects.
> Have you tried other syscalls instead of select?

I've also tried nanosleep and sched_yield.  I would say that
nanosleep and select have similar behavior under linux.  I need
a little testing under hpux but I currently have the impression
that the patch with either nanosleep or select works under hpux.

I've had a coupled of failures that seemed to indicate a problem
with nanosleep, but I don't have hard data on this.  Oh, I remember.
These were unkillable java tasks.  strace indicated a nanosleep
call to the kernel that never returned.  I couldn't find a signal
to get rid of the task.  Haven't seen one of these for a few days.
Sometimes they are left over from the libjava testsuite run.

My initial testing with the program from the paper modified to
8 threads seemed to indicate somewhat poorer performance using
sched_yield (don't know why).  I also found that pre-checks
of the lock using "ldw" or trying to create a dirty cache-line
prior to the ldcw didn't help overall performance.  Using stby,e
to the high byte of the lock was definitely detrimental.

I think I can understand the later.  I believe most PA 2.0 machines
are fully coherent (except V class and possibly superdome).  Thus,
the ldcw instruction runs in cache on these machines and specifying
the ",co" completer doesn't matter.  Also, stby,e is just an unnecessary
operation that occurs normally with ldcw if necessary.  There might
be some effect on early PA 1.x machines which don't support executing
ldcw in cache.

There are some subtle cache issues in all this.  I believe that
machines using the PA7200 through to the PA8700 only utilize an
L1 cache, but it has an assist buffer.  It appears using the ",sl"
completer bypasses the L1 cache.  Michael Zick thought using this
to reset the lock and in lock tests was a good idea, but think
it's better to use the L1.  The effect of ",sl" on cacheline states
is rather poorly document.  Michael has looked at some of HP's
patents and a bunch of other papers, but I'm not convinced.  The
PDC_CACHE command may be able to change the coherency state and
write-back/write-through state of the data caches on some machines.

The cache design was changed on the PA8800 and PA8900.  The L1
is now on-chip and there is a large L2.  The cacheline length
also increased from 64 to 128 bytes.  These changes could be
part of the reason linux still doesn't run on these machines.

Some of the papers talk about sharing and false sharing.  These
can potentially cause failure of ldcw (race condition in bus logic?).
It is best is semaphores are cacheline aligned and don't share the line.
Currently, non of the locks used in arch/parisc are cacheline aligned.

Joel ran a test kernel with a patch to align statically allocated
locks.  It might have run a bit longer than average but there was
still a softlockup after a few days.  So, I don't think the lockup
is due to the spinlock design per say, although I could easily
be wrong.  I think it's more likely to be something to do with
interrupt handling.  This is suggested by the stack traces which
often seem to occur in the interrupt return path.

I've looked at the locking in hpux a bit.  As far as I can tell,
the kernel never really spins.  It has code to do pre-arbitration
and keeps track of tasks and priorities.  When a lock is released,
the code calls into suwaiters to see if the lock should be handed
over to another task or released.  When we just spin, we are relying
on the bus arbitration to select a winner.  So, when we have a
highly contended lock, it might be  possible for a cpu to get locked
out for sufficient time to cause a softlockup.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
