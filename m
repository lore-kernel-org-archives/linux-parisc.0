Received: from cs1-hq.oecd.org (cs1-hq.oecd.org [193.51.65.66])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id IAA20175
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 08:28:37 -0700
From: Arnaud.ATOCH@oecd.org
Received: from netsweep1.oecd.org (netsweep1.oecd.org [10.102.5.110])
	by cs1-hq.oecd.org (8.9.3/8.9.3/oecd-1.6) with ESMTP id QAA03410
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 16:28:21 +0100
Received: from eosgty.oecd.org (unverified) by netsweep1.oecd.org
 (Content Technologies SMTPRS 4.1.5) with ESMTP id <T0a66056e4fefdb1bc4@netsweep1.oecd.org> for <parisc-linux@puffin.external.hp.com>;
 Fri, 17 Nov 2000 16:28:50 +0100
Message-ID: <C12531D038D1D011B1DB0000F8036C28071AB722@eosm5.oecd.org>
To: parisc-linux@puffin.external.hp.com
Date: Fri, 17 Nov 2000 16:30:42 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Booting 712 with CD 0.5
List-ID: <linux-parisc.vger.kernel.org>

Is the following output the normal behavior of Linux-PARisc on a 712/100 ?

kmem_create: Forcing size word alignment - nfs_fh
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
VFS: Disk change detected on device sr(11,0)
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
kernel BUG at pci-dma.c:391!
kernel BUG at pci-dma.c:400!
ISO 9660 Extensions: RRIP_1991A
VFS: Mounted root (iso9660 filesystem) readonly.
INIT: version 2.78 booting
INIT: Entering runlevel: 2
Setting up /tmp ramdisk4096+0 records in
4096+0 records out
mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
1024 inodes, 4096 blocks
0 blocks (0.00%) reserved for the super user
First data block=1
1 block group
8192 blocks per group, 8192 fragments per group
1024 inodes per group

Writing inode tables: done
Writing superblocks and filesystem accounting information: done

INIT: Id "T0" respawni
INIT: no more processe
