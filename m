Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kiyen.face.ubiobio.cl (kiyen.face.ubiobio.cl [146.83.194.135])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9E8E3482C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 19:14:34 -0600 (MDT)
Received: from localhost (marco@localhost)
	by kiyen.face.ubiobio.cl (8.11.6/8.11.6) with ESMTP id f98HH7106995
	for <parisc-linux@lists.parisc-linux.org>; Mon, 8 Oct 2001 13:17:07 -0400
Date: Mon, 8 Oct 2001 13:17:07 -0400 (CLT)
From: Marco Rodriguez <marco@kiyen.face.ubiobio.cl>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0110051537370.19883-100000@kiyen.face.ubiobio.cl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Boot problem
List-ID: <linux-parisc.vger.kernel.org>

I'm traying to boot from the parisc-linux 0.9 on one HP 9000 d350 whith
2 100 Mhz PA RISC 7200 processors but it hangs up
this is the boot mesaje and information it shows, after select the boot
from CD-ROM. if someone can tell me how to boot please or the problems i
have, thank you.

HARD Booted.
palo ipl 0.92 root@spqr Mon Jun 25 23:03:13 CEST 2001
0/vmlinux32 2853588 bytes @ 0x6ad6800
0/vmlinux64 3585851 bytes @ 0x6d8f800
0/ramdisk 1991209 bytes @ 0x70fb000

Command line: 'root=/dev/ram console=ttyS0 TERM=vt102'

Kernel: partition 0 file /vmlinux
Ramdisk: partition 0 file /ramdisk
Warning: kernel name doesn't end with 32 or 64... Guessing Annoyance:
Firmware d
oes not support PDC_MODEL_CAPABILITIES call
32
ELF32 executable
Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 1606948 mediaptr 0x1000
Segment 1 load 0028a000 size 468472 mediaptr 0x18a000
Segment 2 load 00300000 size 8192 mediaptr 0x1fd000
Segment 3 load 0034bea8 size 80688 mediaptr 0x1ffea8
Loading ramdisk 1991209 bytes @ 07e09000...
branching to kernel entry point 0x00100000
Set default PSW W bit to 0
-- 
*-------------------------*-----------------------------------------*
| Marco Rodriguez M.      |                                         |
| Ing. Civil Informatica. |   mailto:marco@kiyen.face.ubiobio.cl    |
| U. Bio Bio Conce.       |                                         |
*-------------------------*-----------------------------------------*
