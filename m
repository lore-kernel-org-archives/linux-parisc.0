Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust171.bre.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id D8102482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 May 2001 14:05:35 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9B457B008; Fri, 25 May 2001 21:03:07 +0100 (BST)
Date: Fri, 25 May 2001 21:03:07 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010525210307.Q8736@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] executing from loopback mounts crashes A500
List-ID: <linux-parisc.vger.kernel.org>

Make an fs in a file, mount it, copy bash in, unmount, lots of
disk traffic to flush memory, mount it again, try and execute
bash.  Random problems, generally resulting in a hung system.
With a smaller binary I got a few random errors and then it started
working.

Richard


slab:/usr/src/boot-floppies# cd /tmp
slab:/tmp# dd if=/dev/zero of=img bs=1M count=8
8+0 records in
8+0 records out
slab:/tmp# mke2fs img  
mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
img is not a block special device.
Proceed anyway? (y,n) y
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
2048 inodes, 8192 blocks
409 blocks (4.99%) reserved for the super user
First data block=1
1 block group
8192 blocks per group, 8192 fragments per group
2048 inodes per group

Writing inode tables: done                            
Writing superblocks and filesystem accounting information: done
slab:/tmp# mkdir mnt
slab:/tmp# mount -o loop img mnt
slab:/tmp# cp /bin/bash mnt
slab:/tmp# umount mnt
slab:/tmp# dd if=/dev/sda of=/dev/null bs=1M count=256
256+0 records in
256+0 records out
slab:/tmp# mount -o loop img mnt
slab:/tmp# mnt/bash
mnt/bash: error while loading shared libraries: cannot load shared object file: Error 21
slab:/tmp# mnt/bash
Illegal instruction
slab:/tmp# mnt/bash
Illegal instruction
slab:/tmp# mnt/bash
Trace/breakpoint trap

(hung system)
