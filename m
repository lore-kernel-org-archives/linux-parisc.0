Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA10593
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Aug 1999 13:55:35 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com
Date: Tue, 24 Aug 1999 21:11:58 +0200
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <99082421482700.00413@P100>
Subject: [parisc-linux] initrd/ramdisk-Status...
List-ID: <linux-parisc.vger.kernel.org>

Hello,

After my last commits, I think it is time to inform the list of the status
of initrd:

The first: initrd via bootloader should be usable now....

Internals / How to use:
I programmed it in such a way, that the bootable image in arch/parisc/boot/
holds a directory-structure for up to 63 possible ramdisks, which can be
selected during boot via initrd=<number> or initrd=<name>.  
The reason for adding support for multiple ramdisks is, that distributions
later can add easier support for multiple/different machines in one bootfile.

Ready-made-ramdisks with a name of "ramdisk.bin", which resides in the
main-directory of the Linux-Sources, will be automatically added during a "make
Image".  More ramdisks can be added at any time with the program
arch/parisc/boot/addramdisk.

The bootloader will print at startup a list of all available ramdisks and
loads the first (if any) ramdisk by default. 
More, the bootloader gives you the possibility to change the commandline (and
the initrd=-command) if it is started via "boot lan isl" or "boot alt isl"... 

Memory-Layout:
Since I didn´t knew, where to load the ramdisk I decided to load it to the end of the available RAM.
The adress will be printed during boot.


Ideas and comments are welcome,

Helge Deller.
