From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Wed, 6 Apr 2005 15:36:04 -0400
Message-ID: <20050406193604.GZ1833@baldric.uwo.ca>
References: <20050406181337.GX1833@baldric.uwo.ca>
	<200504061837.j36IbnWI006770@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Randolph Chung <tausq@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504061837.j36IbnWI006770@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Apr 06, 2005 at 02:37:49PM -0400, John David Anglin wrote:
> > We still have the problem of a *stuck* thread using linuxthreads.
> > Which we don't have a clear solution for...
> 
> It's my belief that expect/tcl has a similar problem, so the problem
> likely isn't specific to linuxthreads.  Expect definitely doesn't use
> linuxthreads.  This affects GCC and binutils testing so I rate fixing
> this as extremely important ;^)
> 
> The problem also affects java.  I often have to manually kill various
> java processes after a GCC test run completes.  At the moment, locking
> isn't atomic in java.  I wonder if we are being bitten by the glibc
> routines that still aren't atomic.

We are missing all sorts of atomic support in libc.

Adding support would require a forced min_kernel_version bump up to the
point where light-weight syscalls (CAS) exists, and the DoS for the
gateway page was fixed.

Would you like me to go ahead and do this, then roll a new glibc deb?

Here is a brief summary of what glibc needs:

===================
Atomic Definitions:

sysdeps/hppa/atomicity.h
  exchange_and_add
  atomic_add
  compare_and_swap
	= These three are phased out in favour of atomic.h

sysdeps/hppa/bits/atomic.h
  atomic_compare_and_exchange_val_acq
  atomic_compare_and_exchange_bool_acq
	= New atomic requirements for glibc

===================
Atomic Extensions using CAS:

include/atomic.h
  = This file builds everything based on
    atomic_compare_and_exchange_bool_acq

sysdeps/generic/bits/atomic.h
  = hppa uses this file right now.
  = Would have bee nice to have gotten a warning
    here.
  = non-atomic versions used.

===================
Atomic Uses:

Range from everything to the wakeup of threads from a queue using
atomic_increment and atomic_decrement (evaluates to a variant of
atomic_compare_and_exchagne_val_acq from include/atomic.h), to the 
change of a value in a semaphore.

===================

I've neglected this because in the past the required CAS didn't exist
and it was impossible to do in userspace. Time to test it all out.

c.



c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
