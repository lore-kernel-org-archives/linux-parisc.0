Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7900A482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 18:03:34 -0600 (MDT)
Message-Id: <200104032357.RAA18650@puffin.external.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] request_region() 
In-Reply-To: Your message of "Tue, 03 Apr 2001 10:05:02 BST."
             <20010403100502.K9198@linuxcare.com>
Date: Tue, 03 Apr 2001 17:57:22 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> Yep, that make sense.  Does mean sim700.c will have to make runtime
> decisions whether to use raw_read (for the on-board 53c700) or inb
> (for one on an EISA card), on my 715, but that is no big deal.

Someone (willy or prumpf?) told me Linus (and/or perhaps others)
have rejected such "automagic" redirection of IO space access functions.
IIRC, the reason was complexity and extra CPU cycles.
But it seems any multibus driver ends up doing it on its own anyway.

I was thinking perhaps the sim700 driver could be compiled
*twice* to produce two binaries from the same source. One flavor
to access devices which use MMIO and the other flavor would claim
devices which only use IO port space. Thoughts?

> EISA allocates 0x1000 bytes per slot, with a four (?) byte signature
> at offset 0xc80 (IIRC) to identify the cards.  At least, that is
> how my old Compaq works, with first slot at 0x1000.  Seems to tie
> up address-wise, at least:
> 
> 10. Scorpio Sr. EISA BA (11) at 0xfc000000, versions 0x19, 0x0, 0x76, 0x0, 0x
>   0
> 11. Unknown device (10) at 0xfc001000, versions 0x0, 0x0, 0xfff, 0x0, 0x0

Interesting the SCSI device is reported at 0xfc... address.
If that's an IO port space address, it would be nice if the
EISA bus code could mask off the upper 16 bits so the drivers only
see "0x1000". (HBA # is 0 unless more than one EISA BA needs to be
supported).

> Again, IIRC, last time I played with the EISA slot on my 715 I
> found the EISA 53c700 couldn't access main memory, and EISA interrupts
> were not routed to the CPU.  The driver could access the chip registers
> though.  But that was all a long time ago, so things may be different
> now.

EISA 53c700 should be able to access main memory but I don't think
the interrupt routing stuff has been resolved yet. Poke Alex DeVries
some more.  :^)

later,
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
