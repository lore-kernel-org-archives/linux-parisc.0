From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Re: [PATCH] PCMCIA: Disable probing on parisc
Date: Mon, 12 Dec 2005 08:45:08 -0600
Message-ID: <1134398708.9994.3.camel@mulgrave>
References: <20051204060423.GA12355@quicksilver.road.mcmartin.ca>
	<200512111955.09892.deller@gmx.de> <1134333477.3367.16.camel@mulgrave>
	<200512112335.03032.deller@gmx.de>
	<20051212073003.GA15901@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Russell King <rmk+pcmcia@arm.linux.org.uk>,
 parisc-linux@lists.parisc-linux.org,
 linux-pcmcia@lists.infradead.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051212073003.GA15901@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2005-12-12 at 00:30 -0700, Grant Grundler wrote:
> Before I propose the quirk to linux-pci, I need to know the scope of the
> problem. Is this a problem only for that PCI slot on that box, for any
> slot under dino, any PARISC PCI, or any PCI platform?

Actually, that's the problem.  This device is a built in PCI<->PCMCIA
bridge in the tadpole.  I'm the one with the PCI<->PCMCIA card, and that
doesn't need this quirk.  So, as far as we know (until someone tries
other PCI<->PCMCIA cards) this is the only quirk needed.

So perhaps we should do it in dino_fixup_bus() instead.

James


> For starters, can someone test this on same card on a C3000 or A500?
> Both of those use a routing table instead of magic values in PCI device
> config registers.
> 
> # lspci -vs 00:02.0
> 0000:00:02.0 CardBus bridge: Cirrus Logic PD 6832 PCMCIA/CardBus Ctrlr (rev c1)
> 	Flags: bus master, medium devsel, latency 168, IRQ 25
> 	Memory at f0800000 (32-bit, non-prefetchable) [size=4K]
> 	Bus: primary=00, secondary=01, subordinate=04, sec-latency=176
> 	Memory window 0: f0c00000-f0fff000
> 	Memory window 1: f0900000-f09ff000
> 	I/O window 0: 00000400-000005ff
> 	I/O window 1: 00000800-000009ff
> 	16-bit legacy interface ports at 0001
> 
> >  "or our algorithm for routing IRQ_PIN to INTERRUPT_LINE routing is broken."
> 
> Right now, I can't convinced myself this is a PDC bug on platforms
> with built-in Dino.  PDC fills in PCI_INTERRUPT_LINE (becomes pci_dev->irq)
> value with the DINO input Interrupt Line (ie index into dino->global_irq[]).
> This is used by dino code instead of a "Routing Table".
> 
> Other parisc boxes and most architectures use some form of
> "IRQ Line Routing Table" to communicate PCI device IRQ_PIN output
> to Interrupt Controller input lines mappings to the OS.
> 
> But other PCI LAN and SCSI cards work fine under built-in Dino AFAIK.
> That's why I'm not sure about the scope of the problem.
> 
> > Based on that I just created the attached patch.
> > With it pcmcia now works for me.
> 
> Yeah, the patch looks fine to me.
> I'd just like confirmation that C3000 has the same problem before
> I forget how all this works again.
> 
> If it doesn't, then we need to figure out how to make this
> a dino specific "quirk".
> 
> > Maybe you have an idea if something in dino is wrong ?
> 
> I don't think there is anything wrong with dino.
> Otherwise other cards wouldn't work right either.
> 
> thanks,
> grant
> 
> > 
> > Helge
> > 
> > dmesg:
> > PCI: Cirrus Cardbus IRQ fixup for 0000:00:02.0, from 25 to 24 (old native irq=2)
> > Yenta: CardBus bridge found at 0000:00:02.0 [0000:0000]
> > PCI: Bus 1, cardbus bridge: 0000:00:02.0
> >   IO window: 00000400-000005ff
> >   IO window: 00000800-000009ff
> >   PREFETCH window: f0c00000-f0ffffff
> >   MEM window: f0900000-f09fffff
> > Yenta: ISA IRQ mask 0x0000, PCI irq 24
> > Socket status: 30000007
> > pcmcia: parent PCI bridge I/O window: 0x0 - 0xffff
> > pcmcia: parent PCI bridge Memory window: 0xf0800000 - 0xf0ffffff
> > PCI: Cirrus Cardbus IRQ fixup for 0000:00:02.1, from 26 to 25 (old native irq=3)
> > Yenta: CardBus bridge found at 0000:00:02.1 [0000:0000]
> > PCI: Bus 5, cardbus bridge: 0000:00:02.1
> >   IO window: 00000c00-00000dff
> >   IO window: 00001000-000011ff
> >   PREFETCH window: f0a00000-f0afffff
> >   MEM window: f0b00000-f0bfffff
> > Yenta: ISA IRQ mask 0x0000, PCI irq 25
> > Socket status: 30000007
> > pcmcia: parent PCI bridge I/O window: 0x0 - 0xffff
> > pcmcia: parent PCI bridge Memory window: 0xf0800000 - 0xf0ffffff
> > ds: ds_open(socket 0)
> 
> > Index: quirks.c
> > ===================================================================
> > RCS file: /var/cvs/linux-2.6/drivers/pci/quirks.c,v
> > retrieving revision 1.35
> > diff -u -p -r1.35 quirks.c
> > --- quirks.c	12 Nov 2005 04:08:03 -0000	1.35
> > +++ quirks.c	11 Dec 2005 22:22:58 -0000
> > @@ -862,6 +862,28 @@ static void __init quirk_eisa_bridge(str
> >  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL,	PCI_DEVICE_ID_INTEL_82375,	quirk_eisa_bridge );
> >  
> >  /*
> > + * Cirrus 6832 Cardbus reports wrong irq on RDI Tadpole PARISC Laptop.
> > + */
> > +#if defined(CONFIG_PARISC)
> > +static void __devinit quirk_hp_cardbus(struct pci_dev *dev)
> > +{
> > +        u8 irq, new_irq;
> > +
> > +	new_irq = dev->irq - 1;
> > +        pci_read_config_byte(dev, PCI_INTERRUPT_LINE, &irq);
> > +
> > +	printk(KERN_ERR "PCI: Cirrus Cardbus IRQ fixup for %s, from %d to %d (old native irq=%d)\n",
> > +                        pci_name(dev), dev->irq, new_irq, irq);
> > +	dev->irq = new_irq;
> > +
> > +	udelay(15);     /* unknown if delay really needed */
> > +	pci_write_config_byte(dev, PCI_INTERRUPT_LINE, new_irq);
> > +
> > +}
> > +DECLARE_PCI_FIXUP_ENABLE(PCI_VENDOR_ID_CIRRUS,	PCI_DEVICE_ID_CIRRUS_6832,	quirk_hp_cardbus );
> > +#endif
> > +
> > +/*
> >   * On ASUS P4B boards, the SMBus PCI Device within the ICH2/4 southbridge
> >   * is not activated. The myth is that Asus said that they do not want the
> >   * users to be irritated by just another PCI Device in the Win98 device

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
