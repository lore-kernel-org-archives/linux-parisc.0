Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43A2F4A18
	for <parisc-linux@lists.parisc-linux.org>; Wed, 31 Jan 2001 12:06:36 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA13473
	for <parisc-linux@puffin.external.hp.com>; Wed, 31 Jan 2001 12:02:29 -0700
Date: Wed, 31 Jan 2001 13:04:43 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.4.1 Bits Won't Drive C100 
In-Reply-To: <200101311813.KAA29222@milano.cup.hp.com>
Message-ID: <Pine.LNX.4.21.0101311234240.28937-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 31 Jan 2001, Grant Grundler wrote:

> Greg Ingram wrote:
> > 
> > Howdy,
> > 
> > Just tried the lastest 2.4.1 bits from CVS and it barfs on my C100.  
> > Output follows.
> 
> Greg,
> was this using the default .config?

Er, no, using the config I've been using.

> ie the following sequence:
> cvs update -A

Okay, no changes.

> make distclean

Ouch.

> make oldconfig

Couple of new items.  Left as default, no.

> make dep

Fails trying to make dependancies for reiserfs.  Hmm... double checked
and, no, I'm not asking for it.  Why isn't in our tree?  Well, I copied it
from stock 2.4.1 sources.  Now dependancies build.

> make palo

Hold on.  [ Time passes.  Greg visits the coffee pot. ] Aha!  The kernel
differs.  Hold on again, I'll try booting this one.  Kablooey!  Rats.  
Output differs and is appended below.  A lot of the differences seem
related to the change in kernel size.
 
> (where cvs update reports no changes)
> 
> 
> > No CPUs reported by firmware - probing...
> > Found CPU at fffa0000
> > CPU(s): 1 x PA7200 (PCX-T') at 100.000000 MHz
> 
> This is the output I was worried wouldn't work based on my recent changes.
> It seems to be ok.
> 
> 
> > SCSI subsystem driver Revision: 1.00
> > zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
> > ncr53c8xx: 53c720 detected
> 
> drivers/scsi/ncr53c8xx.c hasn't changed in a while:
> | revision 1.14
> | date: 2000/11/15 20:02:43;  author: rhirst;  state: Exp;  lines: +2 -2
> | Allow lasi and zalon scsi in the same kernel
> 
> However, it looks like drivers/scsi/scsi_ioctl.c did:
> | revision 1.6
> | date: 2001/01/25 00:01:45;  author: willy;  state: Exp;  lines: +32 -44
> | 
> | Linus 2.4.0 merge (take one)
> | ----------------------------
> | revision 1.5
> | date: 2000/11/10 21:43:28;  author: bame;  state: Exp;  lines: +5 -0
> | merge with 2.4.0-test10
> ...
> 
> Or have you been able to boot kernels since the 2.4.0 merge?

Yes, my latest working kernel is:

	Linux apollos 2.4.0 #7 Fri Jan 26 10:52:17 CST 2001 parisc unknown

> I don't have time to chase this further (unless it crashes a box
> I'm using :^). Any other takers?

I'm going to experiment with some config changes now.

- Greg

HARD Booted.
palo ipl root@ingram Mon Jan 15 12:24:52 CST 2001
0/vmlinux 2155870 bytes @ 0x6800
0/palo-cmdline 'vmlinux HOME=/ TERM=linux root=/dev/sda3 rw'
Kernel: partition 0 file vmlinux
ELF32 executable

Entry 00100160 first 00100000 n 5
Segment 0 load 00100000 size 1438608 mediaptr 0x1000
Segment 1 load 00260000 size 173432 mediaptr 0x161000
Segment 2 load 0028c000 size 119640 mediaptr 0x18c000
Segment 3 load 002ac000 size 8192 mediaptr 0x1aa000
Segment 4 load 002d85c8 size 528 mediaptr 0x1ac5c8
branching to kernel entry point 0x00100160
Set default PSW W bit to 0
PDC Console Initialized
The 32-bit Kernel has started...
FP[0] enabled: Rev 1 Model 11
Free memory starts at: 0xc02d9000
start_parisc(0x504d70,0x504d70,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux root=/dev/sda3 rw'
PALO initrd 0-0
model   00005920 00000481 00000000 00000002 782482ee 100000f0 00000004 0000008a 0000008a
vers    0000000d
cpuid   0000016d
CPUID   vers 11 rev 13
model   9000/777/C100
led_init: chassis info: model=2 (LED), lcd_width=0, cmd_delay=40, ret0=8, ret1=8
LED display at f0190001 registered
Searching for devices in PDC firmware... processor hpa 0xfffa0000
a newer box...
Found devices:
1. Coral SGC Graphics (10) at 0xf6000000, versions 0x4, 0x0, 0x77, 0x0, 0x0
2. SkyHawk 100/120 FW-SCSI (4) at 0xf5f8c000, versions 0x1f, 0x0, 0x89, 0x0, 0x80
3. U2-IOA BC GSC+ Port (7) at 0xf5fbf000, versions 0x501, 0x1, 0xc, 0x0, 0x0,  additional addresses: 0xf5f80000 
4. Raven T' Core BA (11) at 0xffd00000, versions 0x32, 0x0, 0x81, 0x0, 0x0,  additional addresses: 0xffd0c000 0xffc00000 
5. Raven T' Lasi Core RS-232 (10) at 0xffd05000, versions 0x32, 0x0, 0x8c, 0x0, 0x0
6. Raven T' Core SCSI (10) at 0xffd06000, versions 0x32, 0x0, 0x82, 0x0, 0x0
7. Raven T' Core LAN (802.3) (10) at 0xffd07000, versions 0x32, 0x0, 0x8a, 0x0, 0x0
8. Raven T' Core Centronics (10) at 0xffd02000, versions 0x32, 0x0, 0x74, 0x0, 0x0,  additional addresses: 0xffd01000 0xffd03000 
9. Raven T' Core PC Floppy (10) at 0xffd0a000, versions 0x32, 0x0, 0x83, 0x0, 0x0
10. Raven T' Audio (10) at 0xffd04000, versions 0x32, 0x0, 0x7b, 0x0, 0x0
11. Raven T' Core PC Keyboard (10) at 0xffd08000, versions 0x32, 0x0, 0x84, 0x0, 0x0
12. Raven T' Core PC Keyboard (10) at 0xffd08100, versions 0x32, 0x0, 0x84, 0x0, 0x0
13. Raven T' Wax BA (11) at 0xffe00000, versions 0x1e, 0x0, 0x8e, 0x0, 0x0,  additional addresses: 0xffe03000 0xffe06000 
14. Raven T' Wax EISA BA (11) at 0xfc000000, versions 0x1e, 0x0, 0x90, 0x0, 0x0,  additional addresses: 0xffc88400 0xf4000000 
15. Raven T' Wax RS-232 (10) at 0xffe02000, versions 0x1e, 0x0, 0x8c, 0x0, 0x80
16. Raven T' Wax HIL (10) at 0xffe01000, versions 0x1e, 0x0, 0x73, 0x0, 0x0
That's a total of 16 devices.
No CPUs reported by firmware - probing...
Found CPU at fffa0000
CPU(s): 1 x PA7200 (PCX-T') at 100.000000 MHz
Linux version 2.4.1 (root@ingram) (gcc version 2.96 20000925 (experimental)) #2 Wed Jan 31 12:41:12 CST 2001
free_bootmem(0x2da000, 0x7d26000)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/sda3 rw
Calibrating delay loop... 99.73 BogoMIPS
Memory: 125836k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
Found i82596 at 0xffd07000, IRQ 87
early initialization of device eth0 is deferred
Initializing Lasi PS/2-keyboard port at 0xffd08000...
Support for Lasi PS/2-psaux not yet available !
Wax at 0xffe00000 found.
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
Lasi PS/2 transmit buffer timeout
Lasi PS/2 transmit buffer timeout
lp0: using parport0 (interrupt-driven).
block: queued sectors max/low 83538kB/27846kB, 256 slots per queue
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize

Dumping Stack from c7f9c000 to c7f9ca00:
c000 00000000 00000040 00000000 00000000 c02754a0 00000001 00000000 ffffffff
c020 00000000 00000000 00000000 00000000 00000000 00000000 ffffffff c0275364
c040 c0275364 00000032 c7f90000 c02ac000 c027a60c 00000000 00000000 00000000
c060 00000000 00000000 00000000 00000001 00000000 00000000 00000000 00000000
c080 00000000 c02ac000 c02ac000 c7f7c000 00000000 00000000 c7f7c098 c02ac098
c0a0 00000000 c02c819c 00000000 c7f9c0ac c7f9c0ac c7f9c908 00000000 00000000
c0c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c0e0 c7f9c000 c0119d98 00000000 00000012 00000000 00000000 00000025 00000000
c100 00000037 00000000 00000000 00000000 00000000 00000000 00000000 80000000
c120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1c0 00000000 fffffeff 00000000 ffffffff 00000000 c02760b8 ffffffff ffffffff
c1e0 ffffffff ffffffff ffffffff ffffffff 00800000 05000000 00000000 ffffffff
c200 ffffffff ffffffff 00000800 00000800 00000400 00000400 ffffffff ffffffff
c220 ffffffff ffffffff ffffffff ffffffff 00007377 61707065 72000000 00000000
c240 00000000 00000000 00000000 00000000 00000000 00000000 00008000 21998304
c260 00000000 c01416ec 00010000 c7ffeba0 c022778c c02387f0 000000f0 00504d70
c280 00000000 c011817c c02c7000 00008000 21998304 c02c7000 00000000 0004000a
c2a0 0000003c 0000003e c0275000 00000001 c02b3ba7 00000004 c02b3b83 00000000
c2c0 c01002cc 0000003e 00000000 00000024 0000000b c02754d4 c0275000 f00000ac
c2e0 f00000a4 000000ff ffd05800 ffd05800 ffd05800 00000060 ffffffff ffd05800
c300 002b3540 c0260000 00000000 00000000 c02ac8c0 00000000 000b0800 00000000
c320 0000001f 00000000 0000001f 00000000 0000001f 00000000 00000000 00000000
c340 00000000 00000000 00000000 00000000 00000000 00000000 00000010 00000020
c360 7f7fffff ffffffff 43ebebeb e0000000 00000000 00000000 45e69c6a 25b7ea20
c380 41800000 00000000 00000010 00000010 00000000 00000000 00000040 00000080
c3a0 00000100 00000200 00000400 00000800 7fffffff 7fffffff 41000000 00000000
c3c0 7fffffff 7fffffff 40800000 00000000 41000000 00000000 40300000 00000000
c3e0 40200000 00000000 40200000 00000000 41800000 7fffffff 40000000 00000000
c400 40000000 00000000 40800000 00000000 41000000 00000000 00000000 00000000
c420 c7f9c800 c0105cf4 00000000 00000000 00000000 00000000 00000000 00000000
c440 c0118168 c011816c 40800000 00000000 0027b000 00000000 c027a040 c027a064
c460 00000000 c027a204 00000000 00000000 00000000 c7f9c470 00000000 00000000
c480 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c4a0 cf7928b3 9ef25167 3de4a2cf 7bbff0cc f70954ca ee12a995 dc25532b b84aa657
c4c0 70954caf e15c2c0c c2b85819 8570b033 0ae16067 15b4759c 2b1e5e6a 564a0986
c4e0 ace2a65e 59c54cbd b3fc2c28 c0105c48 cf8605f0 9f0c0be1 3e1817c3 7c469ad4
c500 c02ac000 00000000 c02ac640 c7dc07d7 8fb80faf 1f701f5f 3e968bec 7d5ba28a
c520 fac1f046 f583e08d eb07c11b c01002e0 ac1f046f 583e08df b00aa4ec 601549d9
c540 c05c26e0 80b84dc1 01709b83 02978254 c7f9c000 c027a60c c02ac000 00000000
c560 c02ac640 aea9ca4e 5d53949d bad19c68 75a338d1 eb30c4f0 d66189e1 acc313c3
c580 59862787 b37afa5c 66f5f4b9 cd9d5c20 9b3ab841 36757083 6c9c5454 d94e1dfa
c5a0 b29c3bf5 653877eb ca065a84 c028d15c 28196a13 50446174 a0fe77ba 41fcef75
c5c0 00000000 c027e000 0e4b1bb0 1ce08232 00000060 00000001 00000001 c0254bec
c5e0 99146cbb 3228d977 642707bc c028d090 90717455 20e2e8ab 41b36404 83107d5a
c600 c02a9358 c02a9308 00000000 00000000 00000000 c7f9c614 c7f9c614 c0235d18
c620 00000000 00000000 00000000 c0291858 c7f9c614 c02ca800 c02a9358 c02a92e8
c640 c0278800 00000000 00000000 00000000 0000004d 00000000 c028d930 0004000a
c660 000000f0 c02c8000 c02ca800 c0292424 c02c7000 c02a9358 c02a92f8 c02c7000
c680 c02ca800 c0260000 c02c7000 c02a9358 c02a930c 00006cc6 00014652 c0242348
c6a0 00000000 00000000 c02ca800 c02923e0 c02c7000 00010800 c7f9c608 c02754d4
c6c0 000000f0 c02c8000 c02ca800 c0260000 c02c7000 000003fc c02a930c 0000004d
c6e0 00000000 c028d930 0004000a c02a0cf8 c02c8000 c02ca800 c0260000 c02c7000
c700 c0284000 c01e5e40 ffffffff c0283cb0 c7ffc200 00001000 00000010 c024280c
c720 c02c7000 c02c3fb0 c01e5e40 c0297434 c0283de0 c0283c80 c7f9c900 00000000
c740 ffffffff 0000ffe0 080009e8 832b003e 00000000 00000008 0004000a 000000f0
c760 c02c8000 c0284000 c01e5e40 ffffffff c0283cb0 c7ffc200 c02bd000 c027e000
c780 00000063 00000008 c7f9c758 000000ff ffd05800 ffd05800 c0283c85 00000060
c7a0 ffffffff ffd05800 002b3540 c02971c0 00000000 00000000 c7f9c980 00000000
c7c0 0004000b c02c7800 c02971c0 00000000 c7ffc200 ffffffff c01e5e40 c0284000
c7e0 c02c8000 000000f0 00000000 c028d930 00000000 0000004d 00000001 00000000
c800 f00010f4 f00000ac f00000a4 00000000 c7f9c74e 00000002 c0297424 ffd07000
c820 c7f9c750 00000f20 00000000 c0260000 00000001 00000000 c7f9ca00 002b1638
c840 000b0800 00000000 0000001f 00000000 0000001f 00000000 0000001f 00000000
c860 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c880 00000010 00000020 7f7fffff ffffffff 43ebebeb e0000000 00000000 00000000
c8a0 45e69c6a 25b7ea20 41800000 00000000 00000010 00000010 00000000 00000000
c8c0 00000040 00000080 00000100 00000200 00000400 00000800 7fffffff 7fffffff
c8e0 41000000 00000000 7fffffff 7fffffff 40800000 00000000 41000000 00000000
c900 40300000 00000000 40200000 00000000 40200000 00000000 41800000 7fffffff
c920 40000000 00000000 40000000 00000000 40800000 00000000 41000000 00000000
c940 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c960 00000000 00000000 c02971dc c02971e0 00000000 00000000 c7f9cb40 00000000
c980 00000000 c0275000 00000001 c02b3bc6 0000001f 0e681096 00000000 00000004
c9a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c9c0 00000010 00000020 7f7fffff ffffffff 43ebebeb e0000000 00000000 00000000
c9e0 45e69c6a 25b7ea20 41800000 c0106704 00000010 00000010 00000000 00000000

Data access rights fault in kernel: Code=26 regs=c7f9c7c0 (Addr=00000004)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001011
r0-3     00000000 c02c7800 c02971c0 00000000
r4-7     c7ffc200 ffffffff c01e5e40 c0284000
r8-11    c02c8000 000000f0 00000000 c028d930
r12-15   00000000 0000004d 00000001 00000000
r16-19   f00010f4 f00000ac f00000a4 00000000
r20-23   c7f9c74e 00000002 c0297424 ffd07000
r24-27   c7f9c750 00000f20 00000000 c0260000
r28-31   00000001 00000000 c7f9ca00 002b1638
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: c02971dc c02971e0
 IIR: 0e681096    ISR: 00000000  IOR: 00000004
ORIG_R28: c0275000
 
