Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id DAA00377
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Sep 1999 03:45:34 -0600
Message-ID: <19990915094854.6473.rocketmail@web503.yahoomail.com>
Date: Wed, 15 Sep 1999 02:48:54 -0700 (PDT)
From: Ulrich Strelow <ulrich_strelow@yahoo.com>
To: parisc-linux@thepuffingroup.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] boot problems on 715/33 with ramdisk.bin
List-ID: <linux-parisc.vger.kernel.org>

I have downloaded the kernel tree dated 19990813 from
ftp://puffin.external.hp.com/pub/parisc and added
ramdisk.bin to my top directory /usr/src/linux. After
a successful "make vmlinux" and "make Image" I tried
to boot the new kernel on my 715/33. The last boot
messages are:

Linux version 2.2.1 (root@be5359) (gcc version 2.8.1)
#1
 Mon Sep 13 17:51:40 METDST 1999
initrd: c0075000-c00cc800
urgh.

The bootloader starts with the messages:
Loading PA-RISC/Linux Kernel...
No ramdisks available.

What have I done wrong with the ramdisk support?

Also:
Booting via hpux does not seem to work anymore. I have
been on holidays the last 4 weeks, so I can't say when
this feature has disappeared. I also don't know, if
booting via hpux is still supported.

Ulrich
-------------------------------------------------------
Ulrich Strelow
<ulrich.strelow@schering.de or
ulrich_strelow@yahoo.com>
Berlin, Germany


__________________________________________________
Do You Yahoo!?
Bid and sell for free at http://auctions.yahoo.com
