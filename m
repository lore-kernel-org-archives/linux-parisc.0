Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id D25BE4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Oct 2002 07:48:29 -0600 (MDT)
Received: from iws1pb05.france.hp.com (unknown [15.124.72.14])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 561F7102
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Oct 2002 15:48:24 +0200 (METDST)
Message-ID: <3DA2E27B.5708975E@hpfrcu81.france.hp.com>
Date: Tue, 08 Oct 2002 15:49:47 +0200
From: phi <phi@hpfrcu81.france.hp.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
References: <3DA2945D.7010301@visoel.de>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] boot (micro) hang
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

Hi All,

I have made no progress today.
Thomas helped to turn on verbosity during boot and remove LED display code,
but yet it fail to boot 'normally' and I still get the micro hang (15 minute).

Here is the boot display.


HARD Booted.
INIT C5FF
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

Partition Start(MB) End(MB) Id Type
1               1      32   f0 Palo
2              33     201   82 swap
3             202    4094   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 2511320 bytes @ 0x48000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=/dev/sda3 HOME=/ ncr53c8xx=burst:3
console=ttyS0
TERM=vt102 palo_kernel=3/boot/vmlinux'
Selected kernel: /boot/vmlinux from partition 3
ELF32 executable
Entry 00100000 first 00100000 n 6
Segment 0 load 00100000 size 2065880 mediaptr 0x1000
Segment 1 load 002fa000 size 453664 mediaptr 0x1fa000
Segment 2 load 0036c000 size 269924 mediaptr 0x269000
Segment 3 load 003b0000 size 8192 mediaptr 0x2ab000
Segment 4 load 003b8000 size 32768 mediaptr 0x2ad000
Segment 5 load 003e1e70 size 104784 mediaptr 0x2b5e70
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.19-pa21 (phi@iws1pb02) (gcc version 3.0.4) #3 Tue Oct 8
15:32:
43 CEST 2002
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 000059c0 00000481 00000000 00000002 77ecd750 100000f0 00000008 000000b2
00
0000b2
vers  00000205
CPUID vers 14 rev 9 (0x000001c9)
capabilities 0x2
model 9000/780/C180
Total Memory: 128 Mb
pagetable_init
On node 0 totalpages: 32768
zone(0): 32768 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sda3 HOME=/ ncr53c8xx=burst:3 console=ttyS0
TERM=
vt102 palo_kernel=3/boot/vmlinux
Console: colour dummy device 160x64
Initialized PDC Console for debugging.
Calibrating delay loop... 359.62 BogoMIPS
Memory: 126368k available
Dentry cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Searching for devices...


=================== micro hang here ==================================

Found devices:
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb
2. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions 0x680, 0x3, 0xa
3. Raven U/L2 Dino PS/2 Port (10) at 0xf2001000 [8/1], versions 0x6, 0x0, 0x96
4. Raven U/L2 Dino RS-232 (10) at 0xf2003000 [8/3], versions 0x6, 0x0, 0x8c
5. Raven U/L2 Core FW-SCSI (4) at 0xf200c000 [8/12], versions 0x3b, 0x0, 0x89
6. Raven U/L2 Core BA (11) at 0xffd00000 [8/16], versions 0x3b, 0x0, 0x81, 
addi
tional addresses: 0xffd0c000 0xffc00000
7. Raven U/L2 Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x3b, 0x0,
0
x74,  additional addresses: 0xffd01000 0xffd03000
8. Raven U/L2 Core Audio (10) at 0xffd04000 [8/16/1], versions 0x3b, 0x4, 0x7b
9. Raven U/L2 Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x3b, 0x0,
0x8c
10. Raven U/L2 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x3b, 0x0, 0x82
11. Raven U/L2 Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x3b,
0x0,
 0x8a
12. Raven U/L2 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x3b, 0x0,
0
x84
13. Raven U/L2 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x3b, 0x0,
0
x84
14. Raven Backplane Wax BA (11) at 0xffe00000 [8/20], versions 0x17, 0x0, 0x8e
15. Raven Backplane Wax HIL (10) at 0xffe01000 [8/20/1], versions 0x17, 0x0,
0x7
3
16. Raven Backplane RS-232 (10) at 0xffe02000 [8/20/2], versions 0x17, 0x0,
0x8c

17. Raven Backplane Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x17,
0x0,
 0x90,  additional addresses: 0xffc88000 0xfc00000b
18. Gecko GSC Core Graphics (10) at 0xfa000000 [8/24], versions 0x16, 0x0,
0x85,
  additional addresses: 0xf0026000
19. U2-IOA BC GSC+ Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1, 0xc
20. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, 0xb
21. U2-IOA BC GSC+ Port (7) at 0xf103f000 [10/63], versions 0x501, 0x1, 0xc
22. Raven U 180 (9000/780/C180) (0) at 0xfffa0000 [32], versions 0x59c, 0x0,
0x4

23. Memory (1) at 0xfffb1000 [49], versions 0x72, 0x0, 0x9
CPU(s): 1 x PA8000 (PCX-U) at 180.000000 MHz
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax EISA Adapter found at 0xfc000000
EISA EEPROM at 0xffc88000
Enumerating EISA bus
EISA slot 1 a configured board was not detected ( expected INP0500)
Dino version 3.1 found at 0xf2000000
Dino: No PCI devices enabled.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch enabled, polling @ 0xf0140000.
Starting kswapd
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
STI GSC/PCI graphics driver version 0.9
STI word mode ROM at f0026000, hpa at fa000000
STI id 2d08c0a7-9a02587, conforms to spec rev. 8.07
STI device: INTERNAL_EG_1280
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, id: 2d08c0a7, mmio: 0xfa100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI
en
abled
ttyS00 at iomem 0xffd05800 (irq = 90) is a 16550A
ttyS01 at iomem 0xffe02800 (irq = 121) is a 16550A
PS/2 keyboard port at 0xffd08000 (irq 69) found, no device attached.
PS/2 psaux port at 0xffd08100 (irq 69) found, no device attached.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xffd07000, IRQ 87
eth0: 82596 at 0xffd07000, 00 60 B0 05 34 7B IRQ 87.
82596.c $Revision: 1.29 $
SCSI subsystem driver Revision: 1.00
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 35
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3b-20010512
ncr53c720-0-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
  Vendor: SEAGATE   Model: ST15150W          Rev: HP10
  Type:   Direct-Access                      ANSI SCSI revision: 02
53c700: Version 2.7 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
Partition check:
 sda: sda1 sda2 sda3
Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 0 at 0xffd04000, IRQ 82
mice: PS/2 mouse device common for all mice
HP SDC: HP SDC reports successful PUP.
HP SDC: HP SDC at 0xffe01000, IRQ 126 (NMI IRQ 125)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :   392.800 MB/sec
   8regs_prefetch:   392.800 MB/sec
   32regs    :   305.600 MB/sec
   32regs_prefetch:   305.600 MB/sec
raid5: using function: 8regs_prefetch (392.800 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
HP SDC: Transaction add failed: transaction already queued?
md: Autodetecting RAID arrays.
HP SDC: Transaction add failed: transaction already queued?
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: read timeout (860942us)!
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 264k freed
INIT: version 2.84 booting
Loading /etc/console/boottime.kmap.gz
Activating swap.
Adding Swap: 173156k swap-space (priority -1)
Checking root file system...
fsck 1.27 (8-Mar-2002)
/dev/sda3: clean, 49882/498976 files, 353001/996735 blocks
System time was Tue Oct  8 12:52:10 UTC 2002.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Tue Oct  8 12:52:03 UTC 2002.
Calculating module dependencies... depmod: Can't open
/lib/modules/2.4.19-pa21/m
odules.dep for writing
done.
Loading modules:
modprobe: Can't open dependencies file /lib/modules/2.4.19-pa21/modules.dep
(No
such file or directory)
Checking all file systems...
fsck 1.27 (8-Mar-2002)
Setting kernel variables.
Mounting local filesystems...
nothing was mounted
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces... eth0: link ok.
done.
R
Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Tue Oct  8 14:52:10 CEST 2002

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.

=============================================================================




The vmlinux.prev boot ok, so no HW should be the root cause.

The vmlinux.prev is


Linux version 2.4.18-pa58 (phi@iws1pb02) (gcc version 3.0.4) #1 Thu Jul 25
13:29
:39 CEST 2002


Any ideas?

Phi
