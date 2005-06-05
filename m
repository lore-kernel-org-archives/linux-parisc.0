From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [linux-usb-devel] Re: [parisc-linux] [PATCH] usb/input/hid-core.c
	extract() brain damage
Date: Sun, 5 Jun 2005 01:58:04 -0600
Message-ID: <20050605075804.GA15195__655.666800639842$1416624543$gmane$org@colo.lackof.org>
References: <20050604174308.GA19823@colo.lackof.org>
	<Pine.LNX.4.44L0.0506041824180.15124-100000@netrider.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: linux-usb-devel@lists.sourceforge.net,
 parisc-linux@parisc-linux.org
To: Alan Stern <stern@rowland.harvard.edu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.44L0.0506041824180.15124-100000@netrider.rowland.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 04, 2005 at 06:59:53PM -0400, Alan Stern wrote:
> The point I was driving at is that we currently have separate APIs for 
> byte swapping and for unaligned access, and it would make a lot of sense 
> to combine them into a single API.  Knowing that the bytes have to be 
> swapped _and_ that the value isn't aligned correctly should allow us to 
> use more efficient code (in some cases) than a simple unaligned access 
> followed by a byte swap.

Ah ok. I missed that, sorry. *Some* architectures might be able
to provide more efficient implementations if they were combined.
But I don't think parisc is one of those. If I'm lucky, someone
will prove me wrong. :^)
Since many of the arches now use asm-generic/unaligned.h, I
can't say which other ones would benefit.

Just avoiding the trap is already a *huge* improvement. I'm alot
less worried about shaving a few cycles of here and there unless
it's really a critical code path (e.g. TLB miss handler or DMA
mapping support).

> I also don't understand your point about architectures that trap unaligned 
> accesses.

Architectures that trap unaligned accesses, *must* handle them.
If they don't, then networking won't work either.
I believe avoiding the trap is a good thing.

>   Let's put aside for one moment the question of whether it's 
> better to manually load the pieces of an unaligned value versus incurring 
> the overhead of a trap and a kernel fixup -- the arch-specific code is 
> supposed to know which one is better so that programmers don't have to 
> worry about it.  Given that unaligned accesses are implemented as traps, 
> what's wrong with, for example
> 
> #define get_be16(p)	be_to_cpu((u16) get_unaligned((u16 *) (p)))
> 
> This is always a valid possibility for the arch-specific implementation of 
> get_be16.  Another possibility is
> 
> static inline unsigned get_be16(void *p)
> {
> 	u8 *q = (u8 *) p;
> 
> 	return (((unsigned) q[0]) << 8) + ((unsigned) q[1]);
> }
> 
> which should in fact be the generic implementation.  It will work 
> regardless of whether unaligned accesses are trapped.

Agreed. But it's definitely suboptimal implementation.
parisc has very nice "helper" operations that allows one to
implement unaligned accesses in two or three (I forget) cycles.
Ie not much more than a regular load.

x86 also takes a 1 cycle penalty for misaligned loads.
parisc just makes that explicit in the asm.

> Is your main objection simply to the proliferation of access routines?  

Yes.

But I'm also trying to make it clear networking folks are trying
to set precedent that unaligned access macros should go away.
That is despite clear evidence of substantial performance improvements
on RISC arches.

> It's a valid point, but better too many than too few.  Furthermore it's 
> always possible to do as you said, just define get_be() and rely on the 
> caller to cast the pointer to the appropriate type.

True, but that's alot more invasive. I suspect the idea of consolidating 
swap macros will not get far for the same reason.

> > Not really. davem is right that it would clutter up certain parts
> > of the code (e.g. networking stack).
> 
> How so?  I don't think "get_be32(p)" is more clutter-ful than 
> "be32_to_cpu(get_unaligned(p))".  It's not even more clutter-ful than
> "be32_to_cpu(*p)".  Certainly it's better than
> 
> 	(p[0] << 24) + (p[1] << 16) + (p[2] << 8) + (p[3])
> 
> which occurs more often than I would like.

Yes, I agree - davem's objection is to the simple use of get_unaligned().

> > Don't forget all the above is a NOP on 90% (x86) of the computers.
> 
> So what?  The x86-specific implementation will expand to a NOP.

That's not the point. The point is 90% of the programmers looking
at the code just get distracted by the extra get_unaligned() call.

> > I'm annoyed that certain performance sensitive paths (e.g. TCP/IP) don't
> > use macros to access unaligned data. It affects my work (ia64)
> > and pet (parisc) architectures. But that's how it is and I don't
> > see it changing anytime in the near future.
> 
> Then where the macros aren't used the code would remain unchanged -- until
> someone decides to go in and clean it up.  That has nothing to do with the
> question of whether this would be a better way to implement routines for
> unaligned access.

Ok. I'm glad to hear someone else doesn't object to unaligned access
macros in general.

FWIW, I'm also 1/4 done (unsigned loads done, signed next, then stores)
with a kernel test module to generate as many variations of unaligned
accesses as possible. I've committed the user space equivalent
to cvs.parisc-linux.org/userspace/unaligned_test.c

Anyway...we are quite far off from my original patch...I've committed
it to the parisc-linux tree since I know it works for both parisc and mips.
It's also alot cleaner than the original code. I hope that finds it's
way into USB code as well unless there is good reason to reject it.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
