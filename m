Received: from cs1-hq.oecd.org (cs1-hq.oecd.org [193.51.65.66])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA22962
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 10:09:09 -0700
From: Arnaud.ATOCH@oecd.org
Received: from netsweep1.oecd.org (netsweep1.oecd.org [10.102.5.110])
	by cs1-hq.oecd.org (8.9.3/8.9.3/oecd-1.6) with ESMTP id SAA18139
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 18:08:27 +0100
Message-ID: <C12531D038D1D011B1DB0000F8036C28071AB723@eosm5.oecd.org>
To: grundler@cup.hp.com, Arnaud.ATOCH@oecd.org
Cc: parisc-linux@puffin.external.hp.com
Subject: RE: [parisc-linux] Booting 712 with CD 0.5 
Date: Fri, 17 Nov 2000 18:10:52 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Thanks for the enlightment.

Should I try a new CD-ROM or should I wait untill next ISO image is created
?
IS the shutdown also due to this bug ?

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

-----Original Message-----
From: Grant Grundler [mailto:grundler@cup.hp.com]
Sent: Friday, November 17, 2000 17:38
To: Arnaud.ATOCH@oecd.org
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Booting 712 with CD 0.5 


Arnaud.ATOCH@oecd.org wrote:
> Is the following output the normal behavior of Linux-PARisc on a 712/100 ?
> 
> kmem_create: Forcing size word alignment - nfs_fh
> kernel BUG at pci-dma.c:391!
> kernel BUG at pci-dma.c:400!

The bug is real. A driver is calling pci_map_single() and pci_unmap_single()
without specifying which direction the DMA is going. Cache flushing on 712
(PCXL) systems needs to know. I'll assume it's the SCSI driver since
it looks like we are talking to a SCSI CD-ROM.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
