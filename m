Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA18288
	for <parisc-linux@puffin.external.hp.com>; Sat, 12 Feb 2000 21:55:54 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id WAA10823
	for parisc-linux@thepuffingroup.com; Sat, 12 Feb 2000 22:51:02 -0500
Date: Sat, 12 Feb 2000 22:51:02 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000212225102.D9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] MAKE initrds FAST
List-ID: <linux-parisc.vger.kernel.org>


An interesting project someone might want to take on:

I waste a fair bit of time copying executables from hpux to linux,
mounting a ramdisk over loopback, putting the executable into the
disk, unmounting it, copying the ramdisk back to hpux, making a new
kernel and then booting it.

If someone has some spare time, they might want to investigate using
libext2fs to build a ramdisk under HPUX.  Red Hat's mkinitrd doesn't
work like this, so can't be usefully adapted.  libext2fs is available
as part of e2fsprogs, available from most ftp sites world-wide :-)
