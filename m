Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA24599
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Jul 2000 12:23:21 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 3E7377A9
	for <parisc-linux@thepuffingroup.com>; Wed, 12 Jul 2000 11:24:46 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id LAA14363
	for parisc-linux@thepuffingroup.com; Wed, 12 Jul 2000 11:26:37 -0700 (PDT)
Date: Wed, 12 Jul 2000 11:26:37 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200007121826.LAA14363@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Internal compiler error
List-ID: <linux-parisc.vger.kernel.org>

Dave (dhd),
Since you expressed an interest in compiler bugs:

...
make[1]: Leaving directory `/linux/grundler/linux-2.3/arch/parisc/hpux'
hppa-linux-gcc -I/linux/grundler/linux-2.3/include  -D__KERNEL__ -I/linux/grundler/linux-2.3/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -ffunction-sections -D__linux__ -pipe -fno-strength-reduce  -DUTS_MACHINE='"parisc"' -c -o init/version.o init/version.c
dino.c: In function `dino_common_init':
dino.c:675: incompatible type for argument 2 of `list_add'
dino.c:675: Tree check: expected class 't', have 'x' (error_mark)
dino.c:675: Internal compiler error in `expand_inline_function', at integrate.c:678
Please submit a full bug report.
See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make[3]: *** [dino.o] Error 1
make[3]: Leaving directory `/linux/grundler/linux-2.3/drivers/gsc'
...

I'm changing code in several files in order to build an I/O tree of hp_devices
much like pci does...the problem above was due to one of my changes:

...
STATIC struct list_head dino_list;
...

        list_add(&dino_dev->dino_hba.hba_dev->global_list, dino_list);


Missing a '&' in front of dino_list and the compiler really
didn't like that. I don't have a big problem with the compiler
"oops"ing here since it correctly identified the problem.

cheers,
grant
