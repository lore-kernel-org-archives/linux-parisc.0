Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA26843
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 09:05:45 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by atlrel1.hp.com (Postfix) with ESMTP id 0CC0125CB
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 11:07:50 -0500 (EST)
Message-Id: <200011151606.IAA13228@milano.cup.hp.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Helge Deller <deller@gmx.de>, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] dino maintainer? 
In-reply-to: Your message of "Wed, 15 Nov 2000 09:58:35 PST."
             <20001115095835.I32715@linuxcare.com>
Date: Wed, 15 Nov 2000 08:06:32 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Richard Hirst wrote:
> On Tue, Nov 14, 2000 at 08:10:42AM -0800, Grant Grundler wrote:
> > The bug is normal for card-mode Dino - not for Built-in Dino.
> > I think Helge has the GSC 100BT card which is a card-mode Dino on-board
> > with one (or two) Tulip(s) behind it.

Helge confirmed he has no such card.
I think the PDC simply isn't programming the Dino IO_ADDR_EN
since there are no PCI devices in his B160.

Helge's B160 has a old rev of Dino PCI host bus adapter chip.
It's possible to have "silent" data corruption caused by older
revs of dino - 3.0 and older.
The latest PDC Revisions (5.x and later) know this and won't permit
the system to be booted unless the only devices on the PCI bus are
known graphics interface cards.

> > The warning is a reminder one can NOT use MMIO accesses to those
> > PCI devices and *only* I/O Port space (eg inb/outb).
> > 
> > If someone wants to fix the warning so it's quiet for card-mode
> > devices...see is_card_dino(d) in dino_driver_callback() for an
> > example.

This is still correct for card-mode dino.

> > FYI - card-mode dino was used for several different networking
> > interfaces but not SCSI interfaces.
> 
> But Helge has problems with the sym53c8xx driver on a B160L.  Is
> that a PCI card driven via Dino? 

I doubt it now. If Helge could send richard "in io" output, I think
that would clarify what's in the B160.

> And if so, are you saying he needs
> to build his kernel with CONFIG_SCSI_NCR53C8XX_IOMAPPED=y so it
> doesn't try to use MMIO?

no. no SCSI was ever implement on a card-mode dino board.
No reason to since they already had Zalon or open slots.

grant

> Helge, it might be worth trying to switch on CONFIG_SCSI_NCR53C8XX_IOMAPPED
> anyway just to see what happens.  Otherwise someone needs to start
> adding printk debug to figure out what is happening.  I can't do
> that as I don't have a sym53c8xx pci card.
> 
> Richard
