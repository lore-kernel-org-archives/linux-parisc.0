Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA27127
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Dec 2000 10:27:20 -0700
Message-Id: <200012201731.JAA17254@milano.cup.hp.com>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: adevries@linuxcare.com (Alex deVries),
        grundler@cup.hp.com (Grant Grundler), parisc-linux@thepuffingroup.com,
        grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] SuckyIO support 
In-reply-to: Your message of "Wed, 20 Dec 2000 13:05:38 PST."
             <E148iw9-0001Vc-00@the-village.bc.nu>
Date: Wed, 20 Dec 2000 09:30:30 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Let me elaborate a bit on Alan's terse explanation.

Alan Cox wrote:
> INTERRUPT_PIN is pre-PCI plumbing view of the interrupt

PIN is the *output* signal used by the PCI device. Each PCI device
is defined to use none, or one of four available INT signals (A-D).
PIN is hardwired value to indicate which it is.

> INTERRUPT_LINE is sort of the PCI view of the interrupt at best

LINE is initialized by BIOS or platform knowledgable code.
LINE is the *input* signal to an interrupt controller.
The routing of Interrupt Lines is *platform dependent* and is
generally different for each PCI device.
ie INT-A for one device != INT-A for another

> pci_dev->irq is the Linux view post all the plumbing and host goo

In our case, it's the IRQ region plus IRQ offset right now.
I've proposed another IRQ scheme which would replace the math with
a lookup table. But we haven't done anything with it yet since
the region+offset is "good enough" for now.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
