Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D1CE4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 27 Feb 2001 14:56:27 -0700 (MST)
Message-Id: <200102272158.NAA25485@milano.cup.hp.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
In-reply-to: Your message of "Tue, 27 Feb 2001 22:05:47 PST."
             <3A9C16AB.A3BBCB51@esiee.fr>
Date: Tue, 27 Feb 2001 13:58:46 -0800
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] Re: 2-way A500
List-ID: <linux-parisc.vger.kernel.org>

Thomas,

Please send full console output, lspci, and /proc/interrupt output.
I can provide pciutils binaries if you can't otherwise find/build them.

Thomas Marteau wrote:
> Hi Grant,
> 
> 	I noticed that if we put init=/bin/bash, we see this message:
> IRQ No handler for IRQ 128!

64-bit on A500?

If so, IRQ128 is IRQ0 in IRQ region 2 - ie first iosapic/PCI bus.
A device may have that line asserted for some reason.
I do expect that all drivers for boot devices have registered/claimed
the devices they should *before* init (/bin/bash) is invoked.

> It is true that in /proc/interrupts, no device is reported for this IRQ. The
> problem is that you do not have this problem with /bin/sh, afaik.

Interesting. Perhaps bash RC scripts is doing something different?
I don't see how bash or sh could otherwise generate IO interrupts.

> Also, I will appreciate if you could explain how works this file when it is a
> SMP kernel because I am a little lost :) (Everything is reported to CPU00 here!)

All IO interrupts are routed to the "monarch" (CPU 0) at the moment.
When things stabilize, I'll change the code so both processors share
the IO IRQ load.

ciao!
grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
