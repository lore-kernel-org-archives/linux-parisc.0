From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] V-Class server.
Date: Mon, 18 Dec 2006 10:16:01 -0700
Message-ID: <20061218171601.GA21248__11092.6470639699$1416624235$gmane$org@colo.lackof.org>
References: <4586B83E.40603@bcrl.stcloudstate.edu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Chuck Hall <chall@bcrl.stcloudstate.edu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4586B83E.40603@bcrl.stcloudstate.edu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 18, 2006 at 09:48:14AM -0600, Chuck Hall wrote:
> Greetings,
> 
> After reading the the parisc-linux website I noticed that the V-class 
> machines could be supported if someone had access to one.  I have access 
> to one, with just one problem no teststation software to get it booted.

I'm sure someone at HP could fix that for you.
Have you tried asking HP?

This web page suggested you only need the latest 10.20 HPUX :
	http://docs.hp.com/en/A3725-96005/ch03s01.html

and it will install the "teststation" software in "/spp".

And make sure the V-class can boot HPUX and pass diagnostic
tests before trying to run parisc-linux.

> If I had the software I would be willing to have the machine accessable 
> for development work for the purpose of getting Linux on it and anything 
> else you could think of.  I might even be able to get a few cs grad 
> students to work on it, they don't seem to be doing anything useful 
> right now.

The grad students or the machines? ;)
(I'm assuming you meant the the latter)

I'd be willing to consult 1-2h per week if some CS students are
interested in working on it. My advice is get them a bit drunk
before proposing the idea. At least that worked to get the parisc-linux
port off the ground too. :)

> I do have a question about the V-class and Linux.  What still needs to 
> be done?  The parisc-linux website states the main problem as being the 
> PCI bus adapter.

Yes. I wrote that bit.

The V-class has a slightly more restrictive definition of "Cache Coherent DMA"
than the other PA-RISC machines which have an IOMMU (C/D/R/K/L/N-class,
superdome and it's derivatives).  Device drivers and DMA Mapping support
need to do one or two more things to guarantee DMA remains cache coherent.
ISTR those rules are described in the public EPIC (Excalibur PCI Interface
Chip) documentation. I don't remember anymore what the issues were.
Probably something around IRQ/DMA races and DMA start/stop races.

Use http://docs.hp.com/cgi-bin/search and enter "EPIC" to get
references to the various bits of V-class docs.

Note that to make V-class useful, one would need to verify at least
2 drivers comply with those rules: tulip (100BT) and sym53cx88_2 (SCSI).
Oh, Serial/LAN console is also required but I don't know
if that's a new driver or firmware handles all of that.

Support for the LAN/Firmware debugger would be cool too.
Additional drivers that might be useful are tg3 and acenic (1000BT).

EPIC provides 5 key things needed by any system:
1) DMA IOMMU - remaps host phys memory for 32-bit PCI devices.
   The IOMMU does this with "channels" that are directional (read-only
   or write-only).
   The IOMMU is very different than any other IOMMU used on parisc.
   I recall "dma_sync" instruction was a substantial performance
   bottleneck and HPUX code had to be restructured to avoid using
   it for (by?) some device drivers.

2) DMA Coherent RAM: bi-directional DMA can _only_ be handled here.
   It's a very limited, on-chip resource. ISTR 256 KB.
   Every driver needs some coherent RAM - usually not more
   than 16-32KB. IIRC, Tachyon (Fiber Channel) was the only exception
   and it basically exhausted the pool. IIRC, they only allowed
   one FC card per EPIC.
   This is very different because DMA can be bi-directional to any host
   RAM on most systems. The X-bar Memory architecture makes cache coherent,
   bi-directional DMA not feasible.

3) MMIO and IO Port space: routes transactions to proper PCI bus.
   Probably don't have to do more than advertise the routing.

4) PCI Configuration space: no surprise here either. Most of the PCI bus walk
   code could be copied from drivers/parisc/dino.c driver.

5) PCI IRQ handling: Normal PCI Int A-D lines are supported.
   Dino IRQ code could be "leveraged" here too.

Before kicking this off, I'd see if someone at HP who worked on
HPUX V-class firmware or OS support would be willing to "mentor" this.
It would be an excellent learning opportunity for CS grad students
and this HP person could fill in the gaps where public documentation
isn't clear or just hard to find.

> Knowing what else needs to be done would help in 
> judging the difficulty in completing the project.

Might need to add some glue to "firmware device discovery".
Ie how we query firmware for where all the motherboard devices 
are. That's probably the first step if existing code doesn't
handle it.

I'm not sure how much work is needed for reasonable CPU Cache utilization.
parisc-linux currently isn't very efficiently using CPU Cache (flushing
too often).  My guess is V-class is going to require much better utilization
since pulling in cache misses across the X-bar will be expensive.

Someone might also have to count how frequently "sync" and "dmasync" ops
are being hit.

IIRC, V-class X-bar architecture has fairly high memory latency, but
_lots_ of memory Bandwidth. Something like 20GB/s over the X-bar.
My guess is it's still useful for highly parallel (MPI?) applications.

good luck!
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
