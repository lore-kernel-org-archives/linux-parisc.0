Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 813ED4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 27 Feb 2001 22:19:20 -0700 (MST)
Message-Id: <200102280522.VAA25961@milano.cup.hp.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: 2-way A500 
In-reply-to: Your message of "Wed, 28 Feb 2001 00:49:45 PST."
             <3A9C3D19.2128CB74@esiee.fr>
Date: Tue, 27 Feb 2001 21:22:11 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Thomas Marteau wrote:
> Here is /proc/interrupts but I need some help here
...
> As we see, everything is attached to PA-CPU-00!

Yes. That's expected behavior (for now). I wrote:
> > All IO interrupts are routed to the "monarch" (CPU 0) at the moment.
> > When things stabilize, I'll change the code so both processors share
> > the IO IRQ load.

that can probably happen pretty soon now. Next week or two.

...
> Linux Tulip driver version 0.9.13 (January 2, 2001)
> PCIBIOS: Enabling device 00:00.0 (0140 -> 0143)
> PCIBIOS: Setting latency timer of 00:00.0 to 128
> eth0: Digital DS21143 Tulip rev 65 at 0x80, 00:30:6E:06:15:E3, IRQ 128.
> eth0:  MII transceiver #1 config 1000 status 782d advertising 0061.
> eth0:  Advertising 01e1 on PHY 1, previously advertising 0061.
> eth0:  Advertising 01e1 (to advertise is 01e1).

eth0 knows it's using IRQ 128.  That's from pci_dev->irq.

Tulip driver does *not* call request_irq() to register it's IRQ handler
until the eth0 device is open()'d. That's why it doesn't show up in
/proc/interrupts.  The IRQ is probably not getting handled because
the RC scripts aren't getting invoked that would ifconfig the port.
But I don't know how/why tulip generates the interrupt.

I also didn't see the "official" msg in this console output:
> Here is the official message
> IRQ: CPU:0 No handler for IRQ 128 !

Where in the output does that msg normally appear?
Depending on where it appears, I might call it a tulip driver bug.

thanks,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
