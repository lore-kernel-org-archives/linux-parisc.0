Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA16513
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Dec 2000 19:52:53 -0700
Message-Id: <200012200256.SAA16519@milano.cup.hp.com>
To: Alex deVries <adevries@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support 
In-reply-to: Your message of "Tue, 19 Dec 2000 10:46:40 PST."
             <3A3F82E0.C0FB63D6@linuxcare.com>
Date: Tue, 19 Dec 2000 18:56:32 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
...
> I've taken mkp's initial work on superio.c and added some stuff, but in
> the end am confused by where we actually get the interrupt number from
> the card.  There's no such register in function 1 (where the interrupts
> ultimately end up) and both registers on function 0 and 2 return 0,
> which I don't think is right.

Why are you reading this out of a register? Which register?

IIRC, function 0 and 2 *should* return 0 in INTERRUPT_PIN configuration
register and thus the INTERRUPT_LINE configuration as well.
But since IOSAPIC driver (when invoked by LBA PCI code) munges the
INTERRUPT_LINE contents and puts the virtualized IRQ number in 
dev->irq for the drivers consumption, superio driver should
not be reading these configuration registers.

> I'd thought that PDC would have set this up.

PDC should only sets up the PCI INTERRUPT_LINE config register values
to indicate which IOSAPIC input *line* they are using. parisc-linux has
to map this value to an IRQ region and virtualize the dev->irq value.

> There's not much I can do at this point until we can have some of
> Grant's attention.

If what I wrote above doesn't make any sense, tell me where to
to find the code you are talking about and I can look at it.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
