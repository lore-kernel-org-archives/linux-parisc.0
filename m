Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA02683
	for <parisc-linux@puffin.external.hp.com>; Fri, 15 Dec 2000 09:47:42 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 146xr8-0005of-00; Fri, 15 Dec 2000 16:37:14 +0000
Date: Fri, 15 Dec 2000 16:37:14 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@linuxcare.com.au>
Cc: John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@puffin.external.hp.com,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
Message-ID: <20001215163714.A22147@parcelfarce.linux.theplanet.co.uk>
References: <200012151012.DAA05988@udlkern.fc.hp.com> <Pine.LNX.4.21.0012152235260.7608-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0012152235260.7608-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Fri, Dec 15, 2000 at 10:37:55PM +1100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Dec 15, 2000 at 10:37:55PM +1100, Alan Modra wrote:
> On Fri, 15 Dec 2000, John Marvin wrote:
> 
> > 
> > I just ran into an unaligned data reference in user land.  The problem is
> > that the routine __pthread_acquire (in libpthread) does a ldcw, but it is
> > not ensuring that the address it is operating on is 16 byte aligned (it is
> > operating on the address that was passed in as the first argument).  Some
> > processors don't require the 16 byte alignment, but many do.

> Here's where the problem is:
> 
> glibc/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h
> 
> struct _pthread_fastlock
> {
>   long int __status;   /* "Free" or "taken" or head of waiting list */
>   int __spinlock;      /* Used by compare_and_swap emulation. Also,
> 			  adaptive SMP lock stores spin count here. */
> };

Can we move the __spinlock to be the first element of the struct,
and then mark the struct as requiring 16-byte alignment?  i have the
feeling this might `just work', since most structs will be allocated at
16-byte-aligned addresses anyway.

-- 
Revolutions do not require corporate support.
