From: Roland McGrath <roland@redhat.com>
Subject: Re: [parisc-linux] Re: NPTL for hppa-linux is not backwards
	compatible with Linuxthreads.
Date: Fri, 23 Feb 2007 05:09:38 -0800 (PST)
Message-ID: <20070223130938.BA1BD180076__27502.413505181$1416624310$gmane$org@magilla.sf.frob.com>
References: <119aab440702222125m1f144002l2ec36c37b68da101@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-glibc@lists.debian.org,
 libc-ports@sourceware.org,
 Aurelien Jarno <aurel32@debian.org>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: Carlos O'Donell's message of  Friday,
	23 February 2007 00:25:17 -0500
	<119aab440702222125m1f144002l2ec36c37b68da101@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> In the new structure we have shifted everything up because __lock is
> now an integer, instead of a _pthread_fastlock with a 4 word lock
> structure. Should I add padding after "__lock" e.g. int pad[3]?

Yes, you must dedicate those words to compatibility only.

> In an old executable the following static initializers:
> PTHREAD_MUTEX_INITIALIZER, PTHREAD_COND_INTIALIZER,
> PTHREAD_RWLOCK_INITIALIZER will setup the __spinlock structure to
> {1,1,1,1} e.g. unlocked in our Linuxthreads implementation.
> 
> To be clear are you suggesting I write compat wrappers for the
> pthread_mutex_*, pthread_cond_*, and pthread_rwlock_* functions to
> detect old style initialized locks, and reinitialize the lock word?

Yes.  The only ABIs affected are all functions taking pthread_mutex_t,
pthread_cond_t, or pthread_rwlock_t pointer arguments--except for
pthread_*_init, which are not affected because their only ABI contract is
the minimum size and alignment of available space at the pointer passed,
which hasn't gotten smaller.

Add sysdeps/unix/sysv/linux/hppa/nptl/Versions, with:

libc {
  GLIBC_2.6 {
    pthread_mutex_lock;
    ...all the affected symbols...
  }
}
libpthread {
  GLIBC_2.6 {
    pthread_mutex_lock;
    ...all the affected symbols...
  }
}

This is enough for the real functions all to get defined in the GLIBC_2.6
version set for ones that don't already have compatibility functions.  Some
pthread_cond functions already have compatibility functions for GLIBC_2.0,
and the way this is done means that GLIBC_2.3.2 is directly specified as
the version set in the declarations.  So you'll also have to override
nptl/forward.c in sysdeps/unix/sysv/linux/hppa/nptl/, probably just copy
and modify it.  For the affected functions there that have e.g.:

versioned_symbol (libc, __pthread_cond_broadcast, pthread_cond_broadcast,
		  GLIBC_2_3_2);

you need to change this to GLIBC_2_6 here.  That gets all the new functions
into the right version set.

Then for the existing compat stuff like:

#if SHLIB_COMPAT(libc, GLIBC_2_0, GLIBC_2_3_2)
strong_alias (__pthread_cond_broadcast, __pthread_cond_broadcast_2_0)
compat_symbol (libc, __pthread_cond_broadcast_2_0, pthread_cond_broadcast,
	       GLIBC_2_0);
#endif

You need to instead make it:

strong_alias (__pthread_cond_broadcast_2_3_2, __pthread_cond_broadcast_2_0)

Somewhere else like a new compat file you can define the compat routines:

	static void
	compat_mutex_init (pthread_mutex_t *p)
	{
	  if ((p->__data.__lock ^ p->__data.__pad[0]
	       ^ p->__data.__pad[1] ^ p->__data.__pad[2]) == 1)
	    p->__data.__lock = p->__data.__pad[0]
	      = p->__data.__pad[1] = p->__data.__pad[2] = 0;
	}

	int
	__pthread_mutex_lock_2_3_2 (pthread_mutex_t *p)
	{
	  compat_mutex_init (p);
	  return __pthread_mutex_lock (p);
	}

	...

That goes inside:
	 #ifdef SHLIB_COMPAT (libpthread, GLIBC_2_3_2, GLIBC_2_6)

Those same wrappers can go in libc (might as well be pulled into
forward.c), and there SHLIB_COMPAT (libc, ...) is what needs to be tested.
(You could use some more macro testing and #include the same source into
forward.c for libc.so that is compiled as an extra object for libpthread.)

Because of versioned_symbol uses you'll need to add wrapper files for
pthread_cond_destroy.c et al that define the functions whose version set
you're changing (only the ones that use versioned_symbol).  They can do:

#ifndef INCLUDED_SELF
# define INCLUDED_SELF
# include <pthread_cond_destroy.c>
#else
# include <shlib-compat.h>
# undef GLIBC_2_3_2
# define GLIBC_2_3_2 GLIBC_2_6
# include_next <pthread_cond_destroy.c>
#endif

I think that about covers it.


Thanks,
Roland
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
