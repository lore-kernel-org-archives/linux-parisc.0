Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x1.nokia.com (mgw-x1.nokia.com [131.228.20.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id D361D482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  3 Sep 2001 08:21:12 -0600 (MDT)
Received: from esvir01nok.ntc.nokia.com (esvir01nokt.ntc.nokia.com [172.21.143.33])
	by mgw-x1.nokia.com (Switch-2.1.0/Switch-2.1.0) with ESMTP id f83EJh905775
	for <parisc-linux@lists.parisc-linux.org>; Mon, 3 Sep 2001 17:19:43 +0300 (EET DST)
Received: from esebh01nok.ntc.nokia.com (unverified) by esvir01nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T55c57f3dbcac158f21083@esvir01nok.ntc.nokia.com> for <parisc-linux@lists.parisc-linux.org>;
 Mon, 3 Sep 2001 17:21:10 +0300
Received: from linux.nokia.com (linox03.ntc.nokia.com [172.21.29.49]) by esebh01nok.ntc.nokia.com with SMTP (Microsoft Exchange Internet Mail Service Version 5.5.2652.78)
	id R4RMFLSN; Mon, 3 Sep 2001 17:21:10 +0300
Received: from penguin3.ntc.nokia.com (IDENT:martikka@penguin3.ntc.nokia.com [192.168.170.81])
	by linux.nokia.com (8.11.2/8.11.2) with ESMTP id f83ELAx19172
	for <parisc-linux@lists.parisc-linux.org>; Mon, 3 Sep 2001 17:21:10 +0300
Date: Mon, 3 Sep 2001 17:21:09 +0300 (EEST)
From: Hannu Martikka <martikka@penguin3.ntc.nokia.com>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.30.0109031623080.14451-100000@penguin3.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] Kernel panics on 715/80
List-ID: <linux-parisc.vger.kernel.org>

Hei,

I just downloaded kernel-2.4.9 (linux-20010901.tar.gz) and compiled it
with default configuration (I selected the 7100LC cpu) on my 715/80. I was
successfully running the 2.4.0 kernel from 0.9.2 cd-image.

Any ideas what went wrong?

- Goodi

Booting
palo ipl 0.93 bame@palinux Wed Jul 11 11:08:57 MDT 2001
0/vmlinux32 2853588 bytes @ 0x48000
Partition Start(MB) End(MB) Id Type
1               1      16   f0 Palo
2              17     505   82 swap
3             506    2060   83 ext2

Command line: 'root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102'

Kernel: partition 3 file /boot/vmlinux-2.4.9
ext2 block size 4096
ext2_mount(partition 3) returns 0
ext2_open(/boot/vmlinux-2.4.9) = 3
ELF32 executable
Entry 001000d0 first 00100000 n 4
Segment 0 load 00100000 size 1712516 mediaptr 0x1000
Segment 1 load 002a4000 size 281808 mediaptr 0x1a4000
Segment 2 load 002ec000 size 385024 mediaptr 0x1e9000
Segment 3 load 0037f510 size 88000 mediaptr 0x247510
branching to kernel entry point 0x001000d0

Dumping Stack from 10348000 to 10348980:
8000 00000000 00000000 00000000 00000000 102b6fa0 00000000 00000000
ffffffff
................
8960 00000000 00000000 00000000 10107748 00000000 00000000 00000000
00000000

Kernel Fault: Code=15 regs=10348740 (Addr=2000003c)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000011000000000000001111
r0-3     00000000 2000003c 1010afd0 1034c76c
r4-7     f0200000 1034c010 00000005 10348628
r8-11    10348609 00000008 0004000e 102ecf94
r12-15   00000000 00000001 00000001 f0000704
r16-19   f000b858 00000002 00000000 00000000
r20-23   00005e00 0000000b 00000010 0000008e
r24-27   00000000 1034c1e0 1034c770 102a4010
r28-31   00000000 102b6810 10348980 f0012870
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 102ee3c4 102ee3b4
 IIR: 0c201093    ISR: 00000000  IOR: 2000003c
 ORIG_R28: 00000000
