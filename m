Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA24316
	for <parisc-linux@puffin.external.hp.com>; Mon, 6 Dec 1999 13:55:03 -0700
Date: Mon, 6 Dec 1999 19:34:47 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] txn_alloc_irq() change
Message-Id: <19991206193447.B21512@mathe.stud.uni-erlangen.de>
References: <199912060631.WAA16626@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199912060631.WAA16626@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> I was working through Message Signalled Interrupt (aka TBIs) allocation
> and realized our current txn_alloc_irq() implementation needs to accepted
> at least one parameter. The parameter would indicate a (one of two)
> capability of the caller's device. Returning a negative irq indicates
> the host can't support the device because the host doesn't have a
> compatible resource.

The original plan was to hide txn_alloc_irq (which I still think is a bad
name as no-one is going to remember it) in bus-specific wrappers --
gsc_alloc_irq is one, though the Dino driver does not use it currently.

So this doesn't even affect "well-written" drivers.  Changing txn_alloc_irq
isn't exactly high-priority as all systems that use <= 31 interrupt-generating
devices (which I guess are the systems we're currently working with) should
work just fine right now.

>         /* enable_irq() will use txn_* to program IRdT (PAT only) */
>         vi->vi_txn_addr = txn_alloc_addr(vi->vi_txn_irq);
>         vi->vi_txn_data = txn_alloc_data(vi->vi_txn_irq);

txn_alloc_{addr,data} are confusing names as those functions don't actually
allocate anything.

> In addition, I would like folks to tell me if we should add a second
> parameter to indicate how "wide" the "txn_addr" can be. I had assumed
> the width of a host processor pointer address but cards may not support
> enough bits (ie 32-bit card won't work on system which wants 40-bit or
> 44-bit physical addr). AFAIK PA-Risc systems have processors aliased to
> below 4GB physical address and thus it won't be an issue for our port.
> But other architectures do support MSI and it seems easy to avoid
> nasty surprizes later.

This, again, depends on the bus.  For PCI, either your card supports dual
address cycles and you can use 64 bits, or it doesn't, in which case your
system needs to alias everything below 4 GB anyway.

	Philipp Rumpf
