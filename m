Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA29617
	for <parisc-linux@puffin.external.hp.com>; Mon, 13 Sep 1999 10:46:41 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id MAA08846
	for <parisc-linux@thepuffingroup.com>; Mon, 13 Sep 1999 12:48:03 -0400 (EDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id JAA17467 for <parisc-linux@thepuffingroup.com>; Mon, 13 Sep 1999 09:46:43 -0700 (PDT)
Message-Id: <199909131646.JAA17467@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Mon, 13 Sep 1999 09:46:42 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] $global$ undefined?
List-ID: <linux-parisc.vger.kernel.org>

I'm getting "undefined reference to `$global$'" error when
linking. Is this a tools or source tree problem?

I'm inclined to think the former but don't know.

thanks,
grant

ps - this is now on an HP-UX 11.00 system.

grundler <438>type ld
ld is /linux/parisc-linux/bin/ld
grundler <439>ld --version
GNU ld 2.9.1
Copyright 1997 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License.  This program has absolutely no warranty.
  Supported emulations:
  hppaelf
grundler <440>type gcc
gcc is /linux/parisc-linux/bin/gcc
grundler <441>gcc --version
egcs-2.91.60
grundler <442>type as      
as is /linux/parisc-linux/bin/as
grundler <443>as --version
GNU assembler 2.9.1
Copyright 1997 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License.  This program has absolutely no warranty.
This assembler was configured for a target of `parisc-linux'.

grundler <444>make vmlinux
gcc -D__KERNEL__ -I/linux/linux/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -mdisable-fpregs -fwritable-strings  -pipe -fno-strength-reduce -DUTS_MACHINE='"parisc"' -c -o init/version.o init/version.c
.
.
.
ld -R 0xc0010000 -N -e stext arch/parisc/kernel/head.o arch/parisc/kernel/init_task.o init/main.o init/version.o ramdisk.o\
	arch/parisc/kernel/kernel.o arch/parisc/mm/mm.o kernel/kernel.o mm/mm.o fs/fs.o ipc/ipc.o \
	fs/filesystems.a \
	net/network.a \
	drivers/block/block.a drivers/char/char.a drivers/gecko/gecko.a  drivers/net/net.a drivers/pci/pci.a \
	/linux/linux/arch/parisc/lib/lib.a /linux/linux/lib/lib.a /linux/linux/arch/parisc/lib/lib.a \
	-o vmlinux
arch/parisc/kernel/kernel.o: In function `pdc_add_valid':
arch/parisc/kernel/kernel.o($CODE$+0x26f8): undefined reference to `$global$'
make: *** [vmlinux] Error 1
grundler <445>
