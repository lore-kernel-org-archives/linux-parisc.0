Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA24385
	for <parisc-linux@puffin.external.hp.com>; Mon, 4 Oct 1999 09:52:38 -0600
Sender: adevries@thepuffingroup.com
Message-ID: <37F8D058.3B46449E@thepuffingroup.com>
Date: Mon, 04 Oct 1999 12:05:44 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
CC: parisc-linux@thepuffingroup.com, grundler@milano.cup.hp.com
Subject: Re: [parisc-linux] Dino developments...
References: <199910040445.VAA15000@milano.cup.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Grant Grundler wrote:
> Alex deVries wrote:
> > I've fixed up a couple of things in the kernel:
> > - PCI bus walking happens in the *right place*, pci_init().
> 
> Ok. Were you able to salvage what I had submitted then?
> I was under the impression pci_init() wouldn't work. Registration of
> the pci_bus_ops for each Dino looked like a problem.

Yeah, I definitely re-used a lot of existing work. I got pci_init() to
work properly.

> Oh. I think I got it.  Each dino registers pci_bus_ops when it's
> "discovered" and pci_init() is called later...is that right?

Yeah, although if I understand the kernel code properly, the first PCI
bus scan is done from within pci_init().  All the others are called when
the others are detected.  Right now the dino_init() call is in the wrong
place.

> I'll start reviewing card-mode Dino initialization and see what we can
> do for MMIO. I have to understand more about what the "right" thing for
> linux is WRT I/O address management. This has to take place sometime
> between when card-mode Dino is "discovered" and when PCI bus walk completes.
> (So we know how much space is needed.)

Can we gather a memory IO map based on what we find in the inventory
code with the mem_map() PDC calls?

> What about interrupts?
> Is alloc_irq() handing virtual IRQ's back to the PCI drivers for the
> respective dino irq_region?
> I'm curios if/how it is supposed to work and might take a peek at this
> as well. Once this works, the box should be able to send mail - that's
> a key milestone for HP folks..

I really havent' looked at interrupts at all yet in PCI, so please, have
a look at it.

About sending mail: that'd require actually running a userland program
(unless you want to embed something like elm or emacs into the kernel),
and I'm not sure how close we are to that.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
