Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA11330
	for <parisc-linux@puffin.external.hp.com>; Sun, 13 Jun 1999 18:31:37 -0600
Received: from lightning.swansea.uk.linux.org (HELO the-village.bc.nu) (194.168.151.1)
  by mailserv2.iuinc.com with SMTP; 14 Jun 1999 00:31:26 -0000
Received: from alan by the-village.bc.nu with local (Exim 2.12 #1)
	id 10tKeG-0005Wl-00
	for parisc-linux@thepuffingroup.com; Mon, 14 Jun 1999 01:30:48 +0100
To: parisc-linux@thepuffingroup.com
Date: Mon, 14 Jun 1999 01:30:46 +0100 (BST)
Content-Type: text
Message-Id: <E10tKeG-0005Wl-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [parisc-linux] Lasi/Dino/Interrupts
List-ID: <linux-parisc.vger.kernel.org>

I've started putting together some basic code to drive LASI and DINO.
Some things aren't terribly clear however

1.	How much of LASI/DINO/PCI has been initialised by the boot firmware.
	Has it performed the PCI device configurations and assigned bus
	spaces for the devices ?

	Will the LASI devices be in reset state except for the console port
	(Im assuming lasi is driving the firmware console ?)

2.	It isnt totally clear from the docs what the input clock of the
	16550A macrocell is. I need that for the serial.c code obviously..

3.	The parallel port slave reset is at 102000 in the register map. The
	docs elsewhere say the parallel port DMA registers can be reset
	by writing to offset 10300 - should this be 102000 or 103000 - ie
	is the dma reset for the parallel seperate , and is it at the
	obvious place or really is one of the 8bit bus (flash) addresses

4.	Do I need to set bits in the I/O reset register back to 1 after
	a reset in order to bring them back active or is that automatic.

I have the irq handlers for LASI and DINO done. These will map the 
multiplexed irqs from these devices onto the linux "one irq space" model
presented to drivers.

Alan
