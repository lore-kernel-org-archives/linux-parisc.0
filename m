Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta07-svc.ntlworld.com (mta07-svc.ntlworld.com [62.253.162.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 20F98482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 28 Jul 2001 08:38:26 -0600 (MDT)
Received: from homer.intra.qzxyz.com ([213.104.66.118])
          by mta07-svc.ntlworld.com (InterMail vM.4.01.03.00 201-229-121)
          with ESMTP
          id <20010728143824.KZXM710.mta07-svc.ntlworld.com@homer.intra.qzxyz.com>
          for <parisc-linux@lists.parisc-linux.org>;
          Sat, 28 Jul 2001 15:38:24 +0100
Received: from edna.intra.qzxyz.com ([192.168.42.126] helo=talk21.com)
	by homer.intra.qzxyz.com with esmtp (Exim 3.12 #1 (Debian))
	id 15QVEW-0001oy-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 28 Jul 2001 15:38:24 +0100
Sender: ashcroft@dsl2.external.hp.com
Message-ID: <3B62CE5F.31181B7A@talk21.com>
Date: Sat, 28 Jul 2001 15:38:23 +0100
From: Scott Ashcroft <scott.ashcroft@talk21.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Tracking down crash in 2.4.6 kernels on B160L
List-ID: <linux-parisc.vger.kernel.org>

I've rebuilt a kernel with EARLY_BOOTUP_DEBUG defined in
linux/arch/parisc/kernel/pdc_console.c so I get some console output
before the crash.

The boot log looks like:

Firmware Version  4.7

Duplex Console IO Dependent Code (IODC) revision 1

Memory Test/Initialization Completed

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  Cache
Size
  ---------  --------   ---------------------  ----------------- 
----------
      0      160 MHz    Active                 Functional          64 KB


  Available memory (bytes)    :  134217728
  Good memory required (bytes):  134217728

  Primary boot path:    SESCSI.6.0
  Alternate boot path:  SESCSI.6.0
  Console path:         SERIAL_1.9600.8.none
  Keyboard path:        PS2

Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

Booting...
Boot IO Dependent Code (IODC) revision 153

HARD Booted.
palo ipl 0.93 bame@palinux Wed Jul 11 11:08:57 MDT 2001
0/vmlinux32 2622963 bytes @ 0x8210000
Partition Start(MB) End(MB) Id Type
1               1     129   82 swap
2             130     139   f0 Palo
3             140    2046   83 ext2

Command line: 'root=/dev/sda3 HOME=/ TERM=linux console=ttyS0 debug'

Kernel: partition 3 file /vmlinux
ext2 block size 4096
ext2_mount(partition 3) returns 0
ext2_open(/vmlinux) = 3
ELF32 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 1500308 mediaptr 0x1000
Segment 1 load 00270000 size 368640 mediaptr 0x170000
Segment 2 load 0030e74c size 75984 mediaptr 0x1ca74c
branching to kernel entry point 0x00100000
Linux version 2.4.6-pa22 (root@nelson) (gcc version 3.0 (Debian)) #5 Sat
Jul 28 14:40:32 BST 2001
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: Newer Box
model   00005020 00000481 00000000 02020202 7747d770 100000f0 00000004
000000ba 000000ba
vers    00000008
cpuid   000001e8
CPUID   vers 15 rev 8
model   9000/778/B160L
Total Memory: 128 Mb
On node 0 totalpages: 32768
zone(0): 32768 pages.
zone(1): 0 pages.
zone(2): 0 pages.
PDC reported no LCD or LED.
Searching for devices...
Found devices:
1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0,
0x0, 0x0, 0x0<6>
2. Merlin L2 160 (9000/778/B160L) (0) at 0xfffbe000, versions 0x502,
0x0, 0x4, 0x0, 0x81<6>
3. Merlin 160/ThunderHawk Memory (1) at 0xfffbf000, versions 0x67, 0x0,
0x9, 0x0, 0x0<6>
4. Merlin 160 Core BA (11) at 0xffd00000, versions 0x3d, 0x0, 0x81, 0x0,
0x0<6>,  additional addresses: <6>0xffd0c000 <6>0xffc00000 <6>
5. Merlin 160 Core RS-232 (10) at 0xffd05000, versions 0x3d, 0x0, 0x8c,
0x0, 0x0<6>
6. Merlin 160 Core SCSI (10) at 0xffd06000, versions 0x3d, 0x0, 0x82,
0x0, 0x0<6>
7. Merlin 160 Core LAN (802.3) (10) at 0xffd07000, versions 0x3d, 0x0,
0x8a, 0x0, 0x0<6>
8. Merlin 160 Core Centronics (10) at 0xffd02000, versions 0x3d, 0x0,
0x74, 0x0, 0x0<6>,  additional addresses: <6>0xffd01000 <6>0xffd03000
<6>
9. Merlin 160 Core Audio (10) at 0xffd04000, versions 0x3d, 0x4, 0x7b,
0x0, 0x0<6>
10. Merlin 160 Core PS/2 Port (10) at 0xffd08000, versions 0x3d, 0x0,
0x84, 0x0, 0x0<6>
11. Merlin 160 Core PS/2 Port (10) at 0xffd08100, versions 0x3d, 0x0,
0x84, 0x0, 0x0<6>
12. Merlin 160 Wax BA (11) at 0xffe00000, versions 0x41, 0x0, 0x8e, 0x0,
0x0<6>
13. Merlin 160 Wax EISA BA (11) at 0xfc000000, versions 0x41, 0x0, 0x90,
0x0, 0x0<6>,  additional addresses: <6>0xf0184000 <6>
14. Merlin 160 Wax HIL (10) at 0xffe01000, versions 0x41, 0x0, 0x73,
0x0, 0x0<6>
15. Merlin 160 Wax RS-232 (10) at 0xffe02000, versions 0x41, 0x0, 0x8c,
0x0, 0x0<6>
16. Gecko GSC Core Graphics (10) at 0xf8000000, versions 0x16, 0x0,
0x85, 0x0, 0x0<6>,  additional addresses: <6>0xf0011000 <6>
17. Dino PCI Bridge (13) at 0xfff80000, versions 0x680, 0x1, 0xa, 0x0,
0x0<6>
18. Merlin+ 132 Dino PS/2 Port (10) at 0xfff81000, versions 0x22, 0x0,
0x96, 0x0, 0x0<6>
19. Merlin+ 132 Dino RS-232 (10) at 0xfff83000, versions 0x22, 0x0,
0x8c, 0x0, 0x0<6>
That's a total of 19 devices.
CPU(s): 1 x PA7300LC (PCX-L2) at 160.000000 MHz
Kernel command line: root=/dev/sda3 HOME=/ TERM=linux console=ttyS0
debug
Console: colour dummy device 160x64
Initialized PDC Console for debugging.
Calibrating delay loop... 106.49 BogoMIPS
Memory: 126616k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
Dino version 2.1 (bridge mode) found at 0xfff80000


The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
Systems shipped after Aug 20, 1997 will not exhibit this problem.
Models affected: C180, C160, C160L, B160L, and B132L workstations.

dino_bridge_init: IO_ADDR_EN hasn't been configured.
kernel BUG at dino.c:806!
Lasi version 0 at 0xffd00000 found.
LED display at ffd0c000 registered
Wax at 0xffe00000 found.
Wax: HIL Keyboard-NMI registered.
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 152 [PCSPP,TRISTATE]
pty: 256 Unix98 ptys configured
lp0: using parport0 (interrupt-driven).
Serial driver version 5.05a (2001-03-20) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
ttyS00 at iomem 0xffd05800 (irq = 154) is a 16550A
ttyS01 at iomem 0xffe02800 (irq = 185) is a 16550A
ttyS02 at iomem 0xfff83800 (irq = 74) is a 16550A

Dumping Stack from 10038000 to 10038840:
8000 00000000 00000040 00000000 00000000 102853c0 00000001 00000000
ffffffff
8020 00000000 00000000 00000000 00000000 00000000 00000000 ffffffff
102852c0
8040 102852c0 00000090 10074000 102c8000 1028b600 00000000 00000000
00000000
8060 00000000 00000000 00000000 00000001 00000000 00000000 00000000
00000000
8080 00000000 102c8000 102c8000 10060000 00000000 00000000 10060098
102c8098
80a0 00000000 102fe51c 100380a8 100380a8 10038808 00000000 00000000
00000000
80c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000
10038000
80e0 10119fa0 00000000 00000075 00000000 00000000 0000004a 00000000
000000be
8100 00000000 00000000 00000000 00000000 00000000 00000000 80000000
00000000
8120 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
8140 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
8160 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
8180 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
81a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
81c0 fffffeff 00000000 ffffffff 00000000 10285f84 ffffffff ffffffff
ffffffff
81e0 ffffffff ffffffff ffffffff 00800000 05000000 00000000 ffffffff
ffffffff
8200 ffffffff 000007ba 000007ba 00000400 00000400 ffffffff ffffffff
ffffffff
8220 ffffffff ffffffff ffffffff 00007377 61707065 72000000 00000000
00000000
8240 00000000 00000000 00000000 00000000 00000000 00000000 f0000c30
f0100000
8260 000000fd ffffffff ffffffff 1029ccd4 0004000e 0000004d 0000004e
f000a37c
8280 00043002 0006e180 00007ba6 00800327 00000000 00000000 00007ba6
00800327
82a0 00007ba6 10286810 ffffffff 1003fba0 10247c1c 0004000e 0000004d
00000000
82c0 10100130 1011841c 00000000 00007ba6 00800327 f0100000 102cf667
102cf666
82e0 00000024 0000003c 0000003e 10285010 00000001 102cf667 00000004
102cf643
8300 00000000 00000023 00000002 0000001d 00007ba6 00000000 ffffffff
00000001
8320 1025c8e4 0006e180 f000a37c 00043002 0006e180 00007ba6 00008124
102cf643
8340 00000000 101581a0 0000001d 00000800 00000000 00000002 002cb140
00000000
8360 002cb088 000003a8 00000000 00000003 ffd05000 00008000 00000005
10286010
8380 1028645c 10108ecc 00000040 00000000 00000000 00000002 0004000f
10000000
83a0 10108ecc 00000007 102cf65f 102701fc 102cf643 00000004 102cf667
00000001
83c0 10285010 10109060 0000003c 00000024 0000000f 102853ec 10285010
f0000174
83e0 00000020 ffd05800 ffd05800 ffd05800 ffd05800 00000060 ffffffff
ffd05800
8400 002cf080 10270010 00000000 00000060 102c88c0 10038740 10105cf8
00000000
8420 0000001f 00000000 0000001f 00000000 0028c000 00000000 1028b040
1028b060
8440 1028b1fc 00000000 00000000 00000000 1003844c 00000000 00000000
00000000
8460 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
8480 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
84a0 00000000 00000000 00000000 10105c4c 00000000 00000000 00000000
00000000
84c0 102c8000 00000000 ffffffff 00000000 00000000 00000000 00000000
00000000
84e0 00000000 00000000 00000000 10100144 00000000 00000000 00000000
00000000
8500 00000000 ffffffff 00000000 00000000 00000000 00000000 00000000
00000000
8520 00000000 00000000 00000000 1029ce6c 00000000 00000000 00000000
00000000
8540 102fe010 10038000 1028b600 102c8000 102c7b64 102c7b20 00000000
1003854c
8560 1003854c 00000000 102c7b64 102a24ec 00000000 00000000 00000000
00000000
8580 102c7b64 1029ccd4 0004000e 0000004d 102fe010 10286f04 1028b600
102c8000
85a0 102c7b64 102c7b18 10038000 102a4120 102c8000 102c7b64 102c7ae8
00000000
85c0 10293670 00000040 102e0400 102e0344 10293670 00000040 1025e298
1025e514
85e0 102df010 102df010 102c7b18 102a3c14 102c8000 102c7b64 102c7b08
10038548
8600 0004fe0f 10296810 102a3c14 10293010 10293738 102e0344 102e0400
10000080
8620 102906bc 0000004d 0004000e 1029ccd4 ffffffff ffffffff 000000fd
f0100000
8640 f0000c30 f0000174 00000020 1025e320 10296cf0 10296ce8 10296810
00000002
8660 10266fcc 102974bc 10293738 10270010 00000000 00000000 10038840
00000000
8680 000f0800 00000000 0000001f 00000000 0000001f 00000000 0000001f
00000000
86a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
86c0 00000010 00000020 7f7fffff ffffffff 43ebebeb e0000000 00000000
00000000
86e0 45e69c6a 25b7ea20 41800000 00000000 00000010 00000010 00000000
00000000
8700 00000040 00000080 00000100 00000200 00000400 00000800 7fffffff
7fffffff
8720 41000000 00000000 7fffffff 7fffffff 40800000 00000000 41000000
00000000
8740 40300000 00000000 40200000 00000000 40200000 00000000 41800000
7fffffff
8760 40000000 00000000 40000000 00000000 40800000 00000000 41000000
00000000
8780 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
87a0 00000000 00000000 102a3c24 102a3c28 f0102918 00000000 00000000
00000002
87c0 002cb140 0000001f 0e601200 00000000 1025e320 00000003 ffd05000
00008000
87e0 00000000 00000000 00000000 10108ecc 00000000 00000000 00000000
00000000
8800 0004000f 10000000 10108ecc 00000001 102cf676 102701fc 102cf646
00000004
8820 102cf678 00000001 10285010 10106748 0000003c 00000035 0000000f
102853ec

Kernel Fault: Code=26 regs=10038600 (Addr=1025e320)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111000001111
r0-3     00000000 10296810 102a3c14 10293010
r4-7     10293738 102e0344 102e0400 10000080
r8-11    102906bc 0000004d 0004000e 1029ccd4
r12-15   ffffffff ffffffff 000000fd f0100000
r16-19   f0000c30 f0000174 00000020 1025e320
r20-23   10296cf0 10296ce8 10296810 00000002
r24-27   10266fcc 102974bc 10293738 10270010
r28-31   00000000 00000000 10038840 00000000
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 102a3c24 102a3c28
 IIR: 0e601200    ISR: 00000000  IOR: 1025e320
 ORIG_R28: 00000000

Looks like it goes bang in probe_serial_pci to me as IAOQ is in that
function.

Full System.map and .config are at:

http://www.qzxyz.com/System.map
http://www.qzxyz.com/kernel.config

I can provide any other info required to track this down.

Cheers,
Scott
