From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] introduce atomic_pointer to fix a race condition in
 cancelable mcs spinlocks
Date: Tue, 3 Jun 2014 07:07:27 -0700
Message-ID: <20140603140727.GM22231@linux.vnet.ibm.com>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1406021158360.20627@file01.intranet.prod.int.rdu2.redhat.com>
 <20140602162525.GH16155@laptop.programming.kicks-ass.net>
 <CA+55aFzwrqkwD=G=w2m7TdXTpsMFjV7XUMXv5DMPGr=5x5YGCQ@mail.gmail.com>
 <alpine.LRH.2.02.1406021622200.5874@file01.intranet.prod.int.rdu2.redhat.com>
 <CA+55aFwCy4-x02U6A-KbkPEpe_4pagsZ__ipBhe5HZOQt2vNmw@mail.gmail.com>
 <alpine.LRH.2.02.1406021656550.5874@file01.intranet.prod.int.rdu2.redhat.com>
 <20140603073613.GH11096@twins.programming.kicks-ass.net>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Parisc List <linux-parisc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Vinod, Chegu" <chegu_vinod@hp.com>,
	Waiman Long <Waiman.Long@hp.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rik van Riel <riel@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Davidlohr Bueso <davidlohr@hp.com>,
	Peter Anvin <hpa@zytor.com>, Andi Kleen <andi@firstfloor.org>,
	"Chandramouleeswaran, Aswin" <aswin@hp.com>,
	"Norton, Scott J" <scott.norton@hp.com>,
	Jason Low <jason.low2@hp.com>
To: Peter Zijlstra <peterz@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140603073613.GH11096@twins.programming.kicks-ass.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 03, 2014 at 09:36:13AM +0200, Peter Zijlstra wrote:
> On Mon, Jun 02, 2014 at 05:12:16PM -0400, Mikulas Patocka wrote:
> > The patch adds atomic_pointer_t for all architectures - it is in the 
> > common code and it is backed by atomic_long_t (that already exists for all 
> > architectures). There is no new arch-specific code at all.
> > 
> > When we have atomic_pointer_t, we can find the instances of xchg() and 
> > cmpxchg() and convert them to atomic_pointer_t (or to other atomic*_t 
> > types).
> > 
> > When we convert them all, we can drop xchg() and cmpxchg() at all (at 
> > least from architecture-neutral code).
> > 
> > The problem with xchg() and cmpxchg() is that they are very easy to 
> > misuse. Peter Zijlstra didn't know that they are not atomic w.r.t. normal 
> > stores, a lot of other people don't know it too - and if we allow these 
> > functions to be used, this race condition will reappear in the future 
> > again and again.
> > 
> > That's why I'm proposing atomic_pointer_t - it guarantees that this race 
> > condition can't be made.
> 
> But its horrible, and doesn't have any benefit afaict.
> 
> So if we really want to keep supporting these platforms; I would propose
> something like:
> 
> #ifdef __CHECKER__
> #define __atomic	__attribute__((address_space(5)))
> #else
> #define __atomic
> #endif
> 
> #define store(p, v)	(*(p) = (typeof(*(p)) __force __atomic)(v))
> #define load(p)		((typeof(*p) __force)ACCESS_ONCE(*(p)))
> 
> Along with changes to xchg() and cmpxchg() that require them to take
> pointers to __atomic.
> 
> That way we keep the flexibility of xchg() and cmpxchg() for being
> (mostly) type and size invariant, and get sparse to find wrong usage.
> 
> Then parisc, sparc32, tile32, metag-lock1 and arc-!llsc can go implement
> store() however they like.

Should be fun interacting with atomic operations on __rcu variables
(address space 4).  Of course, that is already fun...

							Thanx, Paul

