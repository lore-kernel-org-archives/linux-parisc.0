Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA03929
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 00:58:42 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 8157F1072
	for <parisc-linux@thepuffingroup.com>; Tue, 10 Oct 2000 23:59:44 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id AAA05911
	for parisc-linux@thepuffingroup.com; Wed, 11 Oct 2000 00:04:01 -0700 (PDT)
Date: Wed, 11 Oct 2000 00:04:01 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010110704.AAA05911@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] __hp9000s700 predefined
List-ID: <linux-parisc.vger.kernel.org>

Hi all,
I was looking at how to properly ifdef code for parisc-linunx
and it seems that "#ifdef __hppa__" is "the right way" to do this.

Currently two files use ifdef CONFIG_PARISC: genrtc.c and hilkdb.c
Randolf (tausq) is fixing genrtc.c.
Any volunteers (ie 715/50 or 715/33 owners) for hilkdb.c?

But Randolf also noted that gcc predefines a few other things:
	-D__hp9000s700 -D_PA_RISC1_1

John Marvin suggested we remove the __hp9000s700 from the pa-linux
config files since it's HPUX crud. I think he's right since parisc-linux
kernels are intended to run on both 700's and 800's.
parisc-linux configs functionality in/out based on CONFIG_XXX flags
or run-time checks (ie register_driver()).
Can we remove the "-D__hp9000s700" from gcc/gcc/config/pa/pa-linux.h?

Similarly, gcc/gcc/config/pa/pa-linux64.h has "-D__hp9000s800"
which could/should be removed at the same time.

Any other thoughts on this?

thanks,
grant
