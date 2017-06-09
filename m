From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [RFC][PATCH] atomic: Fix atomic_set_release() for 'funny'
 architectures
Date: Fri, 09 Jun 2017 11:58:46 -0700
Message-ID: <1497034726.3510.7.camel@HansenPartnership.com>
References: <20170609092450.jwmldgtli57ozxgq@hirez.programming.kicks-ass.net>
         <20170609110506.yod47flaav3wgoj5@hirez.programming.kicks-ass.net>
         <20170609111305.bn4ca4uscbp6pgxn@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, vgupta@synopsys.com,
        rkuo@codeaurora.org, james.hogan@imgtec.com, jejb@parisc-linux.org,
        davem@davemloft.net, cmetcalf@mellanox.com,
        Parisc List <linux-parisc@vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will.deacon@arm.com>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        Boqun Feng <boqun.feng@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20170609111305.bn4ca4uscbp6pgxn@hirez.programming.kicks-ass.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

[adding parisc list]
On Fri, 2017-06-09 at 13:13 +0200, Peter Zijlstra wrote:
> On Fri, Jun 09, 2017 at 01:05:06PM +0200, Peter Zijlstra wrote:
> 
> > The spinlock based atomics should be SC, that is, none of them
> > appear to
> > place extra barriers in atomic_cmpxchg() or any of the other SC
> > atomic
> > primitives and therefore seem to rely on their spinlock
> > implementation
> > being SC (I did not fully validate all that).
> 
> So I did see that ARC and PARISC have 'superfluous' smp_mb() calls
> around their spinlock implementation.
> 
> That is, for spinlock semantics you only need one _after_ lock and 
> one _before_ unlock. But the atomic stuff relies on being SC and thus
> would need one before and after both lock and unlock.

Actually, for us that's not true.  You are correct in the above for
safety but not for performance: If we remove the safety unnecessary
barriers, it can elongate our critical sections (the spinlock can move
up in the code stream and the spin unlock can move down) which leads to
performance regressions because we end up holding locks longer than we
need (we also have a lot of hot locks).

> Now, afaict PARISC doesn't even have memory barriers (it uses
> asm-generic/barrier.h) so that's a bit of a puzzle.

We disable relaxed ordering on our architecture which means the CPU
issue stream must match the instruction stream.  We've debated turning
on relaxed ordering, but decided it was more hassle than it's worth.

James


> But ARC could probably optimize (if they still care about that 
> hardware) by pulling out those barriers and putting it in the atomic
> implementation.
> 

