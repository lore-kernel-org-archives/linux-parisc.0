Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA04616
	for <parisc-linux@puffin.external.hp.com>; Tue, 23 May 2000 17:07:36 -0600
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id UAA28620
	for parisc-linux@thepuffingroup.com; Tue, 23 May 2000 20:07:51 -0400
Date: Tue, 23 May 2000 20:07:50 -0400
To: parisc-linux@thepuffingroup.com
Message-ID: <20000523200750.F17536@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [MERGE] trouble files
List-ID: <linux-parisc.vger.kernel.org>


the following list of files (if I remember to attach them this time...)
are the files which have been modified in both the parisc tree and Linus'
2.3.99pre8 tree.  I've omitted the files where the rcs id is the only thing
changed.

Tulip is special because we're using 2.3.99pre3's driver in the pre1 tree.
So the files which differe from pre3 are these:

drivers/net/tulip/eeprom.c
drivers/net/tulip/tulip_core.c

The following files should definitely just be overwritten:

Documentation/DMA-mapping.txt
drivers/net/pcnet32.c

the rest will require closer scrutiny on Friday.  From an initial
examination, it's not going to be too painful.  I propose we close
the tree for new checkins midnight Thursday GMT (7pm EST, 4pm PST).
After that, I guess we'll lay down a tag and start merging in 2.3.99pre8
files and then lay down another tag when we're done.  mang, will you be
around to assist us with the merge?


CREDITS
Makefile
drivers/block/rd.c
drivers/char/Config.in
drivers/char/Makefile
drivers/char/console.c
drivers/char/serial.c
drivers/net/82596.c
drivers/net/Makefile
drivers/net/Space.c
drivers/net/eepro100.c
drivers/pci/pci.c
drivers/pci/pci.ids
drivers/scsi/Makefile
drivers/scsi/hosts.c
drivers/scsi/script_asm.pl
drivers/scsi/scsi_obsolete.c
drivers/scsi/sym53c8xx_defs.h
drivers/sound/Config.in
drivers/sound/Makefile
drivers/video/Makefile
fs/Makefile
fs/exec.c
fs/nfs/nfsroot.c
include/linux/binfmts.h
include/linux/pci.h
include/linux/pci_ids.h
include/linux/string.h
include/linux/tty.h
include/linux/udf_fs_sb.h
include/linux/ufs_fs.h
init/main.c
kernel/exit.c
kernel/fork.c
kernel/printk.c
lib/string.c
mm/slab.c
