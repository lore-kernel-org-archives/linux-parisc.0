Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA05243
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Jan 2001 17:41:51 -0700
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 721CB1B94
	for <parisc-linux@thepuffingroup.com>; Fri, 26 Jan 2001 16:45:46 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1])
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with SMTP id QAA24364
	for <parisc-linux@thepuffingroup.com>; Fri, 26 Jan 2001 16:47:54 -0800 (PST)
Message-Id: <200101270047.QAA24364@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Fri, 26 Jan 2001 16:47:53 -0800
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] CONFIG_SMP update
List-ID: <linux-parisc.vger.kernel.org>


[ This was posted to the CVS mailing list - I thought it
  might be of general interest. -ggg
]


CVSROOT:	/home/cvs/parisc
Module name:	linux
Changes by:	grundler	01/01/26 17:33:29

Modified files:
	arch/parisc/kernel: Makefile head.S irq.c pdc.c setup.c smp.c 
	arch/parisc64/kernel: Makefile head.S 
	arch/parisc64/lib: Makefile 
	include/asm-parisc: pdc.h 

Log message:
Two sets of fixes here: Makefiles and round two of CONFIG_SMP

First the news :^) (it's 11 now Matt ;^)
hppa64 won't build on head:
o hppa64-linux-gcc is broken. Workaround is to define lock in spinlock_t
as unsigned long and change __ldcw() macro to use ldcd isns.
amodra has fixed gcc in the devel branch but some other problems
prevent him from making that mainline at the moment.
o parisc64 Makefile complete the merge for those files.
o problem is pbus_set_ranges() isn't defined.
Looks like we picked up the new drivers/pci stuff anyway. *sigh*.
I'll look at this first thing next week.

parisc* Makefiles weren't using proper rules to generate .o from .S files.
This is a first hack. Willy will follow up with "clean" versions.

Second round of CONFIG_SMP fixes. I now have both CPU's "online"
and in wide-mode. IPI isn't working. And removing the mdelay's
in smp.c exposes a race condition I haven't figured out yet.
(it's not pdc calls or console output - unless our spinlocks are
broken). If anyone wants to look at either problem, I suggest with
a 2-way j5k running 32-bit to remove some of the variables.
