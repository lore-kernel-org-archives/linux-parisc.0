From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] some more questions about __raw_write_trylock()
	hppa implementation
Date: Wed, 30 Aug 2006 21:59:32 -0600
Message-ID: <20060831035932.GB4919@parisc-linux.org>
References: <44F5F3CB.30806@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44F5F3CB.30806@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Aug 30, 2006 at 08:23:39PM +0000, Joel Soete wrote:
> Hello all,
> 
> I noticed that:
> static  __inline__ int __raw_write_trylock(raw_rwlock_t *rw)
> {
>         __raw_spin_lock(&rw->lock);
>         if (rw->counter != 0) {
>                 /* this basically never happens */
>                 __raw_spin_unlock(&rw->lock);
> 
>                 return 0;
>         }
> 
>         /* got it.  now leave without unlocking */
>         rw->counter = -1; /* remember we are locked */
>         return 1;
> }
> 
> 
> so depending the counter is null or not the lock is kept or relaxed?
> 
> following my smp pb invextigation the pb I encounter seems to occure rarely 
> and so according to above comment "/* this basically never happens */" I 
> place here a panic() in the hope to get a better trace if it start to hang 
> by this place. Unfortunately the comment is wrong and system panicing at 
> boot time ;-(

The comment isn't wrong.  It just means that the contention only happens
when there's actual write-lock contention.

> Looking to some other implementation (powerpc and sh in particular), I 
> don't have the feeling that this fnct should have to keep the lock in any 
> case. Any idea?

That's how it works.  Write locks keep the spinlock locked, read locks
release it.  Actually, there is a problem with the write locks that I
noticed during replying to this mail the first time.  Then palinux
crashed.  How ironic.  Grant and I are fixing that right now ...
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
