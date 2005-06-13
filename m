From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Mon, 13 Jun 2005 12:39:32 -0600
Message-ID: <20050613183932.GA9457@colo.lackof.org>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<20050606060512.GB30857@colo.lackof.org>
	<20050606073627.GA10387@elte.hu>
	<20050606175029.GC24437@colo.lackof.org>
	<20050612064922.GA5257@elte.hu>
	<20050612072507.GB25059@colo.lackof.org>
	<20050612073453.GA7718@elte.hu>
	<20050613062938.GD21766@colo.lackof.org>
	<20050613074407.GA13878@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Ingo Molnar <mingo@elte.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050613074407.GA13878@elte.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 13, 2005 at 09:44:07AM +0200, Ingo Molnar wrote:
> > BTW, I do not like "void *" if we can (and should) use a special 
> > typedef.
> 
> yeah, agreed - that was just a quick hack, to see whether the dependency 
> problem is sorted out via it.

Understood - I just don't think it's worth solving this problem generically
by dropping the type checking.  I think this problem is unique to parisc.
No matter how we sliced and dice it, bitops and spinlock will collide
on parisc.

>  (i'm not sure it will be resolved) I'd 
> like to address these dependency problems without having to change any 
> spinlock to raw_spinlock.

I don't want to hold up your patch since I believe it's a step
in the right direction.  I'm ok with changing to a raw_spinlock_t
for bitops.h for now.

Thinking more about circular dependency. It's basically
something like this:
	bitops.h depends on atomic.h for _atomic_spin_lock_irqsave/et al.
	atomic.h depends on spinlock.h for _raw_spin_lock* to
		define _atomic_spin_lock_irqsave/et al.
	linux/spinlock.h now depends on asm/atomic.h for atomic_t
		definition used in _atomic_dec_and_lock().

The next step may to seperate the definition of atomic_t (e.g moving
that to asm/types.h) from the inline code (usage) and function prototypes.
ie have 4 header files:
	spinlock_types.h	/* spinlock_t, SPIN_UNLOCKED, et al */
	spinlocks		/* spin_lock_*() */
	atomic_types.h		/* atomic_t */
	atomic.h		/* _atomic_spin_lock_*(), __xchg(), et al  */

Then linux/spinlock.h can include asm/atomic_types.h to get just the
subset it needs. asm/atomic.h will have to include linux/spinlock.h
then to use regular spinlocks then.  TBH, I don't like the general idea
of an asm/*.h depending on a linux/*.h (atomic.h including spinlock.h
respectively in this case).  But could live with it if you feel strongly
about no one using _raw_spinlocks directly.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
