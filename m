Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA09754
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Feb 2000 06:51:29 -0700
Date: Tue, 15 Feb 2000 13:50:45 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linux syscall ABI
Message-ID: <20000215135043.N765@abacus.local>
References: <200002150536.WAA04580@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200002150536.WAA04580@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Mon, Feb 14, 2000 at 10:36:39PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> > kernel memcpy() shouldn't ever be called with either an IO or a user address
> 
> I was referring to user space memcpy, not kernel memcpy.  The HP-UX user
> space memcpy supports use with IO mapped addresses, however it has to
> differentiate those addresses in order to not do optimizations that won't
> work with IO mapped addresses. Having a dedicated range allows for an
> easy test. But perhaps if this is not desirable we can just say that
> Linux glibc memcpy is not supported for IO mapped addresses (assuming it
> is optimized).

This sounds to me like a typical case of doing a static optimization (is
this a memcpy() to I/O space, from I/O space, to and from I/O space) at
runtime.

> > > One disadvantage of this proposal is that we could not support the
> > > System V personality null pointer dereference behaviour. This maps
> > > a page of zero's at location 0 so that null pointer dereferences will
> > > return 0 for buggy software. Do we really still need to maintain this
> > > ancient hack?
> >
> > No, we don't.  We're talking about PER_LINUX binaries here, and those
> > never expected to be able to dereference NULL pointers.
> 
> I don't know much about PER_SVR4, and why it exists.  Willy pointed it
> out to me.  I can see from the kernel source that perhaps it is only there
> for sparc.  If it is not necessary for parisc-linux to support then
> there is no issue. If it is necessary then I guess I assumed that PER_SVR4
> binaries would use the same gateway page as PER_LINUX binaries.
> 
> > Of course every page in the region 0xfffc0000 - 0x3f fffc (it's a 17-bit
> > signed immediate shifted left 2 bits, so that should be -2^18 - 2^18-4)
> > can be used, so we just need a page within the first 256 KB.
>  
> This is true for user space. For kernel space, I don't think we can
> use anything in F space, unless we map the real IO addresses somewhere
> else in virtual space.

That's what I meant by "within the first 256 KB". ble <offset>(srX, r0)
gives us the range 0xfffc0000 - 0x3 fffc, we can't use 0xfffc0000 - 0xfffffff,
so we're limited to the first 256 KB.

> I'm not sure what assumptions are being made
> right now regarding that mapping in the drivers.

Mapping the I/O space to 0xf000 0000 - 0xffff ffff would make sense, IMO, and
shouldn't be a problem with our drivers.

> I was also thinking that we may want to eventually map physical addresses
> directly (with no offset) to virtual addresses, in order to support the
> maximum amount of physical memory.

We agreed upon doing this eventually, didn't we ?

> But Perhaps we can have a 16 Mb offset instead.

I think not mapping the first 64 KB and making a copy of page 0 somewhere
else would make sense.  Then we could use the first 64 KB of the virtual
address space to implement gateway pages.

> > a variety of reasons why it might not be available long term) the
> > > sequence could be shortened to:
> > >
> > >       mtsp %r0,%sr0
> > >       ble  <gateway offset>(%sr0,%r0)
> > >       ldi <syscall #>,%r20
> >
> > In fact, what's wrong with shortening _this_ sequence to
> >
> >       ble <gateway offset)(%sr2, %r0)
> >       ldi <syscall #>,%r20
> >
> > and teaching userspace to not modify sr2 ?
> 
> I like this idea.  The only disadvantage is that if the user modifies sr2
> by mistake, all of a sudden all of the syscalls stop working (for that
> process only).

I don't see a real problem with that.  Modifying SR2 requires either direct
modification (the only code I could see doing that is HP/UX code, which isn't
supposed to execute with PER_LINUX anytime soon) or executing random bytes,
which will always break in unexpected ways.

> It might be hard to debug.  But, as long as we make sure that gcc never
> touches sr2, there should be almost no legitimate reason to
> play with space registers in the user address space for Linux processes,
> since we are going to have sr4=sr5=sr6=sr7.  In fact, gcc should be
> modified to stop using $$dyncall for indirect function pointer calls.  So,

There is an option for that.  Something along the lines of "fast function
calls" (I'll have a look lateron).

> Now, I am assuming we would set sr2 to 0 and locate the gateway page in
> the kernel address space if we chose this proposal.  But this idea has the
> flexibility of allowing us to move the gateway page into another space
> completely if we ever need to (would require modifications to the tlb miss
> handler).  It also has the interesting feature that a programmer could set
> sr2 to point into the user address space, and if we choose an offset for
> the gateway page in the kernel address space and make that offset also
> available for mmap in the user address space, the user could place there
> own page at the gateway offset in user space and intercept all syscalls
> (there are other ways of doing this, but I just thought it was
> interesting).

I agree this would be another point in favour of using 0:0 or 0:0x1000 as
default gateway page.

	Philipp
