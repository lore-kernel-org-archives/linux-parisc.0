From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] fix a race condition in cancelable mcs spinlocks
Date: Sun, 1 Jun 2014 21:20:26 +0200
Message-ID: <20140601192026.GE16155@laptop.programming.kicks-ass.net>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	jejb@parisc-linux.org, deller@gmx.de,
	John David Anglin <dave.anglin@bell.net>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	chegu_vinod@hp.com, paulmck@linux.vnet.ibm.com, Waiman.Long@hp.com,
	tglx@linutronix.de, riel@redhat.com, akpm@linux-foundation.org,
	davidlohr@hp.com, hpa@zytor.com, andi@firstfloor.org, aswin@hp.com,
	scott.norton@hp.com, Jason Low <jason.low2@hp.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 01, 2014 at 01:53:11PM -0400, Mikulas Patocka wrote:
> PA-RISC doesn't have xchg or cmpxchg atomic instructions like other
> processors. It only has ldcw and ldcd instructions that load a word (or
> doubleword) from memory and atomically store zero at the same location.
> These instructions can only be used to implement spinlocks, direct
> implementation of other atomic operations is impossible.
> 
> Consequently, Linux xchg and cmpxchg functions are implemented in such a
> way that they hash the address, use the hash to index a spinlock, take the
> spinlock, perform the xchg or cmpxchg operation non-atomically and drop
> the spinlock.
> 
> If you write to some variable with ACCESS_ONCE and use cmpxchg or xchg at
> the same time, you break it. ACCESS_ONCE doesn't take the hashed spinlock,
> so, in this case, cmpxchg or xchg isn't really atomic at all.

And this is really the first place in the kernel that breaks like this?
I've been using xchg() and cmpxchg() without such consideration for
quite a while.

Doesn't sparc32 have similarly broken atomic ops?

Ideally, if we really want to preserve such broken-ness, we'd add some
debugging infrastructure to detect such nonsense.

> This patch fixes the bug by introducing a new type atomic_pointer_t 
> (backed by atomic_long_t) and replacing the offending pointer with it. 
> atomic_long_set takes the hashed spinlock, so it avoids the race 
> condition.

So I hate that twice, once since xchg() and cmpxchg() do not share the
atomic_ prefix, its inappropriate and misleading here, and secondly,
non of this is specific to pointers, xchg() and cmpxchg() take any
(naturally aligned) 'native' size type.

