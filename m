Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA21276
	for <parisc-linux@puffin.external.hp.com>; Sun, 3 Oct 1999 22:46:12 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel2.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id AAA19912
	for <parisc-linux@thepuffingroup.com>; Mon, 4 Oct 1999 00:45:58 -0400 (EDT)
Message-Id: <199910040445.VAA15000@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com, grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] Dino developments... 
In-reply-to: Your message of "Sun, 03 Oct 1999 19:29:19 PDT."
             <37F7E6CF.F781614F@thepuffingroup.com>
Date: Sun, 03 Oct 1999 21:45:50 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Alex - this is really cool.

Alex deVries wrote:
> 
> 
> I've fixed up a couple of things in the kernel:
> 
> - PCI bus walking happens in the *right place*, pci_init().

Ok. Were you able to salvage what I had submitted then?
I was under the impression pci_init() wouldn't work. Registration of
the pci_bus_ops for each Dino looked like a problem.

Oh. I think I got it.  Each dino registers pci_bus_ops when it's
"discovered" and pci_init() is called later...is that right?
(I'll be looking at the code anyway...may not have to answer)

> - I've fixed the inventory code to handle hversion_rev and sversion_rev
> - Multiple Dinos are detected properly now
> - Card Mode Dino now seems to work for bus walking, the MMIO is a whole
> different story.

I'll start reviewing card-mode Dino initialization and see what we can
do for MMIO. I have to understand more about what the "right" thing for
linux is WRT I/O address management. This has to take place sometime
between when card-mode Dino is "discovered" and when PCI bus walk completes.
(So we know how much space is needed.)

What about interrupts?
Is alloc_irq() handing virtual IRQ's back to the PCI drivers for the
respective dino irq_region?
I'm curios if/how it is supposed to work and might take a peek at this
as well. Once this works, the box should be able to send mail - that's
a key milestone for HP folks..

cheers,
grant

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253
