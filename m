Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA29980
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Mar 2000 11:43:36 -0700
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by palrel3.hp.com (Postfix) with ESMTP id 7089A630
	for <parisc-linux@thepuffingroup.com>; Tue, 21 Mar 2000 09:45:06 -0800 (PST)
To: parisc-linux@thepuffingroup.com
Date: Tue, 21 Mar 2000 10:44:58 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12XSiA-00022u-00@endor.fc.hp.com>
Subject: [parisc-linux] PALO and ramdisk micro-howto
List-ID: <linux-parisc.vger.kernel.org>


Grab recent versions of these from CVS:
	palo sources
	linux-2.3/init/main.c
	linux-2.3/arch/parisc/kernel/setup.c

In palo/Makefile, comment out NFSROOT= and uncomment the RAMDISK= line
which assumes your ramdisk is the file ../linux-2.3/ramdisk.bin which
is the way we used to have things.  Make sure you have a ramdisk in that
file (or change RAMDISK=).

Next time you 'make palo' in your linux tree, palo inserts the ramdisk
inside lifimage and constructs a default kernel command line to use the
ramdisk.

I tried both the old ramdisk, and I turned willy's nfsroot into a
ramdisk, and both booted and loaded but died with that
'Kernel panic: Attempted to kill init!' message.  Looks like sash is
being started with some args it doesn't like and exiting with a usage
message.

	-P
