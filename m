From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Re: Trident video card caused Kernel Panic on HP
	Visualize 785/B2000 with rebuilt 2.6.11-rc6-pa1 kernel
Date: Mon, 20 Jun 2005 20:06:05 -0600
Message-ID: <20050621020605.GB12189@colo.lackof.org>
References: <5.1.1.6.1.20050615221250.02a429c0@pop.singnet.com.sg>
	<20050615190616.GA29652@colo.lackof.org>
	<200506201445.19818.bjorn.helgaas@hp.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200506201445.19818.bjorn.helgaas@hp.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jun 20, 2005 at 02:45:19PM -0600, Bjorn Helgaas wrote:
> On Wednesday 15 June 2005 1:06 pm, Grant Grundler wrote:
> > The HPMC occurs when tridentfb.c tries to poke at:
> >         if (chip_id == TGUI9660) {
> >                 outb(RevisionID,0x3C4);
> >                 revision = inb(0x3C5);
> > ...	
> > 
> > This generally can't work on parisc.
> > Only if the trident card is plugged in under PCI bus 0.
> > The driver needs to map the hard coded address to some PCI resource.
> 
> 0x3C4 and 0x3C5 are in the legacy VGA port range.

Bjorn,
ok - thanks for the follow up.

> Does Astro have programmable routing for that range?

Supposedly yes. But it was never verified by the HW teams and
I've been told that it is in fact broken.

If someone wants to poke at this anyway, the "STATUS_CONTROL"
register documented in:
	http://ftp.parisc-linux.org/docs/chips/elroy_ers.ps

describes the "VGA Enable bit":
| VGA Enable (bit 3, 0x8)
|    If ve = 1, VGA frame buffer and IOP space accesses will never be
|    claimed by ELROY, regardless of range register programming. This bit
|    must be set if a VGA device is located on this PCI bus. Only one
|    ELROY in the system should have its ve bit set.
|    If ve = 0, ELROY may claim VGA space, depending on range register
|    programming.

ie a "directed range" could be programmed to redirect accesses from
MMIO space to a particular Elroy. Requires programming a directed
range in Astro and a matched "Extra LMMIO" range in Elroy.
I've never messed with this and always depended on firmware
to deal with range registers.

| VGA Frame Buffer Space
| The VGA frame buffer space is a fixed 128 k region from 640 k to (768 k - 1).
| The only PCI bus in the system that will claim this space is the one
| with the VGA Enable bit set. This PCI bus will also claim accesses to
| VGA I/O Space.


| VGA I/O Port Space
| The VGA I/O space is the fixed I/O space region from 0x03B0 through
| 0x03DF and the 10 bit aliases.
...
| Also, even if the VGA I/O Space overlaps the I/O space of another
| PCI bus, only the PCI bus with its VGA Enable bit set will respond
| to these ranges.

Just remember it may not work at all or fail in some wierd way.
If if doesn't work, don't ask me since I won't know either.


> If so, this could probably
> be made to work with enough kernel support.  I'm working on some
> similar stuff for ia64.

Note that pa8800 boxes also use ZX1 chipset. Please keep
parisc-linux cc'd on any patches you cook up for this.

thanks again ,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
