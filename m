Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x2.nokia.com (mgw-x2.nokia.com [131.228.20.22])
	by dsl2.external.hp.com (Postfix) with ESMTP id 573B4482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 03:32:49 -0600 (MDT)
Received: from esvir02nok.nokia.com (esvir02nokt.ntc.nokia.com [172.21.143.34])
	by mgw-x2.nokia.com (Switch-2.1.0/Switch-2.1.0) with ESMTP id f859XE322391
	for <parisc-linux@lists.parisc-linux.org>; Wed, 5 Sep 2001 12:33:14 +0300 (EET DST)
Received: from linux.nokia.com (linox03.ntc.nokia.com [172.21.29.49]) by esebh12nok.ntc.nokia.com with SMTP (Microsoft Exchange Internet Mail Service Version 5.5.2652.78)
	id R4S29LA8; Wed, 5 Sep 2001 12:32:46 +0300
Received: from penguin3.ntc.nokia.com (IDENT:martikka@penguin3.ntc.nokia.com [192.168.170.81])
	by linux.nokia.com (8.11.2/8.11.2) with ESMTP id f859Wkx28382;
	Wed, 5 Sep 2001 12:32:46 +0300
Date: Wed, 5 Sep 2001 12:32:46 +0300 (EEST)
From: Hannu Martikka <martikka@penguin3.ntc.nokia.com>
To: ext Matthew Wilcox <willy@debian.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel panics on 715/80
In-Reply-To: <20010903155940.I5126@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.30.0109041210480.15250-100000@penguin3.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 3 Sep 2001, ext Matthew Wilcox wrote:

> On Mon, Sep 03, 2001 at 05:21:09PM +0300, Hannu Martikka wrote:
> > Hei,
> >
> > I just downloaded kernel-2.4.9 (linux-20010901.tar.gz) and compiled it
> > with default configuration (I selected the 7100LC cpu) on my 715/80. I was
> > successfully running the 2.4.0 kernel from 0.9.2 cd-image.
> >
> > Any ideas what went wrong?
>
> Nope; two hints.  First, you can look up 102ee3c4 and 1010afd0 in your
> System.map -- that'll tell you which function it's in and what function
> called it, respectively.  Secondly, you can define EARLY_BOOTUP_DEBUG
> in arch/parisc/kernel/pdc_cons.c and recompile.  That'll show where it
> dies.  This crash concerns me a little since I tested CVS kernel a couple
> of days ago on a 715/80.

Sorry it took so long to do further debugging... Anyway the System.map
says:

102ee3a0 ? parisc_hardware_description
1010ae98 T alloc_pa_dev

I do have an extra card (X25-card as far as I can remember) on expansion
slot. I recompiled the kernel with the "EARLY_BOOTUP_DEBUG" and here are
the results:

...
ext2_mount(partition 3) returns 0
ext2_open(/boot/vmlinux-2.4.9) = 3
ELF32 executable
Entry 001000d0 first 00100000 n 4
Segment 0 load 00100000 size 1712560 mediaptr 0x1000
Segment 1 load 002a4000 size 281808 mediaptr 0x1a4000
Segment 2 load 002ec000 size 385024 mediaptr 0x1e9000
Segment 3 load 0037f510 size 88000 mediaptr 0x247510
branching to kernel entry point 0x001000d0
Linux version 2.4.9-pa13 (root@linox04) (gcc version 3.0.2 20010825
(Debian prerelease)) #1 Tue Sep 4 18:46:12 EEST 2001
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: Older Legacy Box
model   00006190 00000481 00000000 00000000 7804f0a4 00000000 00000004
00000072 00000072
vers    0000000b
CPUID   vers 0 rev 0
model   9000/715
Total Memory: 256 Mb
On node 0 totalpages: 65536
zone(0): 65536 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Searching for devices...

Dumping Stack from 10348000 to 10348980:
8000 00000000 00000000 00000000 00000000 102b6fa0 00000000 00000000
ffffffff
....

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
r28-31   00000000 00000000 10348980 f0012870
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 102ee3c4 102ee3b4
 IIR: 0c201093    ISR: 00000000  IOR: 2000003c
 ORIG_R28: 00000000


- Goodi
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°
