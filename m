Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-3.cisco.com (sj-msg-core-3.cisco.com [171.70.157.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id 79CDB482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 00:03:22 -0600 (MDT)
Received: from mira-sjc5-9.cisco.com (mira-sjc5-9.cisco.com [171.71.163.32])
	by sj-msg-core-3.cisco.com (8.11.3/8.9.1) with ESMTP id f9D61AC09049
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Oct 2001 23:01:12 -0700 (PDT)
Date: Fri, 12 Oct 2001 23:02:59 -0700 (PDT)
From: Christian Suder <csuder@cisco.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0110122248050.766-100000@ibanez.csuder.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 735/125 'reliably' hangs during mke2fs
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I'm trying to get a 735/125 going using the 0.9.2 install CD. Old, I
know.... Whenever it's time to make the fs I get up to here :

Creating filesystem (for 2.2 kernels only)...
mke2fs 1.20, 25-May-2001 for EXT2 FS 0.5b, 95/08/09
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
91968 inodes, 183808 blocks
9190 blocks (5.00%) reserved for the super user
First data block=0
6 block groups
32768 blocks per group, 32768 fragments per group
15328 inodes per group
Superblock backups stored on blocks: 
        32768, 98304, 163840

Writing inode tables: done                            
Writing superblocks and filesystem accounting information: 

with the cursor behind the last line. 

Any magic boot parameter that might help here ? Is there a 'cheat-sheet'
for everything that can be specified at the boot prompt ? 

By the same token, I've tried to install it on a C110 with the HD on the
FWSCSI. It appears to work but within an hour or two the filesystem gets
severly corrupted. 
I have it running now with 'today's kernel' after reinstalling and getting
the kernel on as early as possible. Fingers crossed....

Any hints and pointers on SCSI issues appreciated,

	Christian 
