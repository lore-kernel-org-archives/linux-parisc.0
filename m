From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] some more questions about __raw_write_trylock()
	hppa implementation
Date: Thu, 31 Aug 2006 06:31:35 -0600
Message-ID: <20060831123135.GC4919@parisc-linux.org>
References: <44F5F3CB.30806@scarlet.be>
	<20060831035932.GB4919@parisc-linux.org>
	<20060831060637.GF3999@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060831060637.GF3999@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 31, 2006 at 12:06:37AM -0600, Grant Grundler wrote:
> Here's the patch I ended up with.
> Diff is also parked on gsyprf11:~grundler/diff-2.6.18-rc4-pa4-rwlocks-01
> 
> +static  __inline__ int __raw_read_trylock(raw_rwlock_t *rw)
> +{
> +	if (!__raw_spin_trylock(&rw->lock))
> +		return 0;
>  
> +	rw->counter++;
>  	__raw_spin_unlock(&rw->lock);
> +	return 1;
>  }

This has the false failure problem.  ie if another CPU is doing a
read_lock() at the same time, it will fail to acquire the lock, even
though it would succeed if it tried again.  I don't know if we have any
code which depends upon that not failing, but it does seem a bit
suboptimal.

Fixing this is somewhat Hard.  My original suggestion was this:

retry:
	if (__raw_spin_trylock(&rw->lock)) {
		rw->counter++;
		__raw_spin_unlock(&rw->lock);
		return 1;
	} else if (rw->counter < 0) {
		return 0;
	} else {
		goto retry;
	}

But this leads to deadlock if called from interrupt context and the CPU
had got to:

static  __inline__ void __raw_write_lock(raw_rwlock_t *rw)
{
retry:
        __raw_spin_lock(&rw->lock);

<<<- here

and hadn't set counter to -1.  Now, we can fix that:

static  __inline__ void __raw_write_lock(raw_rwlock_t *rw)
{
	unsigned long flags;
retry:
	local_irq_save(flags);
        __raw_spin_lock(&rw->lock);

        if (rw->counter != 0) {
                /* this basically never happens */
                __raw_spin_unlock(&rw->lock);
		local_irq_restore(flags);

                while (rw->counter != 0)
                        cpu_relax();

                goto retry;
        }

        /* got it.  now leave without unlocking */
        rw->counter = -1; /* remember we are locked */
	local_irq_restore(flags);
}

A similar change has to be made to __raw_write_trylock too:

static  __inline__ int __raw_write_trylock(raw_rwlock_t *rw)
{
	unsigned long flags;
	int result = 0;
	local_irq_save(flags);
	if (__raw_spin_trylock(&rw->lock)) {
		if (rw->counter == 0) {
			rw->counter = -1;
			result = 1;
		} else {
			__raw_spin_unlock(&rw->lock);
		}
	}
	local_irq_restore(flags);
	return result;
}

Better ideas, anyone?

(And perhaps more importantly, anyone spot any holes in my reasoning?
I'm not too happy disabling interrupts *after* disabling preemption.
And of course, we disable interrupts twice when called with
write_lock_irq.)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
