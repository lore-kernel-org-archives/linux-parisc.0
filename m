Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA18419
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Jun 1999 09:30:58 -0600
Received: from srmail.sr.hp.com (srmail.sr.hp.com [15.4.45.14])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id LAA23488
	for <parisc-linux@thepuffingroup.com>; Tue, 15 Jun 1999 11:30:30 -0400 (EDT)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id IAA17946 for parisc-linux@thepuffingroup.com; Tue, 15 Jun 1999 08:30:47 -0700 (PDT)
Message-Id: <199906151530.IAA17946@meow.sr.hp.com>
Subject: [parisc-linux] Lasi/Dino/Interrupts (fwd)
To: parisc-linux@thepuffingroup.com
Date: Tue, 15 Jun 1999 08:30:47 -0700 (PDT)
From: Bill Katz <billk@sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I didn't see any answers, and I've got a couple...

|I've started putting together some basic code to drive LASI and DINO.
|Some things aren't terribly clear however
|
|1.	How much of LASI/DINO/PCI has been initialised by the boot firmware.
|	Has it performed the PCI device configurations and assigned bus
|	spaces for the devices ?

The PCI firmware is rather extensive.  It walks the bus, can deal with
PCI to PCI bridges, and assigns both address space and interrupt
lines to every device it finds.  It leaves the imporartant information
in the base address register and interrupt line register of the PCI devices
it finds.

|
|	Will the LASI devices be in reset state except for the console port
|	(Im assuming lasi is driving the firmware console ?)

Yes, LASI is used for tty0, or the firmware console on all systems
that have a LASI.  I believe you can work really hard at assigning
the console somewhere else, like tty1, which comes from either DINO
or WAX, or ... depending on which system we're talking about.

On systems that use LASI LAN and SCSI those modules will be up and running
by the time the OS is launched.  I believe on systems that use the DEC
LANchip LASI LAN is disabled.  The keyboard controller is LASI is
also likely up and running.
|
|2.	It isnt totally clear from the docs what the input clock of the
|	16550A macrocell is. I need that for the serial.c code obviously..

In section 7.4 it says "the baudrate reference frequency is taken from
the 40 MHz IO system clock.  The frequency 7.2727 MHz is generated
by dividing 40 MHz by 5.5."  7.2727 MHz goes to the Macrocell.

Dino can get its 16500 reference clock from either the GSC clock
or the PCI clock.  I'd have to look through the bootROM source
to remember which way it's set up.

|
|3.	The parallel port slave reset is at 102000 in the register map. The
|	docs elsewhere say the parallel port DMA registers can be reset
|	by writing to offset 10300 - should this be 102000 or 103000 - ie
|	is the dma reset for the parallel seperate , and is it at the
|	obvious place or really is one of the 8bit bus (flash) addresses

The parallel port registers are definitely not in flash space, especailly
on any system with a PA7300LC since the flash space is from Clark not
LASI, and the parallel port is completely inside LASI.

My reading of the ERS says that the slave reset is at LASI_BASE+0x10_2000
and parallel DMA reset is at LASI_BASE+0x10_3000.  A 4k page is assigned
for each set of registers.  Where does it say 10300?  I'll fix the ERS.

|
|4.	Do I need to set bits in the I/O reset register back to 1 after
|	a reset in order to bring them back active or is that automatic.

I don't know that one.  If trial and error doesn't tell you, I could
either run down chip designers or read HPUX driver code.

|
|I have the irq handlers for LASI and DINO done. These will map the 
|multiplexed irqs from these devices onto the linux "one irq space" model
|presented to drivers.

SOunds good.

	-Bill Katz
