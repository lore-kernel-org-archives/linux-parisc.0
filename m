Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA04278
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Sep 1999 02:38:22 -0600
Received: from Galois.suse.de (Galois.suse.de [194.112.123.130])
	by Cantor.suse.de (Postfix) with ESMTP id 995AC32CEF
	for <parisc-linux@thepuffingroup.com>; Thu, 02 Sep 1999 10:40:08 +0200 (MEST)
Received: from Wotan.suse.de (Wotan.suse.de [10.10.0.1])
	by Galois.suse.de (Postfix) with ESMTP id 4A8ED67A9
	for <parisc-linux@thepuffingroup.com>; Thu,  2 Sep 1999 10:40:08 +0200 (MEST)
Date: Thu, 2 Sep 1999 10:40:07 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux-cvs] grundler
Message-ID: <19990902104007.H629@suse.de>
References: <199909012302.RAA04035@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909012302.RAA04035@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Wed, Sep 01, 1999 at 05:02:23PM -0600
List-ID: <linux-parisc.vger.kernel.org>

> Update of /home/cvs/parisc/linux/include/asm-parisc
> In directory puffin.external.hp.com:/tmp/cvs-serv4014/linux/include/asm-parisc
> 
> Modified Files:
> 	pci.h 
> Log Message:

> Update GSCtoPCI (Dino) bus adapter support. Have most of the design
> in place and what's my "first cut" implementation.

I don't want to sound aggressive, but I really do not see the point in most
of your changes.

Let's go through them:

 - renamed pci_{port,config,bus}_ops to {port,config,bus}_ops.

waste of struct namespace should asm/pci.h be included accidentally
(furthermore it strikes me as strange to have pci_bios_ops, but simply bus_ops.

 - typedef unsigned int irq_t;

the type of irqs is defined to be int (not unsigned int) in ABIs we cannot
change if we ever want to see a merged parisc kernel.

 - renamed PCI_NUM_BUS to MAX_BUSSES.

I think we really should restrict ourselves to exporting symbols, macros and
other names starting with PCI_ and pci_.  (I am aware this may be because it
took me way too long to synch the trees and that this just reflects the rest
of your code).

> Marked lots of stuff with "TODO" - I'll keep whacking at these.

 - "** TODO: I don't think we need the "bus" parameter. "dev""

ignoring your comment style ;), it really strikes me as a good idea to keep
the interface in place to support native-to-PCI bridges with more than one
bus on them.  It might be a good idea for those not to pass the "relative"
bus number to those instead of the absolute one, but that is just a change
in one spot as opposed to changing an interface and digging through several
drivers.

> Main issues to still be resolved are:
> o GSC device claim - how does dino driver learn about GSC devices

For that we need Alex's code, but it looks very much like we will have a list
of GSC devices like we currently have for PCI on systems where that is the
native bus.  Then, you will use gsc_find_device(u16 hversion); and be happy.

> o Registration and handling of interrupts (request_irq() support)

None.  The current idea is dino.c registers a region of 32 "virtual" IRQs (i.e.
Linux IRQ cookies, not EIRR bits) and uses do_irq_mask to handle them.  Also,
pcibios_fixup will put the right irq cookie numbers in the pci_devices list.

> o How drivers will use I/O port space accessor functions.
>   (assumes we won't change them to use MMIO space)

basically,

u8 inb(u32 address) {
	return pci_ops[(address>>16)].port.inb(
		pci_devs[(address>>16],
		(u8) (address>>16) / pci_rel_bus[(address>>16)],
		(u16) adress);
}

that looks slow but I hope for the "port accesses are slow anyway" argument
to win.

	Philipp Rumpf
