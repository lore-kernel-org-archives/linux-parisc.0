Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA12229
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Feb 2000 11:23:37 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel2.hp.com (Postfix) with ESMTP id 12CB767C
	for <parisc-linux@thepuffingroup.com>; Tue, 15 Feb 2000 12:24:13 -0500 (EST)
Message-Id: <200002151725.JAA05629@milano.cup.hp.com>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Linux syscall ABI 
In-reply-to: Your message of "Mon, 14 Feb 2000 22:36:39 PST."
             <200002150536.WAA04580@udlkern.fc.hp.com>
Date: Tue, 15 Feb 2000 09:25:12 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

John Marvin wrote:
...
> > Of course every page in the region 0xfffc0000 - 0x3f fffc (it's a 17-bit
> > signed immediate shifted left 2 bits, so that should be -2^18 - 2^18-4)
> > can be used, so we just need a page within the first 256 KB.
>  
> This is true for user space. For kernel space, I don't think we can
> use anything in F space, unless we map the real IO addresses somewhere
> else in virtual space. I'm not sure what assumptions are being made
> right now regarding that mapping in the drivers.

Drivers don't map anything. The assumption for GSC/PCI drivers is the
address given will work with readl/writel (or inb/outb) routines.

For GSC, the HPA is in the struct hp_device->hpa field and readl/writel
are aliases for gsc_readl/gsc_writel.

For PCI devices the base address is in struct pci_device ->resources[].
The PCI drivers know to use MMIO or I/O port space for their device
(often based on #define flags).  And again readl/writel alias to
gsc_readl/gsc_writel for MMIO. inl/outl are defined to be an indirect
function call to either Dino or "lba" PCI services (similar to
how pci_config_read is an indirect call).

gsc_readl/writel take a physical address as the address parameter.
I would like to get away from gsc_read for one simple reason: HPMC.
If a driver incorrectly accesses something which isn't supposed to
we get either an HPMC or undefined behavior. Most likely the HPMC.
If the read/write routines referenced a virtual address, we have
much better chances of getting a data page fault and some decent
debugging information to track down the problem.

This is #2 on my TODO list after reviewing the coherent DMA services
recently introduced in 2.3.

grant

Grant Grundler
Unix Development Lab
+1.408.447.7253
