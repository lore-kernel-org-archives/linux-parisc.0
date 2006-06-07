From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Wed, 7 Jun 2006 07:25:43 -0500
Message-ID: <200606070725.43473.mszick@morethan.org>
References: <200606070409.k5749BK4009914@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200606070409.k5749BK4009914@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue June 6 2006 23:09, John David Anglin wrote:
> 
> There are some subtle cache issues in all this.  I believe that
> machines using the PA7200 through to the PA8700 only utilize an
> L1 cache, but it has an assist buffer.  It appears using the ",sl"
> completer bypasses the L1 cache.  Michael Zick thought using this
> to reset the lock and in lock tests was a good idea, but think
> it's better to use the L1.  The effect of ",sl" on cacheline states
> is rather poorly document.  Michael has looked at some of HP's
> patents and a bunch of other papers, but I'm not convinced.  The
> PDC_CACHE command may be able to change the coherency state and
> write-back/write-through state of the data caches on some machines.
>

I suspect that the problem is more subtle than our testing.
My mind is still spinning on how to write a good test.
Working only with public documents leaves more than one gray area.
 
> The cache design was changed on the PA8800 and PA8900.  The L1
> is now on-chip and there is a large L2.  The cacheline length
> also increased from 64 to 128 bytes.  These changes could be
> part of the reason linux still doesn't run on these machines.
> 

There are two other possibilities with the dual-core processors;

1) The on-chip caches are _publicly_ documented to not do cache-line
passing internally.  Cache-lines are still passed over the external
buss.  This may be a gray area in the public documents.

2) The "old school" (prior to pa8800/pa8900) machines could rely on
the buss timing to guarantee that coherency arbitration always won
the race with buss arbitration.
The new runway buss is running DDR (double data rate) with both edges
of the clock active.  The overall effect of this change is another
gray area in the public documents.

> 
> Joel ran a test kernel with a patch to align statically allocated
> locks.  It might have run a bit longer than average but there was
> still a softlockup after a few days.  So, I don't think the lockup
> is due to the spinlock design per say, although I could easily
> be wrong.  I think it's more likely to be something to do with
> interrupt handling.  This is suggested by the stack traces which
> often seem to occur in the interrupt return path.
> 

There may well be more than one subtle failure involved.  
It may not be a single point (spinlocks) failure.

> I've looked at the locking in hpux a bit.  As far as I can tell,
> the kernel never really spins.  It has code to do pre-arbitration
> and keeps track of tasks and priorities.  When a lock is released,
> the code calls into suwaiters to see if the lock should be handed
> over to another task or released.  When we just spin, we are relying
> on the bus arbitration to select a winner.  So, when we have a
> highly contended lock, it might be  possible for a cpu to get locked
> out for sufficient time to cause a softlockup.
> 

I never went back to correct the state tables in the document I worked
up to match the most recent code snippets...

I will fix that and then post a link on this list.

Right or wrong - that document gives us the ground work for lock passing
and lock failure recovery without ever having seen HPUX.

I can see where gains could be made in the 4 or more processor case, but
not anything that would help Joel's 2 processor machine.

I still think it will require a good test protocol to find this problem
and I am still stuck on finding a good test protocol.

> Dave

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
