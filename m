Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id B47D4482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Sep 2001 22:00:19 -0600 (MDT)
Message-Id: <200109050357.VAA00570@puffin.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Arnaud.ATOCH@oecd.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] UreStoreOptical 20xt 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Tue, 04 Sep 2001 03:01:22 BST." <20010904030122.S5126@parcelfarce.linux.theplanet.co.uk>
Date: Tue, 04 Sep 2001 21:57:28 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matthew Wilcox wrote:
> On Mon, Sep 03, 2001 at 07:34:20PM -0600, Grant Grundler wrote:
> > IIRC, should only need hpfs (which also depends on ufs?..dunno anymore)
> > hfs == Apple's Hiearchial File System.
> 
> hpfs is IBM's High Performance FileSystem for OS/2 :-)
> You need ufs and mount with -ohp, iirc.

oops...thanks for the correction and -ohp is right:

grundler <520>fgrep -i hp fs/ufs/*
fgrep: fs/ufs/CVS: Is a directory
fs/ufs/super.c: * HP/UX hfs filesystem support added by
fs/ufs/super.c:                 else if (!strcmp (value, "hp"))
fs/ufs/super.c:                         ufs_set_opt (*mount_options, UFSTYPE_HP);
...
fs/ufs/super.c:                 printk(KERN_INFO "ufstype=hp is supported read-only\n");


BUG: Documentation/filesystems/ufs.txt doesn't mention -ohp

> There is now vxfs support in the tree, but nobody's
> tried getting it working on HP vxfs volumes.  Volunteers...?

Ooh..it's possible those optical disks ended up using vxfs too...
and CONFIG option says that's RO support too.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
