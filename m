Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA28155
	for <parisc-linux@puffin.external.hp.com>; Fri, 30 Jun 2000 17:26:33 -0600
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by cosrel2.hp.com (Postfix) with ESMTP id CBFF221F
	for <parisc-linux@thepuffingroup.com>; Fri, 30 Jun 2000 17:27:45 -0600 (MDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id 701C937E33
	for <parisc-linux@thepuffingroup.com>; Fri, 30 Jun 2000 17:29:24 -0600 (MDT)
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 30 Jun 2000 17:29:24 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20000630232924.701C937E33@carmen.fc.hp.com>
Subject: [parisc-linux] New defconfig/nfsroot/ramdisk/lifimage available
List-ID: <linux-parisc.vger.kernel.org>

A couple updates...

- I updated the default parisc kernel config to have SCSI disk/tape/cdrom, and 
the LASI/SYM53C8XX drivers turned on(and normal I/O for SYM).

- I created a new small root tarball, available at,
ftp://puffin.external.hp.com/pub/parisc/binaries/nfsroot/nfsroot-small-latest.t
ar.gz
I added fdisk, mke2fs, fsck.ext2, and the scsi stuff in /dev

- I created a new ramdisk(4MB) using the above tarball, available at,
ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks/ramdisk.bin-latest

- I built a new lifimage using the new kernel config, today's kernel cvs bits, 
and the above ramdisk. It's available at,
ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/Image-latest

Using this lifimage you should be able to boot your system and 
partition/mke2fs/mount/use your scsi disks. Please give it a try and report 
successes/failures to the list.

Thanks,

-- 
Matt Taggart
taggart@fc.hp.com
