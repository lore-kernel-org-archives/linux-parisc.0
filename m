Return-Path: <wrooney@ihug.co.nz>
Received: from grunt1.ihug.co.nz (grunt1.ihug.co.nz [203.109.254.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id CC918488E
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Mar 2004 05:24:20 -0700 (MST)
Message-ID: <000501c414bf$85f743a0$0a01a8c0@wayneroo.inet>
From: "Wayne Rooney" <wrooney@ihug.co.nz>
To: <parisc-linux@lists.parisc-linux.org>
Date: Mon, 29 Mar 2004 00:23:40 +1200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Trouble booting hp9000 k class model k250 (longish)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Hello list.

I have acquired an HP 9000 K class server, model K250.

I woud like to install Linux on it but I am having a spot of trouble getting
it to boot from a Linux cd.

I've been using Linux on x86 for a couple of years but this is my first
parisc computer and I don't know much about the platform yet.

I've done enough research in the last week to know I need a "-PDC-" image or
a kernel after, what was it, 2.4.19?

Anyway, I've tried booting a couple of iso's, and they both hang at the
point where the serial driver loads.

If anyone could suggest a handling I would very much appreciate it.

Data follows:

The first iso was palinux-2.4.21-pa6-20030718-netinst.iso which was
downloaded from http://www.pateam.org/cd-images/testing/ and it produces:


Firmware Version  36.51

Duplex Console IO Dependent Code (IODC) revision 4

----------------------------------------------------------------------------
--
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
----------------------------------------------------------------------------
--

  Processor   Speed            State           CoProcessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------
      0      160  MHz   Active                 Functional            1 MB
      1      160  MHz   Idle                   Functional            1 MB

  Central Bus Speed (in MHz)  :        120
  Available Memory            :     524284  KB
  Good Memory Required        :      42240  KB

   Primary boot path:    10/12/5.2      (dec)
   Alternate boot path:  10/0.6         (dec)
   Console path:         10/4/0.0       (dec)
   Keyboard path:        10/12/7.0      (dec)

CPU 0
  WARNING:  Memory has been initialized, but not tested as a result of
            FASTBOOT being enabled.  To test memory, use the FASTBOOT
            command in the Configuration menu and reboot the system.


Processor is starting autoboot process.

To discontinue, press any key within 10 seconds.

10 seconds expired.
Proceeding...

Trying Primary Boot Path
------------------------

Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

Boot image contains:
    0/vmlinux32 4046404 bytes @ 0x458800
    0/vmlinux64 5358339 bytes @ 0x834800
    0/ramdisk 2660614 bytes @ 0xd51000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'ramdisk_size=8192 root=/dev/ram console=ttyS0
TERM=vt1
02 palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Selected ramdisk: /ramdisk from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing
32-bit ke
rnelELF32 executable
Entry 00100138 first 00100000 n 5
Segment 0 load 00100000 size 2238020 mediaptr 0x1000
Segment 1 load 00324000 size 726600 mediaptr 0x224000
Segment 2 load 003d8000 size 8192 mediaptr 0x2d6000
Segment 3 load 003e0000 size 32768 mediaptr 0x2d8000
Segment 4 load 0040a33c size 114976 mediaptr 0x2e033c
Loading ramdisk 2660614 bytes @ 1fd65000...
Branching to kernel entry point 0x00100138.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.21-32 (root@k2000) (gcc version 3.0.4) #1 Fri Jul 18
01:59:14
CEST 2003
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005a40 00000491 00000000 00000002 1c77f42d 100000f1 00000008
000000b2 00
0000b2
vers  00000205
CPUID vers 14 rev 9 (0x000001c9)
model 9000/802/K250
Total Memory: 512 Mb
initrd: 2fd65000-2ffee906
initrd: reserving 1fd65000-1ffee906 (mem_max 20000000)
pagetable_init
On node 0 totalpages: 131072
zone(0): 131072 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: ramdisk_size=8192 root=/dev/ram console=ttyS0
TERM=vt102 pa
lo_kernel=0/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 319.48 BogoMIPS
Memory: 512188k available
Dentry cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode cache hash table entries: 32768 (order: 6, 262144 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb
2. U2-IOA BC GSC+ Port (7) at 0xf103f000 [8/63], versions 0x501, 0x1, 0xc
3. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, 0xb
4. Mohawk Core FW-SCSI (4) at 0xf1800000 [10/0], versions 0x44, 0x0, 0x89
5. Gecko BOA BC GSC+ Port (7) at 0xf1804000 [10/4], versions 0x500, 0x0, 0xc
6. Sahp Baat Kiuh AP/MUX (5) at 0xf1900000 [10/4/0], versions 0x44, 0x0, 0xd
7. Wizard SCSI (4) at 0xf1904000 [10/4/4], versions 0x4, 0x0, 0x3b
8. unknown device (2) at 0xf1908000 [10/4/8], versions 0x4, 0x0, 0x5f
9. Interphase NIO-100BaseTX (4) at 0xf1910000 [10/4/16], versions 0x4, 0x0,
0x38
2
10. Gecko BOA BC HP-PB Port (7) at 0xf193c000 [10/4/60], versions 0x103,
0x0, 0x
c
11. Shrike Add-on FW-SCSI (4) at 0xf1808000 [10/8], versions 0x14, 0x1, 0x89
12. Mohawk Core BA (11)t 0xffd00000 [10/12], versions 0x44, 0x0, 0x81,
addition
al addresses: 0xffd0c000 0xffc00000
13. Mohawk Core Centronics (10) at 0xffd02000 [10/12/0], versions 0x44, 0x0,
0x7
4,  additional addresses: 0xffd01000 0xffd03000
14. Mohawk Core SCSI (10) at 0xffd06000 [10/12/5], versions 0x44, 0x0, 0x82
15. Mohawk Core LAN (802.3) (10) at 0xffd07000 [10/12/6], versions 0x44,
0x0, 0x
8a
16. Mohawk Core PS/2 Port (10) at 0xffd08000 [10/12/7], versions 0x44, 0x0,
0x84

17. Mohawk Core PS/2 Port (10) at 0xffd08100 [10/12/8], versions 0x44, 0x0,
0x84

18. U2-IOA BC GSC+ Port (7) at 0xf183f000 [10/63], versions 0x501, 0x1, 0xc
19. Mohawk 160 U 1M DC3- (K250) (0) at 0xfffa0000 [32], versions 0x5a4, 0x0,
0x4

20. Mohawk 160 U 1M DC3- (K250) (0) at 0xfffa2000 [34], versions 0x5a4, 0x0,
0x4

21. Memory (1) at 0xfffb1000 [49], versions 0x53, 0x0, 0x9
CONFIG_SMP=n  ignoring additional CPUs
CPU(s): 1 x PA8000 (PCX-U) at 160.000000 MHz
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
LED display at ffd0c000 registered
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch support not available.
Starting kswapd
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
STI GSC/PCI graphics driver version 0.9
pty: 256 Unix98 ptys configured
PDC Software Console version 0.3 (2001-11-17), christoph.plattner@gmx.at
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI en
abled

Stack Dump:
 2fff8740:  0006000f 844650f4 eec9f818 4223287a
 2fff8730:  7764fc0c 101635c4 00000001 0000000f
 2fff8720:  103eee6b 10337810 10337b68 0000000f
 2fff8710:  10337810 fffff14b 10337810 103f3010
 2fff8700:  0000000f f000011c f0000124 f0001580
 2fff86f0:  0000021e 103a2dd4 00000200 0000000f

Kernel addresses on the stack:
 [<101635c4>]  [<10122e6c>]  [<1011e1e4>]  [<101d52a0>]
 [<101002ac>]  [<10108c4c>]  [<10108cf4>]  [<10102538>]
 [<1011d9e0>]  [<10163008>]  [<1011db64>]  [<101635c4>]
 [<1011ded4>]  [<1010029c>]  [<10163858>]  [<101215f8>]


Kernel Fault: Code=26 regs=2fff8740 (Addr=0000000c)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001111 Not tainted
r00-03  00000000 10334010 103a2dd4 10400810
r04-07  00000008 103ff010 00000013 0000002f
r08-11  103c34 10337bac 10000080 10337810
r12-15  000000f2 000000fa f0140000 00000007
r16-19  f0001580 f0000124 f000011c 00000000
r20-23  00000002 00000000 10400928 00000000
r24-27  00000093 00000002 00000093 10324010
r28-31  00000000 0000002f 2fff8740 103a2d88
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10110d58 10110d5c
 IIR: 0e781096    ISR: 00000000  IOR: 0000000c
 CPU:        0   CR30: 2fff8000 CR31: 103e0000
 ORIG_R28: 00000000


The second iso was livecd-hppa-beta_04.iso downloaded from
http://gentoo.chem.wisc.edu/gentoo/experimental/hppa/livecd/ which produced
the following output:

Firmware Version  36.51

Duplex Console IO Dependent Code (IODC) revision 4

----------------------------------------------------------------------------
--
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
----------------------------------------------------------------------------
--

  Processor   Speed            State           CoProcessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------
      0      160  MHz   Active                 Functional            1 MB
      1      160  MHz   Idle                   Functional            1 MB

  Central Bus Speed (in MHz)  :        120
  Available Memory            :     524284  KB
  Good Memory Required        :      42240  KB

   Primary boot path:    10/12/5.2      (dec)
   Alternate boot path:  10/0.6         (dec)
   Console path:         10/4/0.0       (dec)
   Keyboard path:        10/12/7.0      (dec)

CPU 0
  WARNING:  Memory has been initialized, but not tested as a result of
            FASTBOOT being enabled.  To test memory, use the FASTBOOT
            command in the Configuration menu and reboot the system.


Processor is starting autoboot process.

To discontinue, press any key within 10 seconds.

10 seconds expired.
Proceeding...

Trying Primary Boot Path
------------------------

Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl 1.2 root@b180l.da-kot Tue Apr  8 12:43:07 CEST 2003

Boot image contains:
    0/vmlinux32 3308755 bytes @ 0x17d7800
    0/ramdisk 1522047 bytes @ 0xf800

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: ' TERM=linux root=/dev/ram0 init=/linuxrc
console=ttyS0
 palo_kernel=0/vmlinux-32'
Selected kernel: /vmlinux-32 from partition 0
Selected ramdisk: initrd from partition 0
ELF32 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 1873764 mediaptr 0x1000
Segment 1 load 002ca000 size 623560 mediaptr 0x1cb000
Segment 2 load 00364000 size 8192 mediaptr 0x264000
Segment 3 load 00368000 size 32768 mediaptr 0x266000
Segment 4 load 00390324 size 100976 mediaptr 0x26e324
Loading ramdisk 1522047 bytes @ 1fe7b000...
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.20-pa32 (root@b180l.da-kot) (gcc version 3.2.2) #1 Fri May
9 2
0:31:04 Local time zone must be set--see zic manua
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel hs started...
Determining PDC firmware type: System Map.
model 00005a40 00000491 00000000 00000002 1c77f42d 100000f1 00000008
000000b2 00
0000b2
vers  00000205
CPUID vers 14 rev 9 (0x000001c9)
model 9000/802/K250
Total Memory: 512 Mb
initrd: 2fe7b000-2ffee97f
initrd: reserving 1fe7b000-1ffee97f (mem_max 20000000)
pagetable_init
On node 0 totalpages: 131072
zone(0): 131072 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line:  TERM=linux root=/dev/ram0 init=/linuxrc console=ttyS0
palo
_kernel=0/vmlinux-32
Console: colour dummy device 160x64
Calibrating delay loop... 319.48 BogoMIPS
Memory: 513804k available
Dentry cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode cache hash table entries: 32768 (order: 6, 262144 bytes)
Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb
2. U2-IOA BC GSC+ Port (7) at 0xf103f000 [8/63], versions 0x501, 0x1, 0xc
3. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, 0xb
4. Mohawk Core FW-SCSI (4) at 0xf1800000 [10/0], versions 0x44, 0x0, 0x89
5. Gecko BOA BC GSC+ Port (7) at 0xf1804000 [10/4], versions 0x500, 0x0, 0xc
6. Sahp Baat Kiuh AP/MUX (5) at 0xf1900000 [10/4/0], versions 0x44, 0x0, 0xd
7. Wizard SCSI (4) at 0xf1904000 [10/4/4], versions 0x4, 0x0, 0x3b
8. unknown device (2) at 0xf1908000 [10/4/8], versions 0x4, 0x0, 0x5f
9. Interphase NIO-100BaseTX (4) at 0xf1910000 [10/4/16], versions 0x4, 0x0,
0x38
2
10. Gecko BOA BC HP-PB Port (7) at 0xf193c000 [10/4/60], versions 0x103,
0x0, 0x
c
11. Shrike Add-on FW-SCSI (4) at 0xf1808000 [10/8], versions 0x14, 0x1, 0x89
12. Mohawk Core BA (11) at 0xffd00000 [10/12], versions 0x44, 0x0, 0x81,
additi
onal addresses: 0xffd0c000 0xffc00000
13. Mohawk Core Centronics (10) at 0xffd02000 [10/12/0], sions 0x44, 0x0,
0x74,
 additional addresses: 0xffd01000 0xffd03000
14. Mohawk Core SCSI (10) at 0xffd06000 [10/12/5], versions 0x44, 0x0, 0x82
15. Mohawk Core LAN (802.3) (10) at 0xffd07000 [10/12/6], versions 0x44,
0x0, 0x
8a
16. Mohawk Core PS/2 Port (10) at 0xffd08000 [10/12/7], versions 0x44, 0x0,
0x84

17. Mohawk Core PS/2 Port (10) at 0xffd08100 [10/12/8], versions 0x44, 0x0,
0x84

18. U2-IOA BC GSC+ Port (7) at 0xf183f000 [10/63], versions 0x501, 0x1, 0xc
19. Mohawk 160 U 1M DC3- (K250) (0) at 0xfffa0000 [32], versions 0x5a4, 0x0,
0x4

20. Mohawk 160 U 1M DC3- (K250) (0) at 0xfffa2000 [34], versions 0x5a4, 0x0,
0x4

21. Memory (1) at 0xfffb1000 [49], versions 0x53, 0x0, 0x9
CONFIG_SMP=n  ignoring additional CPUs
CPU(s): 1 x PA8000 (PCX-U) at 160.000000 MHz
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
LED display at ffd0c000 registered
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch support not available.
Starting kswapd
Journalled Block Device driver loaded
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI en
abled

Stack Dump:
 2fe6c700:  0006000f f000011c f0000124 f0001580
 2fe6c6f0:  00000007 101631cc 10382308 102ddb48
 2fe6c6e0:  00008124 1038801c 00000000 10387810
 2fe6c6d0:  10364000 102dd810 00000001 102ddfa0
 2fe6c6c0:  102ddfa0 00000000 102aa000 1038063c
 2fe6b0:  00000000 1033dfc0 000000bc 102dd810

Kernel addresses on the stack:
 [<101631cc>]  [<10164c70>]  [<1011e208>]  [<10100174>]
 [<10108c4c>]  [<10108cf4>]  [<101395d8>]  [<1010b55c>]
 [<1013666c>]  [<1011db30>]  [<10137024>]  [<1011dee0>]
 [<10100164>]  [<101631cc>]  [<10121510>]

Kernel Fault: Code=26 regs=2fe6c700 (Addr=0000000c)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001111 Not tainted
r00-03  00000000 102da010 1033dfc0 10389010
r04-07  00000013 00000000 10387810 0000002f
r08-11  102ebc84 102ebc84 102dd810 102da810
r12-15  000000f2 000000fa f0140000 00000007
r16-19  f0001580 f0000124 f000011c 00000000
r20-23  00000002 00000000 10389510 00000000
r24-27  00000093 00000002 00000093 102ca010
r28-31  00000000 0000002f 2fe6c700 1033df74
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101109e8 101109ec
 IIR: 0e781096    ISR: 00000000  IOR: 0000000c
 CPU:        0   CR30: 2fe6c000 CR31: 10368000
 ORIG_R28: 30313233



Addidtional data:  I don't have a keyboard or a mouse plugged into it -
access is through the serial console.
Thanks for your time.

Cheers,  Wayne
