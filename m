Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA13126
	for <parisc-linux@puffin.external.hp.com>; Mon, 14 Jun 1999 09:15:57 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 14 Jun 1999 15:15:44 -0000
Received: from alan by the-village.bc.nu with local (Exim 2.12 #1)
	id 10tYS4-00066l-00
	for parisc-linux@thepuffingroup.com; Mon, 14 Jun 1999 16:15:08 +0100
To: parisc-linux@thepuffingroup.com
Message-Id: <E10tYS4-00066l-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 14 Jun 1999 16:15:08 +0100
Subject: [parisc-linux] Dino PCI and I/O spaces
List-ID: <linux-parisc.vger.kernel.org>


I've put together draft code to handle the Dino PCI configuration space
accesses. There seems to be no way to do byte sized config accesses, do
I just read 32bits mask and write 32bits ?

The I/O space documentation also doesn't cover how to force sizes for
inb/inw/inl.

Im guessing you simply do that sized memory access to the 0x6C offset.

I'm mapping the notional I/O space 0x0000->0xFFFF as PCI space I/O. Since
HP boxes have I/O space high no MMIO can be confused for PCI this way.
If we have multiple Dino's in any box I need to put my thinking hat back on.

Also as a btw: PCI I/O port access will suck rocks on HP because we have
to grab a lock since it is a two stage operation. That may mean we want
to write smart copy/csum/io and ins* functions for PCI block I/O.

Alan
