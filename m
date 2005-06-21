From: Ingo Molnar <mingo@elte.hu>
Subject: [parisc-linux] Re: [patch] spinlock consolidation, v2
Date: Tue, 21 Jun 2005 13:22:35 +0200
Message-ID: <20050621112235.GA19113@elte.hu>
References: <20050603173132.GX14929@parcelfarce.linux.theplanet.co.uk>
	<20050606060512.GB30857@colo.lackof.org>
	<20050606073627.GA10387@elte.hu>
	<20050606175029.GC24437@colo.lackof.org>
	<20050612064922.GA5257@elte.hu>
	<20050612072507.GB25059@colo.lackof.org>
	<20050612073453.GA7718@elte.hu>
	<20050613062938.GD21766@colo.lackof.org>
	<20050613074407.GA13878@elte.hu>
	<20050613183932.GA9457@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050613183932.GA9457@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


* Grant Grundler <grundler@parisc-linux.org> wrote:

> The next step may to seperate the definition of atomic_t (e.g moving
> that to asm/types.h) from the inline code (usage) and function prototypes.
> ie have 4 header files:
> 	spinlock_types.h	/* spinlock_t, SPIN_UNLOCKED, et al */
> 	spinlocks		/* spin_lock_*() */
> 	atomic_types.h		/* atomic_t */
> 	atomic.h		/* _atomic_spin_lock_*(), __xchg(), et al  */
> 
> Then linux/spinlock.h can include asm/atomic_types.h to get just the 
> subset it needs. asm/atomic.h will have to include linux/spinlock.h 
> then to use regular spinlocks then.  TBH, I don't like the general 
> idea of an asm/*.h depending on a linux/*.h (atomic.h including 
> spinlock.h respectively in this case).  But could live with it if you 
> feel strongly about no one using _raw_spinlocks directly.

perhaps we could further simplify things by requiring arch 
spinlock_types.h to include any other types the main spinlock.h needs.  
For most arches that would be a simple #include <asm/atomic.h>, for 
PARISC it would be #include <asm/atomic_types.h>. But i also like the 
idea of splitting up atomic.h into atomic.h and atomic_types.h.

on PARISC, asm/atomic.h would have to include linux/spinlock.h, and i 
dont see that as an ugly thing: your atomic type implementation does 
depend on spinlocks, and spinlocks are defined by the linux/spinlock*.h 
files.

	Ingo
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
