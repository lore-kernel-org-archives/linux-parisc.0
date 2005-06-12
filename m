From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Sun, 12 Jun 2005 01:25:07 -0600
Message-ID: <20050612072507.GB25059@colo.lackof.org>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<20050606060512.GB30857@colo.lackof.org>
	<20050606073627.GA10387@elte.hu>
	<20050606175029.GC24437@colo.lackof.org>
	<20050612064922.GA5257@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Ingo Molnar <mingo@elte.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050612064922.GA5257@elte.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jun 12, 2005 at 08:49:22AM +0200, Ingo Molnar wrote:
> 
> * Grant Grundler <grundler@parisc-linux.org> wrote:
> 
> > IPI and TLB locks can be normal locks.
> > I've dropped the parts that changed those.
> > 
> > New (smaller) patch parked at:
> >     ftp://ftp.parisc-linux.org/patches/consolidate-spinlocks-parisc.patch-02
> 
> thanks. I'm still wondering about the fundamental question though: why 
> doesnt the box boot without your patch?

Did you mean to ask: Why doesn't the kernel build w/o my patch?

> Why does the __atomic_hash and the pending_lock have to be converted
> to a raw_spinlock?

Only the __atomic_hash is raw_spinlock_t in this last patch (-03).

> This patch does not change anything fundamental

Eh?! Of course your patch does!
It dramatically changes the (nearly) circular dependencies in parisc
kernel header files. I avoid the circular dependency by using
a "raw spinlock" in that one case.

Look at the chain of nested include files in my previous message and
follow the chain and how different consumers of spinlocks are defined
in it.  It should be clear why that lock has to be a raw lock.

>  - you are still getting the same spinlock primitives from spinlock_t.

Yes - but which header files are involved in defining spinlock_t?
And which ones does parisc atomic.h and bitops.h need?

>  The only thing that changes is with 
> spinlock debugging: there another (generic) piece of code kicks in. The 
> only problem could be with assembly code that 'knows' the layout of the 
> spinlocks but doesnt take debugging into account - but is this possible 
> in the PARISC case? (Yet another possibility would be if i messed up the 
> raw type completely, but then your box wouldnt boot at all.)

No - I don't you messed up the raw type. And I personally like that change.
SMP boots and "basically" works fine for me.
(Some other bugs are outstanding and not related to spinlock definitions.)

Debug code is just a distraction. It's not relevant to this problem IMHO.

> so this is still quite much of a mystery to me!

parisc has circular dependencies between system.h, atomic.h, bitops.h,
and spinlock.h in the include/asm-parisc header files.
Why?  Because we only have one atomic operation: LDCW. We use
it to define spinlocks....which are used for atomic-ops
and bitops...I've forgotten the exact dependency now since
I sorted this out about 2 years ago.

But it was the reason I added "raw spinlocks"....you've introduced
"raw_spinlock_t" and that's only complicated the circular dependency
but not eliminated it.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
