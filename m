From: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] The new iomap interface
Date: Fri, 17 Sep 2004 17:50:31 +0100
Message-ID: <20040917165031.GT642@parcelfarce.linux.theplanet.co.uk>
References: <20040917124612.GS642@parcelfarce.linux.theplanet.co.uk>
	<20040917162430.GA7984@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040917162430.GA7984@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 17, 2004 at 10:24:30AM -0600, Grant Grundler wrote:
> Interesting. I'm not sure this new scheme provides any special hooks
> that we can't already do today.
> Did Linus write why he wants iomap? Have a URL handy?

Not really, it just kind of appeared.  There's an explanatory post
rather after the fact from Linus here:
http://www.ussg.iu.edu/hypermail/linux/kernel/0409.1/2561.html

> The problem with this scheme are the semantics are slightly
> different for IO Port vs MMIO. IO Port space is "non-Postable"
> for writes and MMIO space is "Postable". The former must stall
> the CPU. Because of this, drivers can be written for MMIO space
> and then seamlessly switch to IO Port space.
> But the converse is usually not true.

There's still quibbling over the semantics one is entitled to assume
with the new ioreadX() functions.  It's possible they may end up being
closer to readX_relaxed() than readX(), but they're certainly not entitled
to assume port semantics.

> The mechanism to access IO port space varies more by chipset than
> by firmware. The firmware might happen to advertise an alternate
> "view" of IO Port space. And PAT PDC support falls into the
> "we have to do this different for 64-bit" bucket.

I'm using your terminology, dude :-P  See drivers/parisc/lba_pci.c
We have "astro" and "pat" port io accessors.

> > Phew.  OK.  How to make that lot work?  Well .. looks to me like we want:
> > 
> > /*
> >  * Technically, this should be 'if (VMALLOC_START < addr < VMALLOC_END),
> >  * but that's slow and we know it'll be within the first 2GB.
> >  */
> > #define INDIRECT_ADDR(addr)     (((unsigned long)(addr) & 0x80000000) != 0)
> 
> AFAIK, all machines capable of running 32-bit kernel, use *ONLY* the
> top 256MB (F-space) of address space for IO.
> I think the 32-bit implementation could be tightened up to be 
> 
> #define INDIRECT_ADDR(addr)     (((unsigned long)(addr) & 0xf0000000UL) != 0xf0000000UL)

Oops, domain violation ;-)
You're thinking about *physical* pointers, not ones returned from ioremap().
ioremap() returns a pointer that is inside the VMALLOC range.  I tried to
make that clear in the comment above.

> plus 3 instructions for the swap (for 32 bit).

Sure, but that's the same as today.

> So basically you want to alias all of 32-bit address into 512MB chunks.
> Each "region" maps to a particular accessor.

Basically, we have a new address space.  In addition to the physical
(cat /proc/iomem), the virtual kernel (erm, is this documented anywhere?)
and the virtual user address spaces, we now have an iomem address space.
The proposed layout is:

00000000-7fffffff virtual mapped IO
80000000-8fffffff ISA/EISA port space
90000000-9fffffff Dino port space
a0000000-afffffff Astro port space
b0000000-bfffffff PAT port space
c0000000-cfffffff non-swapped memory IO
f0000000-ffffffff legacy IO pointers

> But I'm not convinced it's worth turning the world upside down for.
> If you think it's significantly better, go for it.

We have to support the new iomap interface _somehow_.  I just saw this as
an opportunity to overhaul our existing mmio interface and a chance to
speed up some of the port ops.

> Personally, I think the work you, jejb, and tausq are doing for
> cache/TLB flushing means alot more in terms of performance.

You give me too much credit -- I don't work on that at all ;-)

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
