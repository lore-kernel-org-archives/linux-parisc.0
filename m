Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA28062
	for <parisc-linux@puffin.external.hp.com>; Wed, 20 Dec 2000 11:20:57 -0700
Message-Id: <200012201824.KAA17332@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support 
In-reply-to: Your message of "Wed, 20 Dec 2000 15:50:45 PST."
             <20001220155045.A19376@parcelfarce.linux.theplanet.co.uk>
Date: Wed, 20 Dec 2000 10:24:36 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> That's OK, at least for the code I wrote, the quirk code is called in the
> right place (ie before the iosapic code gets its hands on it) that if it can
> find the right value and poke it back into dev->irq, the iosapic virtualising
> code will deal with it correctly.

It won't. I just checked. :^(

lba_fixup_bus() invokes iosapic_fixup_irq() for each PCI device.
iosapic_fixup_irq() invokes iosapic_xlate_pin() to locate both the
INTERRUPT_LINE and parent IOSAPIC. xlate_pin reads the INTERRUPT_PIN
and *ignores* the INTERRUPT_LINE. This behavior has to remain in order
to support PAT PDC platforms (which do not initialize the PCI device).

I doubt we can use pci_quirks to fixup the dev->irq.
I've proposed to Alex to use a "bus devices" scheme (a' la LASI).
So some "central" code will manage IRQ routing for devices below suckyio.
I.e. suckyio will have it's own IRQ region and collectively manage
all three PCI functions as "one device".

This would be the first case in parisc-linux where we "stack" three
IRQ regions on top of each other: driver->suckyio->iosapic->CPU

glad I could help,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
