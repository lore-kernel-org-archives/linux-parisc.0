Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lefou.zayda.com (unknown [204.99.158.177])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E968482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Sep 2001 13:33:11 -0600 (MDT)
Received: from localhost (sonny@localhost)
	by lefou.zayda.com (8.9.3/8.9.3) with ESMTP id NAA23720
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Sep 2001 13:33:09 -0600
Date: Thu, 20 Sep 2001 13:33:09 -0600 (MDT)
From: Sonny Cook <sonny@aspersion.org>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0109201328390.14604-100000@lefou>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] kernel 2.5.9-pa24 won't boot 735/125
List-ID: <linux-parisc.vger.kernel.org>

Hi,
I just tried my hand at cross compiling the parisc-linux kernel on my x86
box.  Something compiled, so I put the vmlinux on my 735/125 and tried to
boot it.  It went like this:

Hard booted.
palo ipl 0.94 sonny@foucault Wed Sep 19 22:52:46 MDT 2001
0/vmlinux32 3153422 bytes @ 0x48000
Partition Start(MB) End(MB) Id Type
1               1      16   f0 Palo
2              17    2046   83 ext2

Command line: 'HOME=/ TERM=LINUX console=tty root=/dev/sda2'

Kernel: partition 2 file /boot/vmlinux
ext2 block size 4096
ext2_mount(partition 2) returns 0
Opening /boot/vmlinux
ext2_open(/boot/vmlinux) = 3
ELF32 executable
Entry 001000d0 first 00100000 n 6
Segment 0 load 00100000 size 1714332 mediaptr 0x1000
Segment 1 load 002a4000 size 281768 mediaptr 0x1a4000
Segment 2 load 002ec000 size 376840 mediaptr 0x1e9000
Segment 3 load 0034c000 size 8192 mediaptr 0x246000
Segment 4 load 00350000 size 32768 mediaptr 0x248000
Segment 5 load 0038d684 size 88048 mediaptr 0x250684
branching to kernel entry point 0x001000d0

At this point, I can't even think where to begin looking for problems.
Any hints?

Thanks,
Sonny
