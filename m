From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] some more questions about __raw_write_trylock()
	hppa implementation
Date: Fri, 1 Sep 2006 09:57:31 -0600
Message-ID: <20060901155731.GA4041@colo.lackof.org>
References: <44F5F3CB.30806@scarlet.be>
	<20060831035932.GB4919@parisc-linux.org>
	<20060831060637.GF3999@colo.lackof.org>
	<20060831123135.GC4919@parisc-linux.org>
	<20060831162740.GB16032@colo.lackof.org>
	<20060901140123.GB5658@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060901140123.GB5658@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 01, 2006 at 08:01:23AM -0600, Matthew Wilcox wrote:
> On Thu, Aug 31, 2006 at 10:27:40AM -0600, Grant Grundler wrote:
> > trylock() variants are expected to fail some of the time.
> > But I agree readers should never fail because of another reader.
> > I guess we have to implement some number of retries (less than 5?).
> 
> I don't think we need retries; we're guaranteed to make forward
> progress.  If we fail to acquire the lock, it's because it's either held
> for a short duration by a reader, or for a long duration by a writer.
> If it's a writer, we'll fail due to the counter being negative; if it's
> a reader, we'll succeed soon.  Mmm.  Unless, of course, we interrupted a
> read-locker ... crap.  They need to take the lock in an irqsafe way too.

Yup...

> > Drop the "if (rw->counter < 0)" test and we won't have a deadlock.
> > But your next idea on fixing that sounds good to me for other reasons.
> 
> I don't understand why you think that.  Can you explain?

Without blocking interrupts, that test is reading a value
that's not deterministic. ie we don't when if/when we are
interrupting a writer. Failing the read lock is safe even
if it's not correct.


> > I'm thinking we want to block interrupts here anyway to make sure
> > the writer gets done and releases the spinlock.
> 
> Umm.  Sounds like a spectacularly bad idea.  If the caller wanted to do
> that, they would have called write_lock_irqsave() or write_lock_irq().

Well, ok - you're right about caller intentions. But the caller also has
no clue about parisc rw_locks and how fsck'd the implementation is.
I'm just "speculating out loud"  in order to make parisc implementation
work better in practice.

> With the out-of-line spinlocks (and for that matter, write locks),
> that's not going to matter.  The only place that calls
> __raw_write_lock() is in kernel/spinlock.c, so there's no way for gcc to
> optimise that away.  I can put it in anyway, since it's not going to
> make a difference.

I'm not sure that a good reason to put the mb() in.
Would "it's correct" be a better reason?
I'm thinking other people will look at the code when trying to
understand parisc.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
