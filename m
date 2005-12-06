From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Tue, 6 Dec 2005 09:46:14 -0700
Message-ID: <20051206164614.GA22132@colo.lackof.org>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
	<20051206081458.GA16793@colo.lackof.org>
	<20051206094908.GB1706@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: Grant Grundler <grundler@parisc-linux.org>,
 James Bottomley <James.Bottomley@SteelEye.com>,
 Kyle McMartin <kyle@parisc-linux.org>,
 linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051206094908.GB1706@flint.arm.linux.org.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Dec 06, 2005 at 09:49:08AM +0000, Russell King wrote:
> > How is the region selected? (ie please point me at the right code)
> 
> By the addresses passed in as available resources, or the parent bridge
> resources if the cardbus bridge is attached to a P2P bridge.
> 
> We start at the start of each resource and interate over it with a step
> size of 16k to 8MB depending on the size of the resource.  We ioremap
> the physical address, and then ask the PCMCIA controller to forward
> accesses targetted at the physical address to the PCMCIA card.
> 
> We then access the physical address to check whether it looks like the
> cards CIS data, and then we destroy the mapping and iounmap.  Repeat
> for each step until we reach the end of the resource.

Ok. As long as the MMIO bus addresses used fall within the
range being forwarded down the PCI bus, this should work fine.

> If that fails, we perform the same thing (mapping the CIS data) but
> we use a checksum method on the mapped card data instead.
> 
> > Is there some obvious document that explains my basic questions?
> 
> Unfortunately the only thing which exists is the code, sorry.

I'll try to summarize this thread later this week and mail you a new file
for Documentation/pcmcia/.

> I hope you are aware that PCMCIA bridges use memory and IO outside
> their own BARs when setting up mappings for legacy PCMCIA cards?

I'm not. But that's perfectly ok as long as PCMCIA code only deals
with the MMIO resources associated with that parent PCI bus.

> Hence, the parent bridge needs to forward _more_ IO and memory than
> the bus would appear to require.

We typically assign 8MB-256MB of MMIO space per PCI bus depending
on IO configuration and platforms/chipset. I expect that's more
than what the PCMCIA bridge would request for itself.

> > Ok. More basic questions:
> > Why are we doing this? Is this a form of bus walk?
> 
> We are doing this to ensure that the memory really is available - on
> PCs it may clash with weirdo ACPI/SMM/BIOS crap which we don't know
> about.  On non-PCs it should be completely harmless.  If it isn't,
> that indicates that we found another hardware problem which precludes
> us from using the addresses we're attempting to use.

Ok - that makes sense. I agree it should be harmless.
Sounds like there is a real problem here with how MMIO resources
are being assigned or used.

> So the memory probe itself is not the problem, but it found something
> we weren't expecting which will cause a problem later.

*nod*

> > If PCMCIA is susceptible to write posting issues, then a
> > PCI-PCMCIA bridge on PARISC is likely to expose those issues.
> > ie timing of register writes are likely different.
> 
> It could be - the control registers are MMIO, and we would be reading
> a different MMIO address.  However, since both of those are on the same
> bus (even to the same device) shouldn't the writes complete before the
> reads?

I'm certain PCI ordering rules are enforced. With "write posting" I
was referring to my favorite problem that I talked about here:
	http://iou.parisc-linux.org/ols_2002/4_3MMIO_is_harder.html

Ie any dependency on udelay() after an MMIO write is problematic.

> > That's possible. If PCMCIA is assigning MMIO addresses outside the
> > range routed down the PCI bus, the box will HPMC. The "PIM dump"
> > (CPU state when it HPMC'd) can tell which address the CPU failed
> > to access. So we should be able to determine if this is the case
> > or not pretty easily.
> > 
> > I don't have any PCI-PCMCIA adapters...so may have to wait until
> > james is home again and has an hour to poke at this again.
> 
> Hope the above points folk in the right direction. 8)

Yes - it does. thanks!

grant

> 
> -- 
> Russell King
>  Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
>  maintainer of:  2.6 Serial core
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
