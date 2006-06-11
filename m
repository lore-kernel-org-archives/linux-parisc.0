From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Sun, 11 Jun 2006 19:20:47 -0400
Message-ID: <119aab440606111620w40d1808en7adec56144d4b1aa@mail.gmail.com>
References: <119aab440606061830peac8e3ah7030b831881e6f76@mail.gmail.com>
	<200606112156.k5BLuvQe011929@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606112156.k5BLuvQe011929@hiauly1.hia.nrc.ca>
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
> > You've implemented almost exactly what glibc does for pthreads.
> > However, glibc uses nanosleep without any adverse effects.
>
> Are you sure?  The libgomp test libgomp.fortran/reduction6.f90
> times out.  It's using pthread_mutex_lock and pthread_mutex_unlock
> for locking (there's no futex implementation for parisc-linux).

Can we get a reduced testcase from this?

> strace indicates that the reduction6.xg processes are mainly calling
> sched_yield(), and occassionally nanosleep().

Yes, the core in glibc reads like this:

linuxthreads/spinlock.c (__pthread_acquire):

    722   READ_MEMORY_BARRIER();
    723
    724   while (testandset(spinlock)) {
    725     if (cnt < MAX_SPIN_COUNT) {
    726       sched_yield();
    727       cnt++;
    728     } else {
    729       tm.tv_sec = 0;
    730       tm.tv_nsec = SPIN_SLEEP_DURATION;
    731       nanosleep(&tm, NULL);
    732       cnt = 0;
    733     }
    734   }

So you will see "sched_yield" and "nanosleep".

> The program doesn't timeout under hpux.  I killed the program after 50m
> on linux.  It appears that we are deadlocking on linux.  The time on
> a relatively slow hpux system is:

If a child misses a signal and doesn't call __pthread_release, then
the lock is held forever.
In which case switching over to futex's, or even LWS CAS is not going to help.

Truth be told, many applications don't call "__pthread_acquire" like
we do, they use a CAS insn to acquire the lock.

We *could* experiment with turning on HAS_COMPARE_AND_SWAP in
linuxthreads, and using the LWS CAS to implement this.

I'm dying for a testcase...

> It appears that the hpux built application never sleeps or calls
> sched_yield.  Under linux, I see after running a bit the following
> backtrace in nanosleep:

Yes, that's an attempt to acquire the lock.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
