Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id TAA03503
	for <parisc-linux@puffin.external.hp.com>; Mon, 10 Jan 2000 19:45:15 -0700
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id UAA19054
	for parisc-linux@thepuffingroup.com; Mon, 10 Jan 2000 20:37:59 -0500
Date: Mon, 10 Jan 2000 20:37:59 -0500
From: Matthew Wilcox <willy@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000110203759.S11300@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Linux 2.3
List-ID: <linux-parisc.vger.kernel.org>


Everyone should now switch development to the linux 2.3 tree which is
in CVS.  How do you do this?

Set your CVSROOT as described on the pages.
cvs co linux-2.3
cd linux-2.3
(fetch a ramdisk.bin and put it in this directory)
make oldconfig
make dep
make Image
cp arch/parisc/boot/Image to wherever you tftpboot from.
Watch your machine crash.

It may get as far as a prompt for you; but even if it doesn't, it should
still get quite some way.  Many configurations will not work, and some
may not compile; I ensured that the defconfig will at least link.
