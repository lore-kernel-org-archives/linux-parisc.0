Received: from rhirst.linuxcare.com (sleepie.demon.co.uk [194.222.23.208])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id CAA19658
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Nov 2000 02:58:56 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6DEEFB007; Wed, 15 Nov 2000 09:58:35 +0000 (GMT)
Date: Wed, 15 Nov 2000 09:58:35 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>, Helge Deller <deller@gmx.de>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] dino maintainer?
Message-ID: <20001115095835.I32715@linuxcare.com>
References: <20001114101704.Y32715@linuxcare.com> <200011141610.IAA11646@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200011141610.IAA11646@milano.cup.hp.com>; from grundler@cup.hp.com on Tue, Nov 14, 2000 at 08:10:42AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Nov 14, 2000 at 08:10:42AM -0800, Grant Grundler wrote:
> The bug is normal for card-mode Dino - not for Built-in Dino.
> I think Helge has the GSC 100BT card which is a card-mode Dino on-board
> with one (or two) Tulip(s) behind it.
> 
> The warning is a reminder one can NOT use MMIO accesses to those
> PCI devices and *only* I/O Port space (eg inb/outb).
> 
> If someone wants to fix the warning so it's quiet for card-mode
> devices...see is_card_dino(d) in dino_driver_callback() for an
> example.
> 
> FYI - card-mode dino was used for several different networking
> interfaces but not SCSI interfaces.

But Helge has problems with the sym53c8xx driver on a B160L.  Is
that a PCI card driven via Dino?  And if so, are you saying he needs
to build his kernel with CONFIG_SCSI_NCR53C8XX_IOMAPPED=y so it
doesn't try to use MMIO?

Helge, it might be worth trying to switch on CONFIG_SCSI_NCR53C8XX_IOMAPPED
anyway just to see what happens.  Otherwise someone needs to start
adding printk debug to figure out what is happening.  I can't do
that as I don't have a sym53c8xx pci card.

Richard
