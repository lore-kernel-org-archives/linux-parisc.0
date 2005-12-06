From: Russell King <rmk+pcmcia@arm.linux.org.uk>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Tue, 6 Dec 2005 09:49:08 +0000
Message-ID: <20051206094908.GB1706@flint.arm.linux.org.uk>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
	<20051206081458.GA16793@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 linux-pcmcia@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051206081458.GA16793@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Dec 06, 2005 at 01:14:58AM -0700, Grant Grundler wrote:
> On Mon, Dec 05, 2005 at 10:03:44PM +0000, Russell King wrote:
> ..
> > I don't have issue with the I/O side.  It's the memory side I'm
> > wondering about.
> > 
> > The probing code sets up a mapping to place the CIS at one of the
> > regions,
> 
> How is the region selected? (ie please point me at the right code)

By the addresses passed in as available resources, or the parent bridge
resources if the cardbus bridge is attached to a P2P bridge.

We start at the start of each resource and interate over it with a step
size of 16k to 8MB depending on the size of the resource.  We ioremap
the physical address, and then ask the PCMCIA controller to forward
accesses targetted at the physical address to the PCMCIA card.

We then access the physical address to check whether it looks like the
cards CIS data, and then we destroy the mapping and iounmap.  Repeat
for each step until we reach the end of the resource.

If that fails, we perform the same thing (mapping the CIS data) but
we use a checksum method on the mapped card data instead.

> Is there some obvious document that explains my basic questions?

Unfortunately the only thing which exists is the code, sorry.

> If using IO port space, parisc can be very flexible as each PCI bus
> essentially has it's own IO port space range.
> 
> But with MMIO space, routing is typically setup by firmware.
> Each PCI bus controller will get one(*) region of MMIO space
> routed to it by the chipset. Children of that PCI bus must use
> MMIO addresses allocated from that region.
> 
> (*) I'm simplifying a bit here. The full explanation is more complex.
>    But treating it like one region is sufficient in practice
>    and for the purpose of this discussion.

I hope you are aware that PCMCIA bridges use memory and IO outside
their own BARs when setting up mappings for legacy PCMCIA cards?
Hence, the parent bridge needs to forward _more_ IO and memory than
the bus would appear to require.

> >  and then tries to validate/read the CIS.  It then unmaps
> > it and maps it into the next place and repeats.  Hence, we're
> > reading data from the PCMCIA card after setting up various valid
> > mappings.
> 
> Ok. More basic questions:
> Why are we doing this? Is this a form of bus walk?

We are doing this to ensure that the memory really is available - on
PCs it may clash with weirdo ACPI/SMM/BIOS crap which we don't know
about.  On non-PCs it should be completely harmless.  If it isn't,
that indicates that we found another hardware problem which precludes
us from using the addresses we're attempting to use.

So the memory probe itself is not the problem, but it found something
we weren't expecting which will cause a problem later.

> > These mappings are not much different from the mappings which are
> > used to interpret the CIS data from the card after the memory
> > probing has completed.
> 
> I'm not familiar with how CIS data is read from a PCMCIA device.
> Normal PCI uses "Config Space". Is PCMCIA using MMIO space
> for both CIS/device discovery and assigning MMIO space to
> PCMCIA device registers?

CIS data describes the PCMCIA card - how much IO and memory space it
needs, the supply voltages, access timings, device IDs and so forth.
It is only accessed once a card has been inserted, and we have asked
the PCMCIA controller to map the CIS memory from the card into the
hosts memory space - which must be available.

> > Hence, if the memory probing is causing you issues, I'd be concerned
> > about the reliability of reading the CIS data from the card under
> > the non-probing scenarios.
> 
> If PCMCIA is susceptible to write posting issues, then a
> PCI-PCMCIA bridge on PARISC is likely to expose those issues.
> ie timing of register writes are likely different.

It could be - the control registers are MMIO, and we would be reading
a different MMIO address.  However, since both of those are on the same
bus (even to the same device) shouldn't the writes complete before the
reads?

> > Alternatively, maybe you've found a real bug somewhere in PCMCIA
> > which needs fixing...
> 
> That's possible. If PCMCIA is assigning MMIO addresses outside the
> range routed down the PCI bus, the box will HPMC. The "PIM dump"
> (CPU state when it HPMC'd) can tell which address the CPU failed
> to access. So we should be able to determine if this is the case
> or not pretty easily.
> 
> I don't have any PCI-PCMCIA adapters...so may have to wait until
> james is home again and has an hour to poke at this again.

Hope the above points folk in the right direction. 8)

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
