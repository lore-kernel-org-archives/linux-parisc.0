Received: from cosrel1.hp.com (cosrel1.hp.com [156.153.255.170])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA28784
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 09:10:01 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by cosrel1.hp.com (Postfix) with ESMTP id 19B1B2C7
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 09:12:20 -0700 (MST)
Message-Id: <200011141610.IAA11646@milano.cup.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@puffin.external.hp.com
In-reply-to: Your message of "Tue, 14 Nov 2000 10:17:04 PST."
             <20001114101704.Y32715@linuxcare.com>
Date: Tue, 14 Nov 2000 08:10:42 -0800
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] dino maintainer?
List-ID: <linux-parisc.vger.kernel.org>


Anyone interested in maintaining Dino?

I don't have time for it and all the docs are on the web.
One of the "TODO" things is to convert dino.c to use struct
pci_hba the same way lba_pci.c does....

Richard Hirst wrote:
...
> Thanks.  I agree it doesn't look like the driver is even seeing the
> chip; I wonder if PCI support is broken...
> 
> > dino_bridge_init: IO_ADDR_EN hasn't been configured.
> > kernel BUG at dino.c:646!
> 
> Does it usually say that on bootup?

per Helge's request:

The bug is normal for card-mode Dino - not for Built-in Dino.
I think Helge has the GSC 100BT card which is a card-mode Dino on-board
with one (or two) Tulip(s) behind it.

The warning is a reminder one can NOT use MMIO accesses to those
PCI devices and *only* I/O Port space (eg inb/outb).

If someone wants to fix the warning so it's quiet for card-mode
devices...see is_card_dino(d) in dino_driver_callback() for an
example.

FYI - card-mode dino was used for several different networking
interfaces but not SCSI interfaces.

hope this helps,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
