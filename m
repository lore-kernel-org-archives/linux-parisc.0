Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA32200
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 15:37:13 -0700
Received: from localhost (mang@localhost) by cuzea.pair.com (8.9.1/8.6.12) with ESMTP id QAA11172 for <parisc-linux@thepuffingroup.com>; Tue, 8 Feb 2000 16:33:06 -0500 (EST)
Date: Tue, 8 Feb 2000 16:33:06 -0500 (EST)
From: Michael Ang <mang@subcarrier.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.BSF.4.10.10002081631440.11091-100000@cuzea.pair.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] files still needing manual merging
List-ID: <linux-parisc.vger.kernel.org>

Conflicted files which still need to be manually merged using 'cvs up
-jlinus2329 -jlinus2342'

`Makefile'
`drivers/block/rd.c'
`drivers/char/Makefile'
`drivers/char/serial.c'
`drivers/net/tulip.c'
`include/asm-arm/arch-ebsa285/hardware.h'
`include/linux/init.h'`include/linux/mm.h'
`init/main.c'
`kernel/resource.c'
`mm/Makefile'
`mm/bootmem.c'

Files which had conflicts and currently have fixes checked in
drivers/block/ide-dma.c
drivers/video/fm2fb.c
fs/Makefile
fs/buffer.c
include/linux/init.h
include/linux/mm.h
include/linux/ncp_fs.h
mm/filemap.c
