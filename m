From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] fix a race condition in cancelable mcs spinlocks
Date: Mon, 02 Jun 2014 12:56:40 -0700
Message-ID: <1401739000.12939.34.camel@dabdike.int.hansenpartnership.com>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>
	 <20140601192026.GE16155@laptop.programming.kicks-ass.net>
	 <BLU0-SMTP387BD0AE22A4EAD432D65F97210@phx.gbl>
	 <20140601213003.GG16155@laptop.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: John David Anglin <dave.anglin@bell.net>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	jejb@parisc-linux.org, deller@gmx.de, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chegu_vinod@hp.com,
	paulmck@linux.vnet.ibm.com, Waiman.Long@hp.com, tglx@linutronix.de,
	riel@redhat.com, akpm@linux-foundation.org, davidlohr@hp.com,
	hpa@zytor.com, andi@firstfloor.org, aswin@hp.com,
	scott.norton@hp.com, Jason Low <jason.low2@hp.com>
To: Peter Zijlstra <peterz@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140601213003.GG16155@laptop.programming.kicks-ass.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2014-06-01 at 23:30 +0200, Peter Zijlstra wrote:
> On Sun, Jun 01, 2014 at 04:46:26PM -0400, John David Anglin wrote:
> > On 1-Jun-14, at 3:20 PM, Peter Zijlstra wrote:
> > 
> > >>If you write to some variable with ACCESS_ONCE and use cmpxchg or xchg
> > >>at
> > >>the same time, you break it. ACCESS_ONCE doesn't take the hashed
> > >>spinlock,
> > >>so, in this case, cmpxchg or xchg isn't really atomic at all.
> > >
> > >And this is really the first place in the kernel that breaks like this?
> > >I've been using xchg() and cmpxchg() without such consideration for
> > >quite a while.
> > 
> > I believe Mikulas is correct.  Even in a controlled situation where a
> > cmpxchg operation
> > is used to implement pthread_spin_lock() in userspace, we found recently
> > that the lock
> > must be released with a  cmpxchg operation and not a simple write on SMP
> > systems.
> > There is a race in the cache operations or instruction ordering that's not
> > present with
> > the ldcw instruction.
> 
> Oh, I'm not arguing that. He's quite right that its broken, but this
> form of atomic ops is also quite insane and unusual. Most sane machines
> don't have this problem.
> 
> My main concern is how are we going to avoid breaking parisc (and I
> think sparc32, which is similarly retarded) in the future; we should
> invest in machinery to find and detect these things.

Architecturally, there is a way we could emulate the atomic exchange
instructions.  We could have a special section of memory that always
triggers a page trap.  In the Q state dtlb trap handlers we could
recognise the "atomic" section of memory and wrap the attempted
modification in a semaphore.  This would add a bit of overhead, but not
a huge amount if we do it in the trap handlers like the TMPALIAS
flushes.  This involves a lot of work for us because we have to decode
the instructions in software, recognise the operations and manually
apply the hashed semaphores around them.  If we did it like this, all
we'd need by way of mainline support is that variables treated as
atomically exchangeable should be in a separate section (because it's a
page fault handler effectively, we need them all separated from "normal"
code).  This would probably require some type of variable marker and if
we ever saw a xchg or cmpxchg on a variable without the marker, we could
break the build.

The way we'd implement is the memory region would be read and write
protected, so all loads and stores trap to the dtlb absent handlers.
For a ldX instruction, if it were not followed by a stX to the same
location, we'd simply give it the value.  For stX followed by ldX for
xchg, we'd take the lock, do the exchange and drop the lock and for stX
not preceded by ldX, we'd take the lock, do the store and drop the lock.
To avoid compromising the protected region, we'd actually back it by a
different area of kernel memory where we make the real modifications,
rather than trying to muck with temporarily inserting a TLB entry.  On
return we'd have to nullify the instructions to avoid re-trapping.
Effectively this has us emulating all load and store operations with a
shadow memory region ... if you know the number of possible address
modes for PARISC, you'll realise that's a non-trivial amount of code.
Plus we'd either have to ensure the shadow region had a permanent TLB
entry or do a full fault and exit the TLB handler (we can't take a
nested TLB fault within the TLB fault handler).

Is it worth it ... definitely not if we can just prevent mainline from
using xchg on our architecture.

James


