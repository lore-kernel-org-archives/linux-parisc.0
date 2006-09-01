From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] some more questions about __raw_write_trylock()
	hppa implementation
Date: Fri, 1 Sep 2006 08:01:23 -0600
Message-ID: <20060901140123.GB5658@parisc-linux.org>
References: <44F5F3CB.30806@scarlet.be>
	<20060831035932.GB4919@parisc-linux.org>
	<20060831060637.GF3999@colo.lackof.org>
	<20060831123135.GC4919@parisc-linux.org>
	<20060831162740.GB16032@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060831162740.GB16032@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 31, 2006 at 10:27:40AM -0600, Grant Grundler wrote:
> trylock() variants are expected to fail some of the time.
> But I agree readers should never fail because of another reader.
> I guess we have to implement some number of retries (less than 5?).

I don't think we need retries; we're guaranteed to make forward
progress.  If we fail to acquire the lock, it's because it's either held
for a short duration by a reader, or for a long duration by a writer.
If it's a writer, we'll fail due to the counter being negative; if it's
a reader, we'll succeed soon.  Mmm.  Unless, of course, we interrupted a
read-locker ... crap.  They need to take the lock in an irqsafe way too.

> > But this leads to deadlock if called from interrupt context and the CPU
> > had got to:
> > 
> > static  __inline__ void __raw_write_lock(raw_rwlock_t *rw)
> > {
> > retry:
> >         __raw_spin_lock(&rw->lock);
> > 
> > <<<- here
> > 
> > and hadn't set counter to -1.
> 
> Drop the "if (rw->counter < 0)" test and we won't have a deadlock.
> But your next idea on fixing that sounds good to me for other reasons.

I don't understand why you think that.  Can you explain?

> > Now, we can fix that:
> > 
> > static  __inline__ void __raw_write_lock(raw_rwlock_t *rw)
> > {
> > 	unsigned long flags;
> > retry:
> > 	local_irq_save(flags);
> >         __raw_spin_lock(&rw->lock);
> ...
> 
> I'm thinking we want to block interrupts here anyway to make sure
> the writer gets done and releases the spinlock.

Umm.  Sounds like a spectacularly bad idea.  If the caller wanted to do
that, they would have called write_lock_irqsave() or write_lock_irq().

> I'm also wondering if the writer code paths need to include "mb()"
> to prevent the compiler and/or other back-end optimizers from
> re-organizing the instruction stream and "leaking" other code
> before "counter = -1" is set. James Bottomley already
> fixed our regular spinlocks for this problem once before.

With the out-of-line spinlocks (and for that matter, write locks),
that's not going to matter.  The only place that calls
__raw_write_lock() is in kernel/spinlock.c, so there's no way for gcc to
optimise that away.  I can put it in anyway, since it's not going to
make a difference.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
