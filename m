Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA29470
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Dec 2000 00:12:12 -0700
Message-Id: <200012260716.XAA21626@milano.cup.hp.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SuckyIO support 
In-reply-to: Your message of "Sun, 24 Dec 2000 09:05:04 PST."
             <20001224090504.A11676@parcelfarce.linux.theplanet.co.uk>
Date: Mon, 25 Dec 2000 23:16:24 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> On Wed, Dec 20, 2000 at 10:24:36AM -0800, Grant Grundler wrote:
...
> > xlate_pin reads the INTERRUPT_PIN and *ignores* the INTERRUPT_LINE.
...
> To my mind, we're doing this backwards.  What the current code tries to do
> is recover from a situation where the generic PCI code has been run over
> a bus which hasn't been configured by the POST -- and in the process we
> lose any work done by the quirk code.

INTERRUPT_PIN is zero for function 0 and 1. And according to PCI spec,
suckyio function 0 and 1 can't won't generate interrupts regardless
of what's in INTERRUPT_LINE.
I don't want to write/modify/support code that implies otherwise.

> What I _think_ we should be doing
> instead is doing our own run over the PCI bus first before the generic
> code gets a look at it, and sorting out the interrupt routing there.

We'll end duplicating much of what's in the generic PCI code basically.
You can understand why I might be less than enthusiastic about this idea.

> Then we can write the appropriate values into INTERRUPT_LINE, which the
> generic PCI bus scan code will pick up and the quirk code will propogate
> it into the other functions.

For function 2, the proper value (0) *is* already in INTERRUPT_LINE.
And because of the INTERRUPT_PIN behavior, I'd like to discourage
propagating config values from function 2 into other suckyio functions.

> > So some "central" code will manage IRQ routing for devices below suckyio.
...
> We can do that.  But we don't _need_ to, all these devices are capable of
> sharing one IRQ without further interrupt decoding being done.

Yeah - you might be right : Sub-devices will share one IRQ line.
Using an IRQ region only makes sense if we can read some register and
uniquely determine which device(s) generated the interrupt(s). But this
is more an implementation detail than design corner stone.

Regardless, I'd still like to see a central code determine which IRQ line
is used and advertise devices so other drivers can claim them. ie this
suckyio code would propogate the virtualized func2 dev->irq to sub-devices
and manage all three suckyio functions as one device like LASI.

thanks,
grant
