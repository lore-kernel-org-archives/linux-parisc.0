Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA17657
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Dec 1999 23:26:36 -0700
Received: from milano.cup.hp.com (grundler@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id WAA14174
	for <parisc-linux@thepuffingroup.com>; Sun, 5 Dec 1999 22:28:35 -0800 (PST)
Date: Sun, 5 Dec 1999 22:31:16 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199912060631.WAA16626@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] txn_alloc_irq() change
List-ID: <linux-parisc.vger.kernel.org>

Hi parisc devotees,
I was working through Message Signalled Interrupt (aka TBIs) allocation
and realized our current txn_alloc_irq() implementation needs to accepted
at least one parameter. The parameter would indicate a (one of two)
capability of the caller's device. Returning a negative irq indicates
the host can't support the device because the host doesn't have a
compatible resource.

Here's the comment I added:
        /* Allocate processor IRQ
        ** The alloc_irq needs to accept a parameter to indicate how many
	** bits the irq data is restricted to use. This is a HW limitation
	** of the various consumers of Message Signalled Interrupts:
        ** Legacy PA I/O (GSC/NIO): 5 bits (architected EIM register)
        ** V-class (EPIC):          6 bits
	** N/L/...-class:           8 bits
        ** PCI 2.2 MSI:             16 bits (I think)
	** Existing PCI devices:    32-bits (NCR c720/ATM/GigE/HyperFabric)
        **
	** On the service provider side:
	** o PA 1.1 (and PA2.0 narrow mode)	5-bits (width of EIR register)
	** o PA 2.0 wide mode			6-bits
	** o other architectures?
	**
	** So a Legacy PA I/O device on a PA 2.0 box can't use all
	** the bits supported by the processor...and the N/L-class
	** I/O subsystem supports more bits than PA2.0 has. The first
	** case is the problem.
        */
        vi->vi_txn_irq = txn_alloc_irq(8);      /* number of bits */

        if (vi->vi_txn_irq < 0)
                panic("couldn't get TXN IRQ\n");

        /* enable_irq() will use txn_* to program IRdT (PAT only) */
        vi->vi_txn_addr = txn_alloc_addr(vi->vi_txn_irq);
        vi->vi_txn_data = txn_alloc_data(vi->vi_txn_irq);
	ASSERT(vi->vi_txn_data < 256);	/* matches 8 above */
...


In addition, I would like folks to tell me if we should add a second
parameter to indicate how "wide" the "txn_addr" can be. I had assumed
the width of a host processor pointer address but cards may not support
enough bits (ie 32-bit card won't work on system which wants 40-bit or
44-bit physical addr). AFAIK PA-Risc systems have processors aliased to
below 4GB physical address and thus it won't be an issue for our port.
But other architectures do support MSI and it seems easy to avoid
nasty surprizes later.

Thoughts?

thanks,
grant

ps. This module is mostly written (still a few compile problems) but
    won't be published until after the IA64-linux gets published.
    Sorry about that...
