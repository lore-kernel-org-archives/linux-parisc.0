Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maestro.symsys.com (maestro.symsys.com [208.223.9.37])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A67F482A
	for <parisc-linux@parisc-linux.org>; Sat,  9 Feb 2002 15:02:02 -0700 (MST)
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id QAA08170
	for <parisc-linux@parisc-linux.org>; Sat, 9 Feb 2002 16:01:56 -0600
Date: Sat, 9 Feb 2002 16:01:56 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@parisc-linux.org
In-Reply-To: <20020209205842.B1173@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0202091555570.7869-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] lp0 kablooie
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Writing data from my C100 to /dev/lp0 makes the kernel go kablooie.  It's
the kernel from the recent (0.9.3?) iso.  Known problem?  Any more info I
could supply that would help?  I've appended everything on the console
from the crash, through the power cycle, to mounting disks again.  

- Greg

# echo >/dev/lp0

Dumping Stack from 15608000 to 15608700:
8000 00000000 00000100 00000000 00000001 1029f180 00000001 00000000 ffffffff
8020 00000008 00000000 00000000 17ff1120 00000000 00000000 ffffffff 1029c400
8040 157b403c 0003bc02 10334000 150dc000 17ff1120 102a14b8 00000000 00000012
8060 00000000 00000000 80000000 000000e7 000000e7 00000000 000000e7 000000e7
8080 00000001 105d0000 105d0000 00000000 00000000 150dc000 15608098 15608098
80a0 00000000 1029e46c 156080a8 156080a8 00000000 00000000 00000000 00000000
80c0 00000000 00000000 00000000 00000000 00000000 00000000 0003b848 15608000
80e0 1011cb2c 00000008 00000010 00000001 00000003 0000232d 00000008 0000045d
8100 000000a2 000002d9 00000000 0000001a 00000095 00000000 80000000 00000000
8120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000001
8140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
8160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
8180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
81a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
81c0 fffffeff 00000000 fffffeff 00000000 102a01a0 ffffffff ffffffff ffffffff
81e0 ffffffff ffffffff ffffffff 00800000 05000000 00000000 ffffffff ffffffff
8200 ffffffff 000007b3 000007b3 00000400 00000400 ffffffff ffffffff ffffffff
8220 ffffffff ffffffff ffffffff 00006261 73680000 72000000 00000000 00000000
8240 00000000 17ffe000 00000000 00000000 00000000 00000000 00000000 000c3c8c
8260 4011bd73 00000080 00000020 00000002 00000000 00000008 000938e0 0000003d
8280 00000000 000d5f08 ffffffff 00000000 ffffffff 00000000 00000000 000b9f04
82a0 00017800 401ef190 00000004 40174e3c 4011bd2c 00000000 00000001 000c8408
82c0 00000001 000b9f04 0000000a 000003c1 faf00980 40174e47 00000000 00000000
82e0 00000000 00000000 00000000 00000000 00000000 00000000 1029f010 00000001
8300 00000001 1014c12c 00000002 103308bc 105d0000 102a4600 102a4060 00000002
8320 0000004d 00000000 000000f0 1029f010 00000001 102a1010 1028c010 102bb810
8340 1028c010 1013a540 102cd298 102a1010 00000000 00000000 100a5000 102a4600
8360 00000000 00000002 00000000 000000f0 1029f010 100a5000 102a4600 00000000
8380 00000002 00000000 00000000 00000001 00000001 66666667 00000001 ffffffff
83a0 3fe00000 00000000 412e8480 00000000 0004000e 100aa120 ffffff05 00000001
83c0 1028c010 1013a698 100a9000 102a1ed0 00000000 00000000 0000035b 0000035b
83e0 00000000 0000035b 0000035b 0000035b 0000035b 0000035b 0000035b 0000035b
8400 0008f497 0008f49b 90569779 0000004d 0000000a 15608940 10106cf0 0000001c
8420 0f941200 0000035b 000da000 1038a240 fff00000 40000000 00000000 00000000
8440 100401e0 10041040 1006d0c0 00000000 00000000 00000000 15608454 00000000
8460 00000000 00000000 00000000 00000000 00000000 00000000 00000001 00000004
8480 f7025555 00000006 73746172 74005555 55550000 00000000 00000000 00000000
84a0 54025555 000cd5a0 cfcfcfcf 10107750 55555555 cfcfcfcf cfcfcfcf 55555555
84c0 40028544 000193a7 40174e3c 4011bd2c 00000000 faf00c80 000bfde6 00000001
84e0 000c01e6 401f7190 00039e96 10107f80 faf00288 00036248 00036248 00002000
8500 00000003 00000001 faf006c0 faf006c0 401ef190 401ef190 00000000 00000000
8520 000c005e 00000000 00000000 1013aa7c 401ea3f0 00000001 000c8408 00000001
8540 000da0c8 10041040 00000000 17fff480 10041040 00000000 17fff480 00000080
8560 00000000 00000522 3a7721d9 1013b0f4 3a7585ba 00000000 3a7585ba 00000000
8580 ffffffff 00000000 000bff04 000d5f08 00000000 00000001 00093000 401ef190
85a0 000c8408 00000001 ffffffea 17fff480 00000b01 00000000 3c48490f 00000000
85c0 17fff4e0 00000001 fffffff7 10041040 15608510 00000008 49261604 00000000
85e0 15109da0 00000000 00000000 101ae23c 00094800 000c3704 00000003 15608510
8600 102b1744 102b1744 00000001 00000b01 00000003 000caf08 000b9f04 100a5000
8620 000001b6 000001b6 00000b01 101ae0c0 00001000 17ff1120 00001000 17ffebf8
8640 00000000 00000001 102b1744 000c8408 00000040 102b1748 00000000 000bff04
8660 00000000 0000003d 000938e0 1013a698 0000000f 0000035b 000da000 15608258
8680 15138c80 17fff480 ffffffeb ffffffeb 100a5005 00000003 0026aae2 00000000
86a0 00000000 00000000 00000000 101adfc0 00000000 100a5000 15608590 00000b02
86c0 00000000 10037260 00000000 15138c80 17fff480 00000005 00000cbd 00000a31
86e0 17ff113c 15608258 0011131a 10164ffc 000b9f04 15109e20 10037260 00000000

Kernel Fault: Code=26 regs=15608700 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111
r0-3	 00000000 1029c010 101adfc0 000000ff
r4-7	 00000000 102b1744 00000000 00000000
r8-11	 00000000 102b1010 000c8408 1504d000
r12-15	 105d9260 00000000 102b1010 000c0326
r16-19	 00000000 000b9f04 00017800 00000000
r20-23	 00002801 0000008a 1018f034 17fff4a0
r24-27	 ffd02801 ffffffd0 0000008a 1028c010
r28-31	 000001f4 000003c1 15608700 1018bc58
sr0-3	 00000000 0000035b 00000000 0000035b
sr4-7	 00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1010d09c 1010d0a0
 IIR: 0e601096    ISR: 00000000  IOR: 00000000
 CPU:        0   CR30: 15608000 CR31: 10338000
 ORIG_R28: 00000000

[ power cycle ]

Firmware Version  1.2

Duplex Console IO Dependent Code (IODC) revision 0

------------------------------------------------------------------------------
   (c) Copyright 1990-1996, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------

      0      100  Mhz   Active                 Functional          256 KB

  Central Bus Speed (in mhz)  :        100  
  Available Memory (bytes)    :  134217728  
  Good Memory Required (bytes):   26447872  


   Primary boot path:    core.LAN.0.0.0.0.0.0
   Alternate boot path:  core.FWSCSI.6.0
   Console path:         GRAPHICS3
   Keyboard path:        core.PS2


Searching for device(s) with bootable media
This may take several minutes.

To discontinue search, press any key (termination may not be immediate).


   Path Number      Device Path                   Device Type and Utilities
---------------------------------------------------------------------------
   P0               core.FWSCSI.6.0               SEAGATE ST32430W             
                                                   IPL
   P1               core.SCSI.0.0                 SEAGATE ST11200N SUN1.05     
                                                   IPL
   P2               core.LAN.192.168.1.64.3.254   192.168.1.64                 
                                                   IPL



Enter Path Number or Device Path to continue boot sequence.  Enter NO to go
to main menu.
> p1
Interact with IPL (Y or N)?> n

Booting... 
Boot IO Dependent Code (IODC) revision 0


HARD Booted.
palo ipl 0.96 root@smallone Sun Nov 11 23:23:30 UTC 2001

Partition Start(MB) End(MB) Id Type
1               1      32   f0 Palo
2              33     161   82 swap
3             162    1004   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 3122078 bytes @ 0x48000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently  used by firmware (serial).

Command line for kernel: 'root=/dev/sdb3 HOME=/ console=ttyS0 TERM=vt102'
Selected kernel: /boot/vmlinux from partition 3
Opening /boot/vmlinux
Opening /boot/vmlinux-2.4.9-32
ELF32 executable
Entry 00100000 first 00100000 n 6
Segment 0 load 00100000 size 1618208 mediaptr 0x1000
Segment 1 load 0028c000 size 287728 mediaptr 0x18d000
Segment 2 load 002d4000 size 379072 mediaptr 0x1d4000
Segment 3 load 00334000 size 8192 mediaptr 0x231000
Segment 4 load 00338000 size 32768 mediaptr 0x233000
Segment 5 load 003750e8 size 83184 mediaptr 0x23b0e8
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.9-32 (root@paer) (gcc version 3.0.2 (Debian)) #1 Fri Nov 30 19:36:30 MST 2001
FP[0] enabled: Rev 1 Model 11
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model	00005920 00000481 00000000 00000002 782482ee 100000f0 00000004 0000008a 0000008a
vers	0000000d
cpuid	0000016d
CPUID	vers 11 rev 13
model	9000/777/C100
Total Memory: 128 Mb
pagetable_init
On node 0 totalpages: 32768
zone(0): 32768 pages.
zone(1): 0 pages.
zone(2): 0 pages.
LED display at f0190001 registered
Kernel command line: root=/dev/sdb3 HOME=/ console=ttyS0 TERM=vt102
Console: colour dummy device 160x64
Calibrating delay loop... 99.73 BogoMIPS
Memory: 126200k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0x7, 0xb
2. SkyHawk 100/120 FW-SCSI (4) at 0xf5f8c000 [8/12], versions 0x1f, 0x0, 0x89
3. Raven T' Core BA (11) at 0xffd00000 [8/16], versions 0x32, 0x0, 0x81,  additional addresses: 0xffc00000 
4. Raven T' Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x32, 0x0, 0x74,  additional addresses: 0xffd03000 
5. Raven T' Audio (10) at 0xffd04000 [8/16/1], versions 0x32, 0x0, 0x7b
6. Raven T' Lasi Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x32, 0x0, 0x8c
7. Raven T' Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x32, 0x0, 0x82
8. Raven T' Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x32, 0x0, 0x8a
9. Raven T' Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x32, 0x0, 0x84
10. Raven T' Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x32, 0x0, 0x84
11. Raven T' Core PC Floppy (10) at 0xffd0a000 [8/16/10], versions 0x32, 0x0, 0x83
12. Raven T' Wax BA (11) at 0xffe00000 [8/20], versions 0x1e, 0x0, 0x8e,  additional addresses: 0xffe06000 
13. Raven T' Wax HIL (10) at 0xffe01000 [8/20/1], versions 0x1e, 0x0, 0x73
14. Raven T' Wax RS-232 (10) at 0xffe02000 [8/20/2], versions 0x1e, 0x0, 0x8c
15. Raven T' Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x1e, 0x0, 0x90,  additional addresses: 0xf4000000 
16. U2-IOA BC GSC+ Port (7) at 0xf5fbf000 [8/63], versions 0x501, 0x1, 0xc
17. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0x7, 0xb
18. Coral SGC Graphics (10) at 0xf6000000 [10/20], versions 0x4, 0x0, 0x77
19. Raven 100 T' (0) at 0xfffa0000 [32], versions 0x592, 0x0, 0x4
20. SkyHawk 100/120 (1) at 0xfffb1000 [49], versions 0x49, 0x0, 0x9
CPU(s): 1 x PA7200 (PCX-T') at 100.000000 MHz
ccio found U2 at 0xfff88000
io_io_low: 0xf5f80000
21. SkyHawk 100/120 FW-SCSI (4) at 0xf5f8c000 [8/12], versions 0x1f, 0x0, 0x89
22. Raven T' Core BA (11) at 0xffd00000 [8/16], versions 0x32, 0x0, 0x81,  additional addresses: 0xffc00000 
23. Raven T' Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x32, 0x0, 0x74,  additional addresses: 0xffd03000 
24. Raven T' Audio (10) at 0xffd04000 [8/16/1], versions 0x32, 0x0, 0x7b
25. Raven T' Lasi Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x32, 0x0, 0x8c
26. Raven T' Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x32, 0x0, 0x82
27. Raven T' Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x32, 0x0, 0x8a
28. Raven T' Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x32, 0x0, 0x84
29. Raven T' Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x32, 0x0, 0x84
30. Raven T' Core PC Floppy (10) at 0xffd0a000 [8/16/10], versions 0x32, 0x0, 0x83
31. Raven T' Wax BA (11) at 0xffe00000 [8/20], versions 0x1e, 0x0, 0x8e,  additional addresses: 0xffe06000 
32. Raven T' Wax HIL (10) at 0xffe01000 [8/20/1], versions 0x1e, 0x0, 0x73
33. Raven T' Wax RS-232 (10) at 0xffe02000 [8/20/2], versions 0x1e, 0x0, 0x8c
34. Raven T' Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x1e, 0x0, 0x90,  additional addresses: 0xf4000000 
35. U2-IOA BC GSC+ Port (7) at 0xf5fbf000 [8/63], versions 0x501, 0x1, 0xc
ccio found U2 at 0xfff8a000
io_io_low: 0xf5fc0000
36. Coral SGC Graphics (10) at 0xf6000000 [10/20], versions 0x4, 0x0, 0x77
37. U2-IOA BC GSC+ Port (7) at 0xf5fff000 [10/63], versions 0x501, 0x1, 0xc
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax: HIL Keyboard-NMI registered.
Wax EISA Adapter found at 0xfc000000
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
STI byte mode ROM at f6000000, hpa=f6000000
STI byte mode ROM, id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071A
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio: 0xf6100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xffd05800 (irq = 90) is a 16550A
ttyS01 at iomem 0xffe02800 (irq = 121) is a 16550A
Lasi PS/2 receive buffer timeout
PS/2 keyboard port at 0xffd08000 (irq 69) found, no device attached.
Lasi PS/2 transmit buffer timeout
PS/2 psaux port at 0xffd08100 (irq 69) found, no device attached.
Found HIL at 0xffe01000, IRQ 126
HIL: no keyboard present.
Warning : device (10, 0x1e, 0x0, 0x73) NOT claimed by HIL
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xffd07000, IRQ 87
eth0: 82596 at 0xffd07000, 08 00 09 E8 83 2B IRQ 87.
82596.c $Revision: 1.26 $
SCSI subsystem driver Revision: 1.00
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3b-20010512
  Vendor: SEAGATE   Model: ST32430W          Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 02
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
scsi1: (0:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST11200N SUN1.05  Rev: 8358
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
Attached scsi disk sdb at scsi1, channel 0, id 0, lun 0
ncr53c720-0-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
Partition check:
 sda: unknown partition table
scsi1: (0:0) Enabling Tag Command Queuing
SCSI device sdb: 2059140 512-byte hdwr sectors (1054 MB)
 sdb: sdb1 sdb2 sdb3
Lasi Harmony Audio rev. 33 at 0xffd04000, using IRQ 82
sticonsole_init: searching for STI ROMs
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
INIT: version 2.84 booting
