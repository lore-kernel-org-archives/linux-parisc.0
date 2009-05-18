From: Dirk Van Hertem <dirk.vanhertem@ieee.org>
Subject: Re: random freezes B2000 running debian hppa lenny
Date: Mon, 18 May 2009 11:34:27 +0200
Message-ID: <4A112BA3.5000406@ieee.org>
References: <49FB108B.9030803@ieee.org> <20090503112554.GB6617@lackof.org> <4A0DEF5F.6090401@ieee.org> <20090518030411.GB10973@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090518030411.GB10973@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Grant,

Thank you for the response.

I am sorry to say, but I more or less understand your email, yet I have
no idea what to do with it...

How do I proceed to get this fixed? I am willing to learn something
about debugging, but I would need someone to hold my hand (I do not know
C, I have only a basic understanding on how the kernel works,...). I
have the impression that the problem is not gigantic, but might be
something simple to solve, maybe even just patching the sata_promise.c
file? Yet, I do not have an idea where and how to start looking...

I can give you access to the machine if that would help (note that this
would last only one hour or so, than it will hang automatically and I
would need to reboot it ;).

So my questions are:
* Is this something that can be solved? (in a reasonable time frame, I
want to use the hard disks for storage ;-))
* by me? (If so, how?)
* Must I forward this to the maintainers of this promise card within the
kernel, or is this a parisc thing?

>> I attached the "ser pim" output to this email, I hope it helps. If you
>> need any other information, please ask, I hope I'll be more responsive
>> next time...
>
> HPMC Chassis Codes = 2cbf0  2500b  2cbf2  2cbfc
> 
> Looking at:
>     ftp://ftp.parisc-linux.org/docs/platforms/A2375-90004.pdf
> 
> CBF0 HPMC handling initiated.
> CBF2 Invalid length for OS HPMC handler
> CBFC Branch to OS HPMC failed
> 
> Just means the linux HPMC handler didn't get called. Hrm. This worked once
> upon a time and I thought got fixed 6-8 months ago.
> 
> Next thing I look at is:
> RUN_ADDR                     = 0xc1bff0fffed08040
> 
> So whatever is at 0xfffed08040 (40 bit addresses physically)
> was the either the victim or the culprit. Often this is a MMIO BAR
> plus some offset (probably 0x40). I suggest looking in the
> Controller driver for that offset and where it's used in the
> initialization
> 

In sata_promise.c, there is the following code:

	/* per-port ATA register offsets (from ap->ioaddr.cmd_addr) */

	PDC_PKT_SUBMIT		= 0x40, /* Command packet pointer addr*/

This PDC_PKT_SUBMIT is than used again here:

static void pdc_packet_start(struct ata_queued_cmd *qc)
{
	struct ata_port *ap = qc->ap;
	struct pdc_port_priv *pp = ap->private_data;
	void __iomem *host_mmio = ap->host->iomap[PDC_MMIO_BAR];
	void __iomem *ata_mmio = ap->ioaddr.cmd_addr;
	unsigned int port_no = ap->port_no;
	u8 seq = (u8) (port_no + 1);

	VPRINTK("ENTER, ap %p\n", ap);

	writel(0x00000001, host_mmio + (seq * 4));
	readl(host_mmio + (seq * 4));	/* flush */

	pp->pkt[2] = seq;
	wmb();			/* flush PRD, pkt writes */
	writel(pp->pkt_dma, ata_mmio + PDC_PKT_SUBMIT);
	readl(ata_mmio + PDC_PKT_SUBMIT); /* flush */
}

This function is then used in case a ATA_PROT_DMA is called.
It seems like that this might be the spot where the problem might be (as
you indicate further down). I will test (just for the sake of it) if it
will stop crashing if I turn DMA down (if that is possible with a raid
device)

> 
> System Responder Path        = 0x00ffffff0a010400
> 
> This is supposed to match the HPA (Host Phys Address) of one of the
> devices that is listed at the beginning of the parisc-linux boot.
> I'm not sure it' accurate though.

I will try to check that this evening (I hope this will be something
that will appear in my minicom screen?

> 
> And then the last part of the PIM that's interesting basically confirms
> what we have been guessing:
> 
> '9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 bytes:
> 
> A Data I/O Fetch Timeout occurred while CPU 0 was
> requesting information from a device at the path 10/1/4/0 (PCI slot 4).
> 
> I forgot how to check if the "I/O Fetch Timeout" occurred because
> the IOMMU already went "fatal" (DMA was attempted to an unmapped address).
> 
> 
> FYI, I also found the C3000 service manual here:
>     http://sysdoc.doors.ch/HP/lpv38336.pdf
> 
> and uploaded a copy to:
> 	ftp://ftp.parisc-linux.org/docs/platforms/c3000-service.pdf
> 
> TODO: add an entry to http://www.parisc-linux.org/documentation/ 
> 
> hth,
> grant

Thanks again,

Dirk

-- 
Dirk Van Hertem                       Dirk.VanHertem@esat.kuleuven.be
Electrical Engineering Department  http://www.esat.kuleuven.be/electa
K.U. Leuven, ESAT-ELECTA                         tel: +32-16-32.18.95
10, Kasteelpark Arenberg, B-3001 Heverlee        fax: +32-16-32.19.85
