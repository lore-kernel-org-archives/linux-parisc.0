Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BA5F4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Feb 2001 08:08:17 -0700 (MST)
Sender: marteaut@esiee.fr
Message-ID: <3A9A715F.BDDC8A66@esiee.fr>
Date: Mon, 26 Feb 2001 16:08:15 +0100
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SMP: We have ignition
References: <20010220120709.E31164@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

	Back to school, we tried the last cvs! And the good news are:
- SMP works fine with our A500 :) You will find our dmesg and cpuinfo at
the end!
- 712 boots with the new source.

But, we still have the circular dependency and warning messages about
string.h:

/home/mkltom/cvs/linux/include/linux/string.h:27: warning: conflicting
types for built-in function `strncpy'
/home/mkltom/cvs/linux/include/linux/string.h:33: warning: conflicting
types for built-in function `strncat'
/home/mkltom/cvs/linux/include/linux/string.h:39: warning: conflicting
types for built-in function `strncmp'
/home/mkltom/cvs/linux/include/linux/string.h:61: warning: conflicting
types for built-in function `memset'
/home/mkltom/cvs/linux/include/linux/string.h:64: warning: conflicting
types for built-in function `memcpy'
/home/mkltom/cvs/linux/include/linux/string.h:73: warning: conflicting
types for built-in function `memcmp'

All the compilation has been made by xc-devel-20010215-2.tar.gz
available on pehc

Bye, Thomas
ESIEE Team

Lot of work to do, but soon a new file system will be made at
esiee.fr/puffin (I hope)

DMESG:
The 64-bit Kernel has started...
FP[0] enabled: Rev 1 Model 16
Free memory starts at: 0x1040e000
start_parisc(0x504d70,0x504d70,0x0,0x0)
PALO command line: 'init=/bin/sh HOME=/ TERM=LINUX console=ttyS0
root=/dev/sda3'
PALO initrd 0-0
model   00005d50 00000491 00000000 00000001 5e936f38 100000f0 00000008
000000b2 000000b2
vers    00000301
cpuid   0000024b
CPUID   vers 18 rev 11
model   9000/800/A500-5X
Searching for devices in PDC firmware... processor hpa
0xfffffffffffa0000
Found devices:
1. Crescendo 550 (0) at 0xfffffffffffa0000, versions 0x5d5, 0x0, 0x4,
0x0, 0x91
2. Crescendo 550 (0) at 0xfffffffffffa2000, versions 0x5d5, 0x0, 0x4,
0x0, 0x91
3. Crescendo Memory (1) at 0xfffffffffed08000, versions 0x9b, 0x0, 0x9,
0x0, 0x0
4. Astro BC Runway Port (12) at 0xfffffffffed00000, versions 0x582, 0x0,
0xb, 0x0, 0x10
5. Elroy PCI Bridge (13) at 0xfffffffffed30000, versions 0x782, 0x0,
0xa, 0x0, 0x0
6. Elroy PCI Bridge (13) at 0xfffffffffed34000, versions 0x782, 0x0,
0xa, 0x0, 0x0
7. Elroy PCI Bridge (13) at 0xfffffffffed38000, versions 0x782, 0x0,
0xa, 0x0, 0x0
8. Elroy PCI Bridge (13) at 0xfffffffffed3c000, versions 0x782, 0x0,
0xa, 0x0, 0x0
That's a total of 8 devices.
CPU(s): 2 x PA8600 (PCX-W+) at 550.000000 MHz
Linux version 2.4.0 (a500@pc5158a) (gcc version 2.97 20010128
(experimental)) #4 SMP Mon Feb 26 12:22:43 CET 2001
free_bootmem(0x412000, 0x1fbee000)
pagetable_init
On node 0 totalpages: 131072
zone(0): 65536 pages.
zone(1): 65536 pages.
zone(2): 0 pages.
Kernel command line: init=/bin/sh HOME=/ TERM=LINUX console=ttyS0
root=/dev/sda3
Calibrating delay loop... 1097.72 BogoMIPS
Memory: 500652k available
Dentry-cache hash table entries: 65536 (order: 8, 1048576 bytes)
Buffer-cache hash table entries: 32768 (order: 6, 262144 bytes)
Page-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 32768 (order: 7, 524288 bytes)
POSIX conformance testing by UNIFIX
SMP: bootstrap CPU ID is 0
FP[1] enabled: Rev 1 Model 16
SMP: Total 2 of 2 processors activated (2195.46 BogoMIPS noticed).
lba version TR4.0 (0x5) found at 0xfffffffffed30000
lba range[2] : ignoring GMMIO (0xfffffff804000000)
PCI: dev Symbios Logic Inc. (formerly NCR) 53c896 type 64-bit
PCI: dev Symbios Logic Inc. (formerly NCR) 53c896 (#2) type 64-bit
PCI: dev Symbios Logic Inc. (formerly NCR) 53c896 type 64-bit
PCI: dev Symbios Logic Inc. (formerly NCR) 53c896 (#2) type 64-bit
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba range[2] : ignoring GMMIO (0xfffffff904000000)
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba range[2] : ignoring GMMIO (0xfffffffa04000000)
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
lba range[2] : ignoring GMMIO (0xfffffffb04000000)
SBA found Astro 2.1 at 0xfffffffffed00000
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
PCIBIOS: Enabling device 00:04.0 (0146 -> 0147)
ttyS00 at port 0x0040 (irq = 132) is a 16550A
PCIBIOS: Enabling device 00:05.0 (0000 -> 0143)
ttyS01 at port 0x0500 (irq = 133) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
Linux Tulip driver version 0.9.13 (January 2, 2001)

/* END */

CPUINFO:
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8600 (PCX-W+)
cpu MHz         : 550.000000
model           : 9000/800/A500-5X
model name      : Crescendo 550
hversion        : 0x00005d50
sversion        : 0x00000491
I-cache         : 512 KB
D-cache         : 1024 KB (WB)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 1097.72
processor       : 1
cpu family      : PA-RISC 2.0
cpu             : PA8600 (PCX-W+)
cpu MHz         : 550.000000
model           : 9000/800/A500-5X
model name      : Crescendo 550
hversion        : 0x00005d50
sversion        : 0x00000491
I-cache         : 512 KB
D-cache         : 1024 KB (WB)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 1097.72

/* END */
