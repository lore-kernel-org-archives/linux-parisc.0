Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA26741
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Aug 2000 21:09:47 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 15 Aug 2000 21:10:09 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 15 Aug 2000 21:09:42 -0000
Received: (from willy@localhost)
	by vodka.thepuffingroup.com (8.9.3/8.9.3) id QAA10519
	for parisc-linux@thepuffingroup.com; Tue, 15 Aug 2000 16:05:10 -0400
Date: Tue, 15 Aug 2000 16:05:10 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000815160510.C7757@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] test6 merge
List-ID: <linux-parisc.vger.kernel.org>


i've not seen any cripplingly bad problems reported to the kernel mailing
list about -test6 (slightly fewer than the normal number of snafus,
i think).  So I intend to go ahead with the merge on Thursday.

Here's the list of files which both we and Linus have changed.

CREDITS
Makefile
drivers/Makefile
drivers/char/Config.in
drivers/char/Makefile
drivers/char/console.c
drivers/char/serial.c
drivers/net/Config.in
drivers/net/Makefile
drivers/net/Space.c
drivers/net/eepro100.c
drivers/net/tulip/eeprom.c
drivers/net/tulip/tulip_core.c
drivers/pci/pci.c
drivers/pci/pci.ids
drivers/scsi/53c7xx.c
drivers/scsi/Makefile
drivers/scsi/hosts.c
drivers/scsi/ncr53c8xx.c
drivers/scsi/sym53c8xx.c
drivers/scsi/sym53c8xx_comm.h
drivers/scsi/sym53c8xx_defs.h
drivers/sound/Config.in
drivers/sound/Makefile
drivers/video/Makefile
drivers/video/dummycon.c
fs/Makefile
fs/binfmt_elf.c
fs/exec.c
fs/nfs/read.c
fs/ufs/super.c
include/linux/binfmts.h
include/linux/fs.h
include/linux/init.h
include/linux/pci_ids.h
include/linux/tty.h
include/linux/ufs_fs.h
include/linux/wait.h
init/main.c
kernel/exit.c
kernel/fork.c
kernel/printk.c
lib/string.c
mm/vmalloc.c

some of these are easier than others.  In particular, some of Linus'
changes are supersets of our changes.  Volunteers for segments of
the tree?  Richard Hirst has already volunteered for drivers/net and
drivers/scsi.  It doesn't look to me like there's a lot to do, so we
should be able to churn through it reasonably quickly.  I'm going to
provisionally set a start time of 9am EDT on Thursday 17th August for
laying down the tag (that's 1pm GMT, please remember we're in summer
time :-)

There are going to be some API changes to deal with, in particular be
wary of locking changes.

-- 
Revolutions do not require corporate support.
