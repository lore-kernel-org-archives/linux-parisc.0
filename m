Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA18453
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 15:23:00 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 22 Jan 2001 22:26:44 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9FFFFB005; Mon, 22 Jan 2001 22:17:04 +0000 (GMT)
Date: Mon, 22 Jan 2001 22:17:04 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: tar hangs on 715/75 (spinlock problem)
Message-ID: <20010122221704.R3571@linuxcare.com>
References: <20010122165014.O3571@linuxcare.com> <20010122213219.Q3571@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010122213219.Q3571@linuxcare.com>; from rhirst@linuxcare.com on Mon, Jan 22, 2001 at 09:32:19PM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 22, 2001 at 09:32:19PM +0000, Richard Hirst wrote:
> On Mon, Jan 22, 2001 at 04:50:14PM +0000, Richard Hirst wrote:
> > Hi,
> >   tar (and nscd) hang on my 715/75.  Same binaries/libraries work on
> > the B180.  The hang is in __pthread_acquire() called from
> 
> This is because ldcw behaves differently on the 715/75 and the B180.

Grant tells me spinlock words have to be the first word of a cacheline,
so that would be why my example code broke.  However, libpthreads uses
spinlocks and doesn't appear to force any alignment.

I think the libpthreads spinlock definitions come from
glibc/linuxthreads/sysdeps/pthread/bits/pthreadtypes.h, struct
pthread_mutex_t, spinlock is inside __m_lock.  No alignment is
specified.  When debugging tar, I found the spinlock word at
0x4014df4c.

Richard
