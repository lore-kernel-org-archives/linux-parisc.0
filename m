Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id EAA00600
	for <parisc-linux@puffin.external.hp.com>; Fri, 15 Dec 2000 04:37:04 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA27904;
	Fri, 15 Dec 2000 22:37:55 +1100
Date: Fri, 15 Dec 2000 22:37:55 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: John Marvin <jsm@udlkern.fc.hp.com>
cc: parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
In-Reply-To: <200012151012.DAA05988@udlkern.fc.hp.com>
Message-ID: <Pine.LNX.4.21.0012152235260.7608-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 15 Dec 2000, John Marvin wrote:

> 
> I just ran into an unaligned data reference in user land.  The problem is
> that the routine __pthread_acquire (in libpthread) does a ldcw, but it is
> not ensuring that the address it is operating on is 16 byte aligned (it is
> operating on the address that was passed in as the first argument).  Some
> processors don't require the 16 byte alignment, but many do.
> 
> I haven't looked at the source (I just found the location by disassembly),
> so I don't know what the root cause is.  The actual ldcw is probably from
> an inlined function or macro, e.g. spin_lock().  My first guess would be
> that it is using the machine dependent spin_lock macro, but the procedure
> which called __pthread_acquire is passing in a structure whose lock field
> does not have the aligned(16) attribute.
> 
> I don't have time to look at this right now.  Any volunteers?

This isn't exactly volunteering, but I've looked at this code before.
Here's where the problem is:

glibc/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h

struct _pthread_fastlock
{
  long int __status;   /* "Free" or "taken" or head of waiting list */
  int __spinlock;      /* Used by compare_and_swap emulation. Also,
			  adaptive SMP lock stores spin count here. */
};

--
Linuxcare.  Support for the Revolution.
