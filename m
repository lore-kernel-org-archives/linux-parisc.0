Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amanda.ybsoft.com (lametoby.ybsoft.com [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9EE13482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jul 2001 21:39:31 -0600 (MDT)
Date: Mon, 16 Jul 2001 21:39:29 -0600
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] help debuging HMPC
Message-ID: <20010716213929.A20026@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
References: <200107161338.HAA20386@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107161338.HAA20386@puffin.external.hp.com>
From: rbrad@beavis.ybsoft.com (Ryan Bradetich)
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jul 16, 2001 at 07:38:00AM -0600, Grant Grundler wrote:
> Ryan Bradetich wrote:
> > Just a quick clarification:
> > 
> > I macro expanded dino_in32 into this:
> > 	static u32 dino_in32 (struct pci_hba_data *d, u16 addr);
> > 
> > dino_in32 only takes two arguments, so I should check GR25 and manually
> > perform the calculations in the dino_in32 to get the proper address
> > passed to the _gsc_readl function, correct?  
> 
> Erm, right...dino_outX takes three...but the address is the second arg
> and should be found in GR25 too. ATM, I can't explain why I found the
> IO port address in GR24 when debugging a PCI problem on the A500.

I am confused about this also.

This is from the Documentation/parisc/registers file:

    r23-r26: these are arg3-arg0, i.e. you can use them if you
        don't care about the values that were passed in anymore.


this is from my latest register dump:

	r24-27   0000ff40 f2000064 040067f0 102ac010

The first thing that threw me was GR25 was obviously larger then the
u16 address being passed into dino_in32 function.  The other thing is
that value looks like a valid IO address.

I then checked to see how the values being passed to the gsc_writel 
function (I macro-expanded the function and pasted it here for easy 
reference):  

static u32 dino_in32 (struct pci_hba_data *d, u16 addr) 
{
	u32 v;
	unsigned long flags;

	spin_lock_irqsave(&(DINO_DEV(d)->dinosaur_pen), flags);

	/* tell HW which IO Port address */ \
	gsc_writel((u32) addr & ~3, d->base_addr + DINO_PCI_ADDR);

	/* generate I/O PORT read cycle */
	v = gsc_readl(d->base_addr+DINO_IO_DATA+(addr&0));

	spin_unlock_irqrestore(&(DINO_DEV(d)->dinosaur_pen), flags);
	return le32_to_cpu(v); \
}

The register value for GR24 looks to be a 16 bit value, and the value
for GR25 is the calculated value for d->base_addr + DINO_PCI_ADDR.

Dino version 3.1 (bridge mode) found at 0xf2000000
#define DINO_PCI_ADDR		0x064
#define DINO_IO_DATA		0x06c


So a couple of questions :)

1.  Is the HPMC really in the gsc_writel function and just not showing up
until the I/O port read cycle (gsc_readl function)?

2. Is the documentation correct for the resgister usage?

Thanks,

- Ryan

> grant
> 
> Grant Grundler
> parisc-linux {PCI|IOMMU|SMP} hacker
> +1.408.447.7253
> 

-- 
