Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from gw.scieneer.com (gw.scieneer.com [203.44.134.129])
	by dsl2.external.hp.com (Postfix) with ESMTP id 657DF482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 May 2001 23:45:59 -0600 (MDT)
Received: from scieneer.com (IDENT:dtc@dtc-pc.scieneer.com [10.0.0.100])
	by gw.scieneer.com (8.11.0/8.8.7) with ESMTP id f4D5jlH31826
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 May 2001 15:45:52 +1000
Sender: dtc@scieneer.com
Message-ID: <3AFE1F8B.725C1B8B@scieneer.com>
Date: Sun, 13 May 2001 15:45:47 +1000
From: "Douglas T. Crosher" <dtc@scieneer.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] J2240?
List-ID: <linux-parisc.vger.kernel.org>

Even though the J2240 is not reported to be working yet on the
Web pages, it does seem to boot some way. Would anyone have
had any success with this machine, or have workarounds
to the problems below, or know the work that needs to be
done to get this running? Perhaps the following are a clue:

...
dino_bridge_init: IO_ADDR_EN hasn't been configured.
kernel BUG at dino.c:795!
...
IRQ not found for serial device at 0xfffffffffc003000
...

Regards
Douglas Crosher

-=-=-

HARD Booted.
palo ipl <> Sun May 13 11:53:13 EST 2001
0/vmlinux 3466302 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=10.0.0.100 con
sole=ttyS0'
Kernel: partition 0 file /vmlinux
ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 2022944 mediaptr 0x1000
Segment 1 load 002ee000 size 749584 mediaptr 0x1ef000
Segment 2 load 003a8000 size 16384 mediaptr 0x2a7000
branching to kernel entry point 0x00100000
Set default PSW W bit to 1
PDC Console Initialized
Linux version 2.4.0 (<>) (gcc version 3.0 20010427 (prerele
ase)) #7 Sun May 13 15:10:06 EST 2001
FP[0] enabled: Rev 0 Model 14
The 64-bit Kernel has started...
Kernel is using PDC in 32-bit mode.
Determining PDC firmware type: Newer Box
setup_cmdline(0x64cc4,0x64cc4,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=10.0.0.100 console=t
tyS0'
PALO initrd 0-0
model   00005b50 00000491 00000000 00000002 77c5684a 100000f0 00000008 000000b2 
000000b2
vers    00000501
cpuid   000001d7
CPUID   vers 14 rev 23
model   9000/782/J2240
Total Memory: 96 Mb
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 24576
zone(0): 24576 pages.
zone(1): 0 pages.
zone(2): 0 pages.
led_init: chassis info: model=0 (LCD), lcd_width=16, cmd_delay=40, actcnt=137438
953504, maxcnt=0
Searching for devices...
Found devices:
1. SummitHawk Dino RS-232 (10) at 0xfffffffffc003000, versions 0x5d, 0x0, 0x8c, 
0x0, 0x0
2. SummitHawk Dino RS-232 (10) at 0xfffffffff1607000, versions 0x5d, 0x0, 0x8c, 
0x0, 0x0
3. SummitHawk 230 Core BA (11) at 0xffffffffffd00000, versions 0x5c, 0x0, 0x81, 
0x0, 0x0,  additional addresses: 0xffffffffffd0c000 0xffffffffffc00000 
4. SummitHawk 230 Core SCSI (10) at 0xffffffffffd06000, versions 0x5c, 0x0, 0x82
, 0x0, 0x0
5. SummitHawk 230 Core Centronics (10) at 0xffffffffffd02000, versions 0x5c, 0x0
, 0x74, 0x0, 0x0,  additional addresses: 0xffffffffffd01000 0xffffffffffd03000 
6. SummitHawk 230 Core Audio (10) at 0xffffffffffd04000, versions 0x5c, 0x4, 0x7
b, 0x0, 0x0
7. SummitHawk 230 Core PC Keyboard (10) at 0xffffffffffd08000, versions 0x5c, 0x
0, 0x84, 0x0, 0x0
8. SummitHawk 230 Core PC Keyboard (10) at 0xffffffffffd08100, versions 0x5c, 0x
0, 0x84, 0x0, 0x0
9. U2-IOA BC GSC+ Port (7) at 0xfffffffffc03f000, versions 0x501, 0x1, 0xc, 0x3,
 0x0
10. U2-IOA BC GSC+ Port (7) at 0xfffffffff163f000, versions 0x501, 0x1, 0xc, 0x3
, 0x0
11. Cujo PCI Bridge (13) at 0xfffffffff1604000, versions 0x682, 0x1, 0xa, 0x1, 0
x0
12. Dino PCI Bridge (13) at 0xfffffffffc004000, versions 0x680, 0x3, 0xa, 0x0, 0
x0,  additional addresses: 0xfffffffffc800000 
13. Unknown device (13) at 0xfffffffffc000000, versions 0x5d, 0x3, 0xa, 0x0, 0x0
14. U2-IOA BC Runway Port (12) at 0xfffffffffff88000, versions 0x580, 0xf, 0xb, 
0x1, 0x50
15. U2-IOA BC Runway Port (12) at 0xfffffffffff8a000, versions 0x580, 0xf, 0xb, 
0x1, 0x50
16. SummitHawk U+ (0) at 0xfffffffffffa0000, versions 0x5b5, 0x0, 0x4, 0x0, 0x91
17. SummitHawk U+ (0) at 0xfffffffffffa2000, versions 0x5b5, 0x0, 0x4, 0x0, 0x91
18. SummitHawk Memory (1) at 0xfffffffffffb1000, versions 0x83, 0x0, 0x9, 0x0, 0
x0
That's a total of 18 devices.
CONFIG_SMP=n  ignoring additional CPUs
Warning : device (0, 0x5b5, 0x0, 0x4, 0x0) NOT claimed by CPU PARISC
CPU(s): 1 x PA8200 (PCX-U+) at 236.000000 MHz
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=10.0.0.100 console=
ttyS0
Calibrating delay loop... 470.22 BogoMIPS
Memory: 91924k available
Dentry-cache hash table entries: 16384 (order: 6, 262144 bytes)
Buffer-cache hash table entries: 4096 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 6, 262144 bytes)
Inode-cache hash table entries: 8192 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffffffffffd00000 found.
LED display at ffffffffffd0c000 registered
Initializing Lasi PS/2-keyboard port at 0xffffffffffd08000...
Support for Lasi PS/2-psaux not yet available !
Dino version 3.1 (bridge mode) found at 0xfffffffffc004000
Dino version J2240 (bridge mode) found at 0xfffffffffc000000
dino_bridge_init: IO_ADDR_EN hasn't been configured.
kernel BUG at dino.c:795!
ccio found U2 I/O MMU at 0xfffffffffff88000
io_io_high: 0xfff80000 io_io_low: 0xf4000000
ccio found U2 I/O MMU at 0xfffffffffff8a000
io_io_high: 0xf4000000 io_io_low: 0xf1600000
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI ena
bled
busdevice_alloc_irq(0x00000000103ae348): No known LASI/ASP/WAX owns device at 0x
fffffffffc003000 !
IRQ not found for serial device at 0xfffffffffc003000
Warning : device (10, 0x5d, 0x0, 0x8c, 0x0) NOT claimed by serial device 715/new
 or similiar
busdevice_alloc_irq(0x00000000103ae3d0): No known LASI/ASP/WAX owns device at 0x
fffffffff1607000 !
IRQ not found for serial device at 0xfffffffff1607000
Warning : device (10, 0x5d, 0x0, 0x8c, 0x0) NOT claimed by serial device 715/new
 or similiar

Dumping Stack from 0000000010048000 to 0000000010049280:
8000 00000000 00000000 00000000 00000040 00000000 00000000 00000000 10308a40
...
9260 00000000 000000f8 00000000 00000058 00000000 10105764 00000000 102e2e35

Kernel Fault: Code=26 regs=0000000010048f40 (Addr=0000000000000008)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001100000000000001110
r0-3     0000000000000000 00000000103b2600 000000001011023c 000000001034b7f0
r4-7     000000000000ffff 000000000000002f 0000000000000000 000000001034b7f0
r8-11    000000000800000f ffffffffffffffff 000000001031e3b8 00000000103cf988
r12-15   00000000103cf988 00000000103cf988 00000000103cf988 00000000103cf988
r16-19   000000001031e388 00000000103cf988 00000000103cf988 000000000000ffff
r20-23   0000000010326a00 0000000010334090 0000000000000000 0000000000000000
r24-27   000000000000002f 000000000000ffff 0000000000000000 000000001034b7f0
r28-31   0000000000002580 0000000010048e30 0000000010049280 0000000010319d78
sr0-3    0000000000000000 0000000000000000 0000000000000000 0000000000000000
sr4-7    0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000102403d4 00000000102403d8
 IIR: 0cd010d9    ISR: 0000000000000000  IOR: 0000000000000008
ORIG_R28: 0000000000000004
