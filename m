Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E98E24829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 Jan 2003 06:10:44 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18VAY1-0004Y6-00; Sun, 05 Jan 2003 13:10:37 +0000
Date: Sun, 5 Jan 2003 13:10:37 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Peter 'p2' De Schrijver <p2@mind.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Matrox Millenium II in C240
Message-ID: <20030105131037.E19239@parcelfarce.linux.theplanet.co.uk>
References: <20030102123856.GD871@portablue.intern.mind.be> <20030103051715.GA14565@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030103051715.GA14565@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Thu, Jan 02, 2003 at 10:17:15PM -0700
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, Jan 02, 2003 at 10:17:15PM -0700, Grant Grundler wrote:
> Does it? are the 64-bit slots 3.3v only?

Yep.  Thought that was part of the PCI spec, though maybe I'm confused with
66MHz.

> > Has anyone before succeeded in accessing mmio space of PCI
> > card attached to the 32bit PCI bus of the C240 ?
> 
> SCSI is accessed that way. tulip driver can be tweaked to use MMIO
> if you don't have any 100BT GSC (card-mode Dino) cards.

umm.. I thought cardmode MMIO was working now on B/C/J class machines.
I think D/K/R still have resource management issues.

> > 00:01.0 VGA compatible controller: Matrox Graphics, Inc. MGA 2164W [Millennium II] (prog-if 00 [VGA])
> > 	Subsystem: Matrox Graphics, Inc.: Unknown device 2003
> > 	Flags: medium devsel, IRQ 97
> > 	Memory at f9000000 (32-bit, prefetchable) [size=16M]
> > 	Memory at f3ffc000 (32-bit, non-prefetchable) [size=16K]
> > 	Memory at f2800000 (32-bit, non-prefetchable) [size=8M]
> > 	Expansion ROM at f3f80000 [disabled] [size=64K]
> 
> Looks like PDC/IODC did it's thing.
> Look at matrox drivers to make sure they are calling
> "pci_device_enable()" and ioremap() before attempting to access
> the device.
> 
> Check /proc/iomem to see which PCI bus controller
> this is getting routed through and that the system
> has correctly identified the MMIO resources.
> 
> It's interesting one device has MMIO at both 0xf2800000
> and 0xf9000000 since it would imply one PCI controller is supposed
> to forward the entire range of addresses. But Dino only forwards
> (any number of) 8MB chunks between 0xf0800000 and 0xff800000 (except
> the first and last 8MB chunks).

I think this may well be the problem.  I bet Dino hasn't been programmed
to forward the 16MB range at f900'0000, and Linux has just found an
unused bit of address space and allocated it to the Matrox card.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
