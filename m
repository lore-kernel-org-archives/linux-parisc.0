From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: Sun, 12 Sep 2004 13:54:33 -0400
Message-ID: <20040912175433.GQ1854@baldric.uwo.ca>
References: <20040911165325.GO28659@tausq.org>
	<20040912134707.GL1854@baldric.uwo.ca>
	<20040912161550.GR28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 PARISC list <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040912161550.GR28659@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > What is that converted to bytes?
> 
> about 100k for 64-bit. should be significantly less for 32-bit.

That's quite a bit, but it does make the infrastructure more flexible.
I don't think anyone is going to be building embedded PA systems, but
lets not bloat.
 
> > Is there ever a case where you want only the faulting instruction and
> > not the faulting address aswell? This might be a case for saving a flag,
> > if you are going to write to r9 you might aswell write two words,
> > anyway? The code has already locked r8/r9 into variables and gcc won't
> > do a better job for you.
> 
> actually a nice effect of this patch is that you don't need to lock down
> r8 and r9 anymore for the get_user/put_user cases. Potentially any 
> register can be used to store the error and result values.

I don't see how the fixup code knows which registers to use?

> i need to do some experiments to verify this, but after thinking
> about it more last night, it seems to me that we don't even need to put
> the isr/ior into registers in the fault handler.  the fixup code could 
> potentially just look at current->thread.regs.isr/ior directly.

Yes, that's very true, just fillin those values during the fixup phase.
Then you don't need to use r8/r9 and the flags just become "Yes I care,
please deposit the value" or "No I don't care."

> > 0x2 = 1 then Write r8/r9 values (slow path)
> > 0x2 = 0 then do nothing (fast path)
> > 
> > Then 0x1 is free to be used for something magical.
> 
> sure, that works too.

I'm not sure what we would use the flag for, but it's nice to have it
there. Perhaps we may in the future wish to have absolute and relative
fixups based on the flag? This would reduce the kernel size bloat and
produce faster code again. Technically only the pa_memcpy code is the
only one that would have to enable "absolute" fixups?

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
