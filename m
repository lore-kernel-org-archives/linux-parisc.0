From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: random freezes B2000 running debian hppa lenny
Date: Mon, 18 May 2009 10:35:32 -0600
Message-ID: <20090518163532.GA21195@lackof.org>
References: <49FB108B.9030803@ieee.org> <20090503112554.GB6617@lackof.org> <4A0DEF5F.6090401@ieee.org> <20090518030411.GB10973@lackof.org> <4A112BA3.5000406@ieee.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Dirk Van Hertem <dirk.vanhertem@ieee.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A112BA3.5000406@ieee.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, May 18, 2009 at 11:34:27AM +0200, Dirk Van Hertem wrote:
> Hello Grant,
> 
> Thank you for the response.
> 
> I am sorry to say, but I more or less understand your email, yet I have
> no idea what to do with it...
> 
> How do I proceed to get this fixed?

1) Locate the use of 0x40 offset in the Promise SATA controller driver.
2) Narrow down which uses are likely to have been the "victim"
3) Look for dma map/unmap "leaks" - use of an address for DMA *after*
   it's been unmapped OR before it's been mapped.

> I am willing to learn something
> about debugging, but I would need someone to hold my hand (I do not know
> C, I have only a basic understanding on how the kernel works,...). I
> have the impression that the problem is not gigantic, but might be
> something simple to solve, maybe even just patching the sata_promise.c
> file? Yet, I do not have an idea where and how to start looking...

Yes, I think you can read the sata_promise.c. But after first glance,
I'm afraid this is not a trivial problem...but you can do some code review
to look for unmatched or missing dma_map_sg() and dma_unmap_sg() calls.

Here's a start of the steps above:

1) Locate the use of 0x40 offset in the Promise SATA controller driver.

  56         /* host register offsets (from host->iomap[PDC_MMIO_BAR]) */
  57         PDC_INT_SEQMASK         = 0x40, /* Mask of asserted SEQ INTs */
  58         PDC_FLASH_CTL           = 0x44, /* Flash control register */
...
 811 static irqreturn_t pdc_interrupt(int irq, void *dev_instance)
 812 {
...
 844         /* reading should also clear interrupts */
 845         mask = readl(host_mmio + PDC_INT_SEQMASK);
... [ does some bit frobbing ]
 858         writel(mask, host_mmio + PDC_INT_SEQMASK);


So the "victim" seems to be a normal read from a register.
Unlikely to be the problem. Likely *before* the interrupt was delivered,
had attempted to do DMA to an invalid DMA address. Since the IOMMU
lookup fails, the IOMMU goes "fatal" and stops forwarding MMIO traffic
to the PCI busses (including the Promise card in slot 4).


> I can give you access to the machine if that would help (note that this
> would last only one hour or so, than it will hang automatically and I
> would need to reboot it ;).

It won't help since the "ideal" way to debug this would be to attach
a PCI analyzer, collect a trace of the failure, then examine all
the DMA transactions preceeding the failure.

The less ideal way is to stare at the code, a Promise SATA Programmers
Guide, and figure out how the device is supposed to work.

Also, I'd be looking extra careful at the error handling paths.
Thus are notorious for not cleaning up correctly. In this case,
"canceling" an IO that is still in flight. Driver has to guarantee
the SATA controller will NEVER DMA to a chunk of memory that is not mapped
for DMA.



> So my questions are:
> * Is this something that can be solved? (in a reasonable time frame, I
> want to use the hard disks for storage ;-))
> * by me? (If so, how?)
> * Must I forward this to the maintainers of this promise card within the
> kernel, or is this a parisc thing?

parisc exposes the bug. I'm pretty sure this is a sata_promise driver bug.
Forwarding to the promise maintainer and CC'ing linux-ide@vger.kernel.org
would probably be the best thing to start with. You can still take a look
through the code.


> >> I attached the "ser pim" output to this email, I hope it helps. If you
> >> need any other information, please ask, I hope I'll be more responsive
> >> next time...
> >
> > HPMC Chassis Codes = 2cbf0  2500b  2cbf2  2cbfc
> > 
> > Looking at:
> >     ftp://ftp.parisc-linux.org/docs/platforms/A2375-90004.pdf
> > 
> > CBF0 HPMC handling initiated.
> > CBF2 Invalid length for OS HPMC handler
> > CBFC Branch to OS HPMC failed
> > 
> > Just means the linux HPMC handler didn't get called. Hrm. This worked once
> > upon a time and I thought got fixed 6-8 months ago.
> > 
> > Next thing I look at is:
> > RUN_ADDR                     = 0xc1bff0fffed08040
> > 
> > So whatever is at 0xfffed08040 (40 bit addresses physically)
> > was the either the victim or the culprit. Often this is a MMIO BAR
> > plus some offset (probably 0x40). I suggest looking in the
> > Controller driver for that offset and where it's used in the
> > initialization
> > 
> 
> In sata_promise.c, there is the following code:
> 
> 	/* per-port ATA register offsets (from ap->ioaddr.cmd_addr) */
> 
> 	PDC_PKT_SUBMIT		= 0x40, /* Command packet pointer addr*/

Good! I stopped looking for 0x40 once I found PDC_INT_SEQMASK.
You could be right that this use of 0x40 is the victim.
It's quite possible. But the scenario I describe is still the
same (DMA to invalid address and then MMIO fails).

> This PDC_PKT_SUBMIT is than used again here:
> 
> static void pdc_packet_start(struct ata_queued_cmd *qc)
> {
> 	struct ata_port *ap = qc->ap;
> 	struct pdc_port_priv *pp = ap->private_data;
> 	void __iomem *host_mmio = ap->host->iomap[PDC_MMIO_BAR];
> 	void __iomem *ata_mmio = ap->ioaddr.cmd_addr;
> 	unsigned int port_no = ap->port_no;
> 	u8 seq = (u8) (port_no + 1);
> 
> 	VPRINTK("ENTER, ap %p\n", ap);
> 
> 	writel(0x00000001, host_mmio + (seq * 4));
> 	readl(host_mmio + (seq * 4));	/* flush */
> 
> 	pp->pkt[2] = seq;
> 	wmb();			/* flush PRD, pkt writes */
> 	writel(pp->pkt_dma, ata_mmio + PDC_PKT_SUBMIT);
> 	readl(ata_mmio + PDC_PKT_SUBMIT); /* flush */
> }
> 
> This function is then used in case a ATA_PROT_DMA is called.
> It seems like that this might be the spot where the problem might be (as
> you indicate further down). I will test (just for the sake of it) if it
> will stop crashing if I turn DMA down (if that is possible with a raid
> device)

Things that can be tried:
o try to limit which buffers get used,
o leave more stale DMA mappings open longer (risks memory corruption)
o dump additional info (e.g. last 5 dma_map/dma_unmap parameters) in
  the HPMC handler (which currently isn't working in the kernel you used).

I don't know if these are beyond you ability. But "DMA mapping code" in
this case refers to drivers/parisc/sba_iommu.c . Take a look at that
so you have an idea of what is involved with DMA map/unmap code.


> > System Responder Path        = 0x00ffffff0a010400
> > 
> > This is supposed to match the HPA (Host Phys Address) of one of the
> > devices that is listed at the beginning of the parisc-linux boot.
> > I'm not sure it' accurate though.
> 
> I will try to check that this evening (I hope this will be something
> that will appear in my minicom screen?

Yes, it should be in the console output someplace.

> 
> > 
> > And then the last part of the PIM that's interesting basically confirms
> > what we have been guessing:
> > 
> > '9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:
> > 
> > A Data I/O Fetch Timeout occurred while CPU 0 was
> > requesting information from a device at the path 10/1/4/0 (PCI slot 4).

I forgot to mention the "I/O Module Error Log" means something too:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048

It would be worth finding out what "Word3" (hint: search parisc-linux
mail archives) means again.

cheers,
grant

> > 
> > I forgot how to check if the "I/O Fetch Timeout" occurred because
> > the IOMMU already went "fatal" (DMA was attempted to an unmapped address).
> > 
> > 
> > FYI, I also found the C3000 service manual here:
> >     http://sysdoc.doors.ch/HP/lpv38336.pdf
> > 
> > and uploaded a copy to:
> > 	ftp://ftp.parisc-linux.org/docs/platforms/c3000-service.pdf
> > 
> > TODO: add an entry to http://www.parisc-linux.org/documentation/ 
> > 
> > hth,
> > grant
> 
> Thanks again,
> 
> Dirk
> 
> -- 
> Dirk Van Hertem                       Dirk.VanHertem@esat.kuleuven.be
> Electrical Engineering Department  http://www.esat.kuleuven.be/electa
> K.U. Leuven, ESAT-ELECTA                         tel: +32-16-32.18.95
> 10, Kasteelpark Arenberg, B-3001 Heverlee        fax: +32-16-32.19.85
