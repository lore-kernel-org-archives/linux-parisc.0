From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Fri, 8 Apr 2005 17:29:18 -0400
Message-ID: <20050408212918.GK1833@baldric.uwo.ca>
References: <200504070245.j372j6YF008446@hiauly1.hia.nrc.ca>
	<200504080256.j382u0x0013973@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504080256.j382u0x0013973@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Apr 07, 2005 at 10:56:00PM -0400, John David Anglin wrote:
> After thinking a bit more about this, I'm convinced that the problem
> is a race between the registration of fork handlers and the delivery of
> the signal.  If the signal handler is called before the registration
> is complete, the code suspends when the signal handler exits and
> tries to unregister the fork handlers.  The test works if the signal
> is delayed.

If you can prove that those mutex's aren't working properly then we have
a case :)

Since technically this is not possible, the mutex .lock in __fork_block
makes sure that such a thing can't occur.

---

During the handler registration the mutex is taken, and only when
complete released. The __pthread_fork code must take that mutex before
calling the prepared handlers.

Look at:
linuxthreads/ptfork.c 
	(__pthread_fork)
linuxthreads/sysdeps/unix/sysv/linux/register-atfork.c
	(__register_atfork)


The lock is via __libc_lock_lock, which is:
	(__libc_maybe_call2 (pthread_mutex_lock, (&(NAME)), 0));

Which is pthread_mutex_lock, which could call:
	__pthread_lock(&mutex->__m_lock, NULL);
	__pthread_alt_lock(&mutex->__m_lock, NULL);
	__pthread_lock(&mutex->__m_lock, self);
	__pthread_alt_lock(&mutex->__m_lock, self);

The __pthread_lock is rather complex.

Seems to rely upon:
	__pthread_acquire(&lock->__spinlock);

Which relies upon:
	testandset(spinlock);

Which relies upon all the ldcw code we worked out.

*** WARNING ***

What am I missing?

c.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
