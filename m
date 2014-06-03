From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] introduce atomic_pointer to fix a race condition in
 cancelable mcs spinlocks
Date: Tue, 3 Jun 2014 08:56:18 -0700
Message-ID: <20140603155618.GR22231@linux.vnet.ibm.com>
References: <alpine.LRH.2.02.1406011342470.20831@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1406021158360.20627@file01.intranet.prod.int.rdu2.redhat.com>
 <20140602162525.GH16155@laptop.programming.kicks-ass.net>
 <CA+55aFzwrqkwD=G=w2m7TdXTpsMFjV7XUMXv5DMPGr=5x5YGCQ@mail.gmail.com>
 <alpine.LRH.2.02.1406021622200.5874@file01.intranet.prod.int.rdu2.redhat.com>
 <CA+55aFwCy4-x02U6A-KbkPEpe_4pagsZ__ipBhe5HZOQt2vNmw@mail.gmail.com>
 <alpine.LRH.2.02.1406021656550.5874@file01.intranet.prod.int.rdu2.redhat.com>
 <20140603073613.GH11096@twins.programming.kicks-ass.net>
 <20140603140727.GM22231@linux.vnet.ibm.com>
 <20140603150908.GW30445@twins.programming.kicks-ass.net>
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
	Jason Low <jason.low2@hp.com>, sparse@chrisli.org
To: Peter Zijlstra <peterz@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140603150908.GW30445@twins.programming.kicks-ass.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jun 03, 2014 at 05:09:08PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 03, 2014 at 07:07:27AM -0700, Paul E. McKenney wrote:
> > On Tue, Jun 03, 2014 at 09:36:13AM +0200, Peter Zijlstra wrote:
> > > 
> > > #ifdef __CHECKER__
> > > #define __atomic	__attribute__((address_space(5)))
> > > #else
> > > #define __atomic
> > > #endif
> > > 
> > > #define store(p, v)	(*(p) = (typeof(*(p)) __force __atomic)(v))
> > > #define load(p)		((typeof(*p) __force)ACCESS_ONCE(*(p)))
> > > 
> > > Along with changes to xchg() and cmpxchg() that require them to take
> > > pointers to __atomic.
> > > 
> > > That way we keep the flexibility of xchg() and cmpxchg() for being
> > > (mostly) type and size invariant, and get sparse to find wrong usage.
> > > 
> > > Then parisc, sparc32, tile32, metag-lock1 and arc-!llsc can go implement
> > > store() however they like.
> > 
> > Should be fun interacting with atomic operations on __rcu variables
> > (address space 4).  Of course, that is already fun...
> > 
> 
> Hmm, good point, I suppose sparse doesn't like two different
> address_space annotations on the same variable ?
> 
> /me adds Christpoher Li to the CC list.
> 
> ISTR Mikulas actually listing one such, me digs in recent email..
> 
> > $ grep -w "fdt->fd" */*.c
> > fs/file.c:      free_fdmem(fdt->fd);
> > fs/file.c:      fdt->fd = data;
> > fs/file.c:      free_fdmem(fdt->fd);
> > fs/file.c:                              struct file * file = xchg(&fdt->fd[i], NULL);
> 
> So yes, that's going to be fun, mostly because rcu_assign_pointer()
> doesn't actually do the right magic for this to be safe on their
> platform(s).

Maybe at some point sparse needs to keep a bit mask for the address
spaces, so that you caould say somthing like:

	struct foo __atomic __rcu *p;

							Thanx, Paul

