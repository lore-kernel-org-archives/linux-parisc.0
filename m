Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32DF34871
	for <parisc-linux@parisc-linux.org>; Sat, 26 Jul 2003 11:50:40 -0600 (MDT)
Date: Sat, 26 Jul 2003 13:48:45 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030726174845.GF31744@systemhalted>
References: <20030725063739.GA13017@systemhalted> <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> > Any thoughts about how one should implement some type of lightweight
> > syscall for our glibc to use?
> 
> I have lots of thoughts ;-)

Spill the beans!
 
> > o---> libc 
> >  --> exchange_and_add 
> >   ==> Params into kernel
> >    ==> disable interrupts on the current processor
> >     ==> take a semaphore to keep other cpu's out
> >     ==> do work 
> >     ==> release semaphore
> >    ==> reenable i-bit
> >   --> back into userspace and done.
> > 
> > This _must_ be very very fast, and appear atomic to userspace.
> 
> I'd say a spinlock rather than a semaphore.  And likely a special-cased
> one too.

Okay, we talked about this, choose a random 4-bits from the incoming
address and hash this to select one of 16 spinlocks that keep other
cpu's out. This, as you indicated, should scale to more than 4 CPU's and
make LaMont happy.
 
> I'd say we should keep doing stuff on our existing gateway page until we
> exhaust it.  We've got plenty of space -- 248 instruction slots left before
> 0xE0, and a lot of space left after the syscall handler.

I'll see if I can fit _all_ the operations into jumps in that area. If I
can't then I'll see what the performance of implementing "one" operation
in kernel and using that to do the rest atomically.
 
> On a related subject, fast gettimeofday is always a popular idea.  I'm not
> sure of all the ramifications of, for example, mapping a user-read-only,
> system-writable data page after the gateway page (can't put the data
> on the existing gateway page; a page that can do privilege promotion
> isn't readable/writable).  If we have only one CPU update the data on
> that page, time shouldn't go backwards ... right?

If you map the page and make CPU 0 update the date, then I'll write the
userspace interface for gettimeofday.

I'm not sure how we would do the check for 'do we see fast gettimeofday'
but it might be that we include a magic value there and check for it?
Other arches must have solved this.

c.
