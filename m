Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3A39482B
	for <parisc-linux@parisc-linux.org>; Fri, 25 Jul 2003 05:37:01 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19g0se-0006bI-5u; Fri, 25 Jul 2003 12:37:00 +0100
Date: Fri, 25 Jul 2003 12:37:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Generic light-weight syscall.
Message-ID: <20030725113700.GH1485@parcelfarce.linux.theplanet.co.uk>
References: <20030725063739.GA13017@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030725063739.GA13017@systemhalted>
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

On Fri, Jul 25, 2003 at 02:37:40AM -0400, Carlos O'Donell wrote:
> Any thoughts about how one should implement some type of lightweight
> syscall for our glibc to use?

I have lots of thoughts ;-)

> We already have the makings of a simple system for SET_THREAD_SELF (e.g.
> seting cr27, the thread register, from userpsace), and I want to extend
> this to:
> 
> exchange_and_add (volatile uint32_t *mem, int val)
> atomic_add (volatile uint32_t *mem, int val)
> compare_and_swap (volatile long int *p, long int oldval, long int newval)

Sure.  Sounds like a great idea.

> o---> libc 
>  --> exchange_and_add 
>   ==> Params into kernel
>    ==> disable interrupts on the current processor
>     ==> take a semaphore to keep other cpu's out
>     ==> do work 
>     ==> release semaphore
>    ==> reenable i-bit
>   --> back into userspace and done.
> 
> This _must_ be very very fast, and appear atomic to userspace.

I'd say a spinlock rather than a semaphore.  And likely a special-cased
one too.

> Perhaps adding other pages instead of 0xE0 for set_thread_self might be
> the simplest way to do this? The area after the linux gateway page
> perhaps? Which seems to be the start of the next 4k page? Would this be
> possible? e.g. branch to 0x1000 (not 0x100 which is the current syscall
> branch).

I'd say we should keep doing stuff on our existing gateway page until we
exhaust it.  We've got plenty of space -- 248 instruction slots left before
0xE0, and a lot of space left after the syscall handler.

On a related subject, fast gettimeofday is always a popular idea.  I'm not
sure of all the ramifications of, for example, mapping a user-read-only,
system-writable data page after the gateway page (can't put the data
on the existing gateway page; a page that can do privilege promotion
isn't readable/writable).  If we have only one CPU update the data on
that page, time shouldn't go backwards ... right?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
