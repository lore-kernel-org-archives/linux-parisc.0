Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA04651
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Feb 2000 05:25:16 -0700
Received: from mgw-i2.ntc.nokia.com (mgw-i2.ntc.nokia.com [131.228.118.61])
	by mgw-x1.nokia.com (8.9.3/8.9.3/o) with ESMTP id NAA13466
	for <parisc-linux@thepuffingroup.com>; Fri, 18 Feb 2000 13:25:48 +0200 (EET)
Received: from stybba.ntc.nokia.com (stybba.ntc.nokia.com [131.228.178.21])
	by mgw-i2.ntc.nokia.com (8.9.3/8.9.3) with ESMTP id NAA05999
	for <parisc-linux@thepuffingroup.com>; Fri, 18 Feb 2000 13:25:47 +0200 (EET)
Received: from gamgee.ntc.nokia.com (martikka@gamgee [131.228.178.130])
	by stybba.ntc.nokia.com (8.9.1a/8.9.1/Goodi) with ESMTP id NAA05797
	for <parisc-linux@thepuffingroup.com>; Fri, 18 Feb 2000 13:25:47 +0200 (EET)
Date: Fri, 18 Feb 2000 13:25:46 +0200 (EET)
From: Hannu Martikka <martikka@stybba.ntc.nokia.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.HPX.4.21.0002181315470.29573-100000@gamgee.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Subject: [parisc-linux] 715/80 - Unexpected Interruption...
List-ID: <linux-parisc.vger.kernel.org>

Hei,

I get following on 715/80 with ramdisk.bin-20000129 and latest from CVS
(linux-2.3):

Model: Mirage 80  with 256 MB RAM (Using 128 MB).
CPU(s): 1 x PA7100LC at 80.000000 MHz
...
11. Unknown device (11) at 0xf0200000, versions 0x10, 0x0, 0x8e, 0x0, 0x0

This is probably EISA addon card that I have on this host (X25-card).

...

RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
eth0: 82596 at 0xf0107000, 08 00 09 4A C5 FC IRQ 535.
lasi_82596.c:v1.2 02/13/2000
eth0: lp at 0xc7f8b000 (1716 bytes), lp->scb at 0xc7f8b014
RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 850 blocks [1 disk] into ram disk... Unexpected
Interruption! Code=15 regs=c7fe8b80
 IASQ: 00000000 00000000 IAOQ: c0141f1c c0141f20
isr 00000000 ior 00000000

PSW  : 0004ff0a  GR 1 : c7fe8a88  GR 2 : c0164e94  GR 3 : c7fe8b40  
GR 4 : c7fe8a80  GR 5 : c7eb8ec0  GR 6 : 0000000a  GR 7 : 00000400  
GR 8 : c02e7678  GR 9 : 00000319  GR10 : 00000100  GR11 : 00000400  
GR12 : 00000000  GR13 : 00000000  GR14 : 00000000  GR15 : 00000000  
GR16 : 00001000  GR17 : 00000400  GR18 : 00000000  GR19 : c7fe8a90  
GR20 : c02e586c  GR21 : c02e586c  GR22 : 0000000b  GR23 : 00000000  
GR24 : 0000000b  GR25 : c7fe8a98  GR26 : 00000000  GR27 : c01f9000  
GR28 : c02e5800  GR29 : 00000001  GR30 : c7fe8cc0  GR31 : 00000000  
SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000  
SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000  
IAOQ : c0141f1c c0141f20
IIR  : 0ee01280

Any ideas?

- Goodi
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°
