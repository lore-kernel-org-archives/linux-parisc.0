Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel1.hp.com (palrel1.hp.com [156.153.255.242])
	by dsl2.external.hp.com (Postfix) with ESMTP id B04BB4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Feb 2001 11:40:40 -0700 (MST)
Message-Id: <200102201843.KAA16582@milano.cup.hp.com>
To: dkennedy <dkennedy@linuxcare.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Some progress with WAX_EISA (Who knows about int errupts?) 
In-reply-to: Your message of "Tue, 20 Feb 2001 14:10:27 PST."
             <Pine.LNX.4.21.0102201409280.981-100000@localhost.localdomain>
Date: Tue, 20 Feb 2001 10:43:24 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

dkennedy wrote:
> ISA device drivers use inb and outb.  Isn't it possible to provide a ISA
> specific inb/outb macro that does the appropriate translation?

PITA. One has to make sure it (a) works together with definitions
in pci.h and (b) doesn't collide with definitions in pci.h.
Drivers which support devices on multiple busses (eg serial)
may not like it.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
