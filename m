From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] The new iomap interface
Date: Fri, 17 Sep 2004 12:17:19 -0600
Message-ID: <20040917181719.GB7984@colo.lackof.org>
References: <20040917124612.GS642@parcelfarce.linux.theplanet.co.uk>
	<20040917162430.GA7984@colo.lackof.org>
	<20040917165031.GT642@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040917165031.GT642@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 17, 2004 at 05:50:31PM +0100, Matthew Wilcox wrote:
> On Fri, Sep 17, 2004 at 10:24:30AM -0600, Grant Grundler wrote:
> > Interesting. I'm not sure this new scheme provides any special hooks
> > that we can't already do today.
> > Did Linus write why he wants iomap? Have a URL handy?
> 
> Not really, it just kind of appeared.  There's an explanatory post
> rather after the fact from Linus here:
> http://www.ussg.iu.edu/hypermail/linux/kernel/0409.1/2561.html

Ah ok. Type checking. Excellent reason.
My guess was close in that devices drivers which access both IO Port
and MMIO space in a single binary are the root "problem" this fixes.

> There's still quibbling over the semantics one is entitled to assume
> with the new ioreadX() functions.  It's possible they may end up being
> closer to readX_relaxed() than readX(), but they're certainly not entitled
> to assume port semantics.

Well, I hope not too close to readX_relaxed() since that really violates
existing PCI ordering rules. As noted in previous email jejb cc'd me on,
AFAIK, readX_relaxed() is only useful on SGI Altix boxes.

> I'm using your terminology, dude :-P  See drivers/parisc/lba_pci.c
> We have "astro" and "pat" port io accessors.

heh - PAT PDC is only enabled for 64-bit kernels.
So the 32/64 bit split still works best.

> > AFAIK, all machines capable of running 32-bit kernel, use *ONLY* the
> > top 256MB (F-space) of address space for IO.
> > I think the 32-bit implementation could be tightened up to be 
> > 
> > #define INDIRECT_ADDR(addr)     (((unsigned long)(addr) & 0xf0000000UL) != 0xf0000000UL)
> 
> Oops, domain violation ;-)
> You're thinking about *physical* pointers, not ones returned from ioremap().

Yes - sorry

> ioremap() returns a pointer that is inside the VMALLOC range.  I tried to
> make that clear in the comment above.

You did - I just got confused thinking about 32 vs 64bit.

> > So basically you want to alias all of 32-bit address into 512MB chunks.
> > Each "region" maps to a particular accessor.
> 
> Basically, we have a new address space.  In addition to the physical
> (cat /proc/iomem), the virtual kernel (erm, is this documented anywhere?)
> and the virtual user address spaces, we now have an iomem address space.
> The proposed layout is:
> 
> 00000000-7fffffff virtual mapped IO
> 80000000-8fffffff ISA/EISA port space
> 90000000-9fffffff Dino port space
> a0000000-afffffff Astro port space
> b0000000-bfffffff PAT port space
> c0000000-cfffffff non-swapped memory IO
> f0000000-ffffffff legacy IO pointers

I see. This looks good.

> > But I'm not convinced it's worth turning the world upside down for.
> > If you think it's significantly better, go for it.
> 
> We have to support the new iomap interface _somehow_.  I just saw this as
> an opportunity to overhaul our existing mmio interface and a chance to
> speed up some of the port ops.

Yeah, true. And having the read Linus' posting (URL you gave) it
makes sense to add better type checking.


> > Personally, I think the work you, jejb, and tausq are doing for
> > cache/TLB flushing means alot more in terms of performance.
> 
> You give me too much credit -- I don't work on that at all ;-)

Sorry  :^)
I know jejb did 98% of the work, but I though you and tausq
advised/reviewed it as well.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
