Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA31508
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 15:12:11 -0700
Received: from localhost (mang@localhost) by cuzea.pair.com (8.9.1/8.6.12) with ESMTP id QAA09763 for <parisc-linux@thepuffingroup.com>; Tue, 8 Feb 2000 16:04:51 -0500 (EST)
Date: Tue, 8 Feb 2000 16:04:51 -0500 (EST)
From: Michael Ang <mang@subcarrier.org>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.BSF.4.10.10002081559510.9328-100000@cuzea.pair.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 2.3.42 merge - affected files
List-ID: <linux-parisc.vger.kernel.org>

Here is the list of files that have been changed both by Linus between
2.3.29 and 2.3.42 and in our local tree:

drivers/block/ll_rw_blk.c
drivers/block/rd.c
drivers/char/Config.in
drivers/char/console.c
drivers/char/Makefile
drivers/char/serial.c
drivers/char/tty_io.c
drivers/Makefile
drivers/net/pcnet32.c
drivers/net/tulip.c
drivers/pci/pci.c
drivers/sound/Config.in
drivers/sound/Makefile
drivers/video/Makefile
fs/buffer.c
fs/exec.c
fs/Makefile
include/linux/init.h
include/linux/mm.h
include/linux/pagemap.h
include/linux/proc_fs.h
include/linux/tty.h
include/linux/udf_fs_sb.h
init/main.c
kernel/acct.c
kernel/exit.c
kernel/resource.c
kernel/sched.c
lib/string.c
Makefile
mm/bootmem.c
mm/filemap.c
mm/Makefile
mm/memory.c
mm/mmap.c
mm/slab.c

All of these files should be checked visually to make sure that the merge
was done properly.  I'll send another mail with some examples of how to
compare different file revisions.

	- Mike.
