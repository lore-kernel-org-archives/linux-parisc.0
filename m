Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA17077
	for <parisc-linux@puffin.external.hp.com>; Fri, 25 Aug 2000 10:50:19 -0600
Received: from ottawa.linuxcare.com (HELO fuzzynavel.thepuffingroup.com) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 25 Aug 2000 16:50:16 -0000
Received: from linuxcare.com (IDENT:cloud@localhost.localdomain [127.0.0.1])
	by fuzzynavel.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id MAA02546
	for <parisc-linux@thepuffingroup.com>; Fri, 25 Aug 2000 12:43:20 -0400
Sender: cloud@fuzzynavel.thepuffingroup.com
Message-ID: <39A6A225.408A2DF0@linuxcare.com>
Date: Fri, 25 Aug 2000 12:43:18 -0400
From: Claudiu Carter <ccarter@linuxcare.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
References: <20000825124049.B13420@linuxcare.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] badblocks segmentation fault when using mke2fs -c
List-ID: <linux-parisc.vger.kernel.org>

Hi, i just though all should know that mke2fs works, but badblocks doesn't.
badblocks was run from the PA/Linux Development CD 0.1
i ran 'mke2fs -c -v /dev/sda3'
and got:

mke2fs 1.19-WIP, 7-Jul-2000 for EXT2 FS 0.5b, 95/08/09
ext2fs_check_if_mount: No such file or directory while determining whether
/dev.Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
118528 inodes, 237030 blocks
11851 blocks (0.00%) reserved for the super user
First data block=0
8 block groups
32768 blocks per group, 32768 fragments per group
14816 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 376

Running command: badblocks -b 4096 -s /dev/sda3 237030
do_page_fault() pid=21 command='badblocks'

PSW  : 0004fe0b  GR 1 : 00063580  GR 2 : 00000000  GR 3 : 00000000
GR 4 : 00000000  GR 5 : 00000000  GR 6 : 00000000  GR 7 : 00000000
GR 8 : 200200c8  GR 9 : 00000000  GR10 : 00000000  GR11 : 00000000
GR12 : 00000000  GR13 : 00000400  GR14 : 00000000  GR15 : 00001770
GR16 : 00000000  GR17 : 00000010  GR18 : 00061580  GR19 : 00000024
GR20 : 0006  GR21 : 81010100  GR22 : 62626262  GR23 : 00000000
GR24 : 00000000  GR25 : 200200c8  GR26 : 00000000  GR27 : 00061580
GR28 : 00000000  GR29 : ffffffff  GR30 : 20020200  GR31 : 00011b73
SR0  : 00002005  SR1  : 00002005  SR2  : 00000000  SR3  : 00002005
SR4  : 00002005  SR5  : 00002005  SR6  : 00002005  SR7  : 00002005

IASQ : 00002005 00002005 IAOQ : 00005827 0000582b
 IIR : 0ce01013 ISR : 00002005 IOR : 00000000

sending SIGSEGV
Segmentation fault
Writing inode tables: done
Writing superblocks and filesystem accounting information: done

L8R, Cloud.
