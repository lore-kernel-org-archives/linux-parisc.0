Received: from cosrel2.hp.com (cosrel2.hp.com [156.153.255.162])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA20866
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 17:38:44 -0700
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by cosrel2.hp.com (Postfix) with ESMTP id 932D32BB
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 17:42:27 -0700 (MST)
Received: (from jsm@localhost) by udlkern.fc.hp.com (8.8.6 (PHNE_14041)/8.7.3 SMKit7.0) id RAA13664 for parisc-linux@puffin.external.hp.com; Mon, 22 Jan 2001 17:41:23 -0700 (MST)
Date: Mon, 22 Jan 2001 17:41:23 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200101230041.RAA13664@udlkern.fc.hp.com>
To: parisc-linux@puffin.external.hp.com
Subject: Re: tar hangs on 715/75 (spinlock problem)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> On Mon, Jan 22, 2001 at 04:50:14PM +0000, Richard Hirst wrote:
>
> This is because ldcw behaves differently on the 715/75 and the B180.
>
> Grant tells me spinlock words have to be the first word of a cacheline,

Both the PARISC 1.1 and PARISC 2.0 architecture specifications require
that ldcw and ldcd targets be 16 byte aligned. What actually happens
when the target is not 16 byte aligned is unspecified. I believe that
on PCXT' processors you get an unaligned fault. I think ldcw works
on 4 byte boundaries on PCXL2, PCXU and PCXW, but I am not certain of
that. As you can already see, it does not work on other processors like
PCXS, PCXT and PCXL, and the behaviour may be different on each one.

> so that would be why my example code broke.  However, libpthreads uses
> spinlocks and doesn't appear to force any alignment.
>
> I think the libpthreads spinlock definitions come from
> glibc/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h, struct
> pthread_mutex_t, spinlock is inside __m_lock.  No alignment is
> specified.  When debugging tar, I found the spinlock word at
> 0x4014df4c.

I brought this whole issue up a month ago (See "ldcw in __pthread_acquire"
in the December archive of the parisc-linux mailing list). Matthew Wilcox
suggested adding a 16 byte aligned attribute to fix the problem. Then
a long discussion ensued, discussing the advantages and disadvantages
of doing spinlocks in user space. I think the general consensus was
that we should eventually do an implementation that spins for a while
in user space and then goes to the kernel for arbitration.

So, the long term correct solution should be put on the todo list. But,
for now, Matt Taggart is going to create a hppa specific version of
pthreadtypes.h and make the following changes:

    1) move the __spinlock field in the _pthread_fastlock definition
    to be the first field in the structure.
    2) Add an __attribute__((aligned(16))) to that structure.
    3) Add an __attribute__((aligned(16))) to the pthread_spinlock_t
       type definition.

He'll test this on a C110 to see if the unaligned fault goes away, and
if it does he will check it in. This should also fix the problems with
the same root cause on other processors.

John Marvin
jsm@fc.hp.com
