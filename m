Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id FAA18073
	for <parisc-linux@puffin.external.hp.com>; Wed, 3 Nov 1999 05:17:45 -0700
Message-ID: <19991103123044.18853.rocketmail@web507.yahoomail.com>
Date: Wed, 3 Nov 1999 04:30:44 -0800 (PST)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Congratulations, remarks and questions
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

first of all congratulations for the success of
getting to the shell prompt. I hope that you have
celebrated this event accordingly. I finally made it
too, I build a kernel for my 715/33 which boots until
the sash-prompt. To document the necessary steps for
others, here is my recipe:

1. get a recent kernel source (I took 19991031)
2. apply the patch from Thomas Bogendoerfer to
arch/parisc/kernel/setup.c (see his mail iodc console
patch). The patch to pdc_cons.c seems to be no longer
necessary.
3. get ramdisk.bin-19991019-workingsash and copy it to
/usr/src/linux as ramdisk.bin.
4. run make config and change the following options:
CONFIG_IODC_CONSOLE=y
CONFIG_NETDEVICES=n 
CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_SERIAL=n
5. run make dep, make vmlinux, make Image
6. boot the kernel with the "isl" option and change
the command line from ttyS0 to tty (or change the
console parameter of DEFAULT_COMMANDLINE in
arch/parisc/boot/boot_code/ipl_c.c).  

Now some remarks: I have noticed the development of
the I/O-drivers (GSC/Gecko, DINO, LASI, PCI) in the
past to make them stable, so that they can be included
even if the machine does not have these features. This
is also true for my 715/33 and the 19991031 kernel
tree. However, saying no to CONFIG_GECKO_DINO,
CONFIG_GECKO_LASI and CONFIG_PCI leads to missing
symbols inb and outb during the link stage which are
defined in arch/parisc/kernel/pci.c. And saying no to
CONFIG_GECKO is impossible because gecko.a is defined
in DRIVERS in the central Makefile without a
surrounding ifdef. I don't think that this is a
problem right now, but I would like to mention these
points anyway.

My first try was to build the kernel without
specifying CONFIG_NETDEVICES=n. This leads to the
following problem: the kernel stops booting with these
messages:  

Starting lasi lan at 0xf0826000
lasi_alloc_irq(0xc0127968): No LASI found in system
yet
IRQ not found for lasi lan at 0xf0826000
Warning : device (10, 0xb, 0x0, 0x72, 0x0) NOT claimed
by Lasi i82596(???) LAN 700 or similiar (old)

Maybe this is of interest to someone, too.

Now the questions: the kernel boots to the
sash-prompt, but no keyboard input is possible
(neither the HIL-keyboard, nor the keyboard from the
serial terminal I was using). Is this because of the
missing support for the ASP chip of the 715/33 ? Are
all devices (HIL, SCSI and LAN) connected via that
chip ? And finally: has HP found and published the
docs of that chip so that someone is able to write the
supporting routines ?

Greetings from Berlin
Ulrich

__________________________________________________
Do You Yahoo!?
Bid and sell for free at http://auctions.yahoo.com
