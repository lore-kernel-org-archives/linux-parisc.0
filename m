From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Sun, 11 Dec 2005 00:41:38 -0700
Message-ID: <20051211074138.GB7987@colo.lackof.org>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<20051204103338.GA16791@flint.arm.linux.org.uk>
	<1133818340.3395.11.camel@mulgrave>
	<20051205220344.GJ15201@flint.arm.linux.org.uk>
	<20051206081458.GA16793@colo.lackof.org>
	<20051206094908.GB1706@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Russell King <rmk+pcmcia@arm.linux.org.uk>
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
> > Is there some obvious document that explains my basic questions?
> 
> Unfortunately the only thing which exists is the code, sorry.

Russell,
As promised, here's a first cut on something to add to
Documentation/pcmcia/memory_probe. This is in the hope of
being helpful to others porting PCMCIA to their platform.

There is a "FIXME" bit that you'll need to rephrase or perhaps delete.
I'm not clear if you generalized when mentioning P2P bridges as
the parent of the resources.

I also think the distinction between, CIS memory and PCMCIA
card MMIO ranges isn't as sharp as it could be. The last bit
at the bottom hints at it but doesn't say anything about
why the additional MMIO address space is needed.

I also assumed "CIS data" is the content in "CIS memmory".


/dream on
And someday it might be interesting to use the PCI error recovery
code in PCMCIA memory probing to recovery from failures on PPC and
ia64 platforms. It might be possible on some PARISC chipsets as well
but no one is working on PCI error recovery for any PARISC chipset AFAIK.
/dream off

thanks,
grant



PCMCIA Memory Probing
---------------------

Summarized from parisc-linux mailing thread by Grant Grundler:
http://lists.parisc-linux.org/pipermail/parisc-linux/2005-December/027743.html


Abstract
--------
The memory probing code sets up a mapping to place the CIS in one of
the available regions, and then tries to validate/read the CIS.
The probe code then unmaps the CIS data, maps it into the next place,
and repeats.  We're reading data from the PCMCIA card after setting
up various valid mappings.



> Why are we doing this? Is this a form of bus walk?

We are ensuring the MMIO resource really is available. On PCs this
resource may clash with weirdo ACPI/SMM/BIOS crap which we don't know
about.  On non-PCs probing should be completely harmless.  If it isn't,
we found another hardware problem which precludes use of the offending
address range. So the memory probe itself is not the problem, but it may
find something we weren't expecting which will cause a problem later.


[ unfortunately, it's not always harmless on PA-RISC and some
IA64 platforms. These platforms will HPMC (or MCA respectively) if a
CPU times out on an MMIO read. Error recovery on ia64 could eventually
deal sanely with this. -ggg ]


CIS data describes how much IO and memory space PCMCIA card needs,
the supply voltages, access timings, device IDs and so forth.
It is only accessed once a card has been inserted, and we have asked
the PCMCIA controller to map the CIS memory from the card into the
hosts memory space - which must be available.

CIS data is memory mapped the same way the memory probing is done.
Hence, if the memory probing causes issues, reading CIS data from the
card under the non-probing scenarios is not realiable either.



> How is the region selected? (ie please point me at the right code)

By the addresses passed in as available resources, or the parent bridge
resources if the cardbus bridge is attached to a P2P bridge.

# FIXME - what if the PCMCIA controller is connected to a Host PCI
# Bus controller?
# Maybe I'm being a bit anal in the intrepretation here because
# Host PCI bus controllers *act* like PCI-PCI Bridges from
# a PCI Point of view. But the number and type of resources
# available from a Host PCI bus controller is NOT architected
# as is the case for a PCI-PCI Bridge. 

PCMCIA Probe interates over the entire MMIO resource with a step size
of 16k to 8MB depending on the size of the resource.  We ioremap
the physical address, and then ask the PCMCIA controller to forward
accesses targetted at the physical address to the PCMCIA card.
We then access the physical address, verify the card's CIS data matches
previously read data, and then we destroy the mapping and iounmap.
Repeat for each step until we reach the end of the MMIO resource.

If that fails, we perform the same thing (mapping the CIS data) but
we use a checksum method on the mapped card data instead.


PCMCIA bridges use memory and IO outside their own BARs when setting
up mappings for legacy PCMCIA cards.  Hence, the parent bridge needs
to forward _more_ IO and memory than the bus would appear to require.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
