Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.vi-internet.de (proxy1.vi-internet.de [195.182.114.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 041C3482A
	for <parisc-linux@parisc-linux.org>; Thu, 21 Jun 2001 11:47:13 -0600 (MDT)
Sender: ruediger@dsl2.external.hp.com
Message-ID: <3B323263.11467E62@hrzpub.tu-darmstadt.de>
Date: Thu, 21 Jun 2001 19:44:03 +0200
From: =?iso-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------86E534352468461910BA93C4"
Subject: [parisc-linux] Kernel crashing with STI-Console
List-ID: <linux-parisc.vger.kernel.org>

Dies ist eine mehrteilige Nachricht im MIME-Format.
--------------86E534352468461910BA93C4
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi there!

I have a HP 715/100-box with a graphics ad-on card, which is listed as
"Coral SGC Graphics..." when booting linux. (btw Perhaps s.o. can tell
me what kind of add-on card it is. It is a CRX, or s.th else?)

The machine is running the 0.9 release with serial console.

I compiled a recent kernel (2.4.0-pa30) with STIfb and STI-Console
enabled, in order to use the STI-Console on my box. Booting this kernel
results in a kernel crash immediately after reading vmlinux. I capture
it via serial console.
Can somebody have a look at it?

The System.map file can be found on http://www.tu-darmstadt.de/~rscholz
.

Thanks, Ruediger
--------------86E534352468461910BA93C4
Content-Type: text/plain; charset=us-ascii;
 name="minicom.cap-sti"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minicom.cap-sti"



----------------------------------------------------------------------------
BootRom Version    1.4  
Memory Size:  128 MB
----------------------------------------------------------------------------




(c) Copyright 1990-1994, Hewlett-Packard Company.
All rights reserved

Press <ESCAPE> to stop boot sequence.

Starting Auto boot


Loading Initial Program Loader


IPL successfully loaded


Booting
palo ipl 0.92 bame@palinux Thu Jun 14 14:08:59 MDT 2001
0/vmlinux32 2622963 bytes @ 0x48000
Partition Start(MB) End(MB) Id Type
1               1      22   f0 Palo
2              23      64   83 ext2
3              65     194   82 swap
4             195    2046   83 ext2
Kernel: partition 2 file /vmlinux-2.4.0-pa30-sti
ext2 block size 1024
ext2_mount(partition 2) returns 0
ext2_open(/vmlinux-2.4.0-pa30-sti) = 3
ELF32 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 1580896 mediaptr 0x1000
Segment 1 load 00282000 size 227192 mediaptr 0x183000
Segment 2 load 002bc000 size 240416 mediaptr 0x1bb000
Segment 3 load 002f8000 size 8192 mediaptr 0x1f6000
Segment 4 load 0034414c size 79216 mediaptr 0x1f814c
branching to kernel entry point 0x00100000
Set default PSW W bit to 0

GRs

0x00000000
0x00000000
0xF4100000
0x00000001
0xF5000000
0x00000003
0x00000001
0xF0025328
0x0000000D
0xF02FD698
0xF4300000
0x00000000
0x00080BEF
0x00010000
0x00000005
0x00000032
0x00000000
0x00283BAB
0x00000001
0x00000000
0x00000000
0xF0025000
0x00000500
0x0B00007D
0x00000001
0x00000000
0x00283BAB
0x10282010
0x00000001
0xF02FD698
0x002FD8D8
0x005F93E8

CRs

0x00000000
0x00000000
0x00000000
0x00000000
0x00000000
0x00000000
0x00000000
0x00000000
0x00000000
0x00000000
0x000000C0
0x0000001E
0x00000000
0x00000000
0x00105800
0xFFFFFFFF
0xD23D5D47
0x00000000
0x005F8944
0xB3202000
0x00000000
0x005F8964
0x00007F00
0x80000000
0x002A1000
0x002A1000
0x1FEBDFFF
0x0900DEEE
0xAAAAAAAA
0xF0002000
0x00000000
0xF00EFFFF

SRs

0x00000000
0x00000000
0x00000000
0x00000000
0x00000000
0x00000000
0x00000000
0x00000000

OTHER

0x00000000
0x005F8948
0x20000000
0x9E000004
0x00000000
0x00000000
0x00000000
0x00310000
0x00000000
0x00000000
0x00000000
0xF02FD710
0xFFFBE000
0x00000000
0x00000082
0x2C1048E6
0x3B30E497









--------------86E534352468461910BA93C4--
