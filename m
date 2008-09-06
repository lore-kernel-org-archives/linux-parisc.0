From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: NTPL transition
Date: Sat, 6 Sep 2008 17:36:24 -0400
Message-ID: <119aab440809061436n5104469cm514f87dc00c26041@mail.gmail.com>
References: <Pine.LNX.4.62.0809061002060.19796@sci.felk.cvut.cz>
	 <119aab440809060831u790ad62dte057bedf68e0d988@mail.gmail.com>
	 <Pine.LNX.4.62.0809062158160.20902@sci.felk.cvut.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Petr Salinger" <Petr.Salinger@seznam.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.62.0809062158160.20902@sci.felk.cvut.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Sep 6, 2008 at 4:16 PM, Petr Salinger <Petr.Salinger@seznam.cz> wrote:
>> Do you have any other concerns?
>
> The versioning does not help here, i.e. in the above case
> bar will not reference any old (linuxthread variant) function,
> therefore it would look like there is no need for compat code, even though
> it will be still needed.

Yes, I agree with you, but you still need symbol versioining.

The point of versioning the symbols is so that in the future when you
run an old program you will get the error "Undefined reference to
symbol foo" instead of a random crash. So the procedure is this:

1. Create an old compat function at version 2.0, which is only
compiled if oldest ABI is 2.0.
2. Create a new function at version 2.8, which *also* contains compat
code wrapped in "#if SHLIB_COMPAT (libpthread, GLIBC_2_0, GLIBC_2_8)".

With oldest-abi at 2.0, all functions will have the compat checks
enabled, allowing mixing of old applications and new libraries.
Eventually when you build with oldest ABI 2.8, the 2.0 version
functions are gone, the compat code in 2.8 version functions is
dropped, and everything is working optimally. When you run an old
application it complains "Undefined reference to symbol foo", and
rightly so because we only support the new ABI.

Do you see any problem with that?

> For dropping compat code, you have to be sure any package is not compiled
> against old glibc - it can be determined in debian from Depends: line
> in binary package control file. The strategy for upgrade might be easy;
> For lenny+1 include compat code, but make sure all of lenny+1 released
> packages are build against NPTL variant. The compact code can be dropped
> just after lenny+1 release.

Yes, that's probably a good procedure.

However, you can't determine it from the depends line because libc is
an implicit depend?

I believe you have to analyze the binaries in the archive.

> It looks like one compare will say it is not LT initialized lock,
> this path might be really fast.
> IMHO, even including such compat code forever will be easier compared to
> transition all libraries ...

Yes, I agree.

> The check_and_reset() should be reasonably "atomic" - two threads might call
> pthread_mutex_lock() on static LT initialized lock in the same time.

It will be 100% atomic, we will use hppa's load-and-clear-word
instruction to analyze the contents of the old lock structure.

> What are the difference between LT and NPTL definition of pthread_mutex_t.
> Only 3 unused ints in pthread_mutex_t ?

A function that takes as an argument a structure that has no padding
left for a new 4-byte int aligned lock and contains a statically
initialized __atomic_lock_t that we must reuse for our lock.

We must review these structures for possible padding to use as a lock word:
pthread_cond_t
pthread_mutex_t
pthread_rwlock_t
pthread_barrier_t
pthread_spinlock_t

>From this list, only those that have static initializers may cause an
ABI issue, namely:
PTHREAD_COND_INITIALIZER
PTHREAD_MUTEX_INITIALIZER
PTHREAD_RWLOCK_INITIALIZER (Deleted in issue 6)

Lastly the complete list of functions that may need compat:
pthread_cond_timedwait
pthread_cond_wait
pthread_mutex_destroy
pthread_mutex_getprioceiling
pthread_mutex_init
pthread_mutex_lock
pthread_mutex_setprioceiling
pthread_mutex_timedlock
pthread_mutex_trylock
pthread_mutex_unlock
pthread_cond_broadcast
pthread_cond_destroy
pthread_cond_init
pthread_cond_signal
pthread_cond_timedwait
pthread_cond_wait
pthread_rwlock_destroy
pthread_rwlock_init
pthread_rwlock_rdlock
pthread_rwlock_timedrdlock
pthread_rwlock_timedwrlock
pthread_rwlock_tryrdlock
pthread_rwlock_trywrlock
pthread_rwlock_unlock
pthread_rwlock_wrlock

Please feel free to review my list.

I based this list on the data here:
http://www.opengroup.org/onlinepubs/009695399/

Cheers,
Carlos.
