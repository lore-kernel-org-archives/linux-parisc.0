Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA22942
	for <parisc-linux@puffin.external.hp.com>; Sat, 29 Jan 2000 15:53:52 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id RAA11845
	for parisc-linux@thepuffingroup.com; Sat, 29 Jan 2000 17:55:32 -0500
Date: Sat, 29 Jan 2000 17:55:32 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000129175532.B32390@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] small jobs list
List-ID: <linux-parisc.vger.kernel.org>


Here's some small jobs which need doing.  None are critical, please let me
know if you decide to work on them:

 * NCR53c710 support.  This is the later scsi chipset in the 700 series.

 * Fixing floppy.c.  It doesn't compile right now.

 * Fix binfmt_elf.c.  It doesn't compile either.  Take care that adjusting
     the argv and envp pointer should be done in the opposite direction.
     I can't remember if we already did that or not -- check it against
     Linus'.
