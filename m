Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from localhost.localdomain (1490223.cipherkey.com [64.114.149.223])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B8494829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Jan 2003 01:05:12 -0700 (MST)
Received: from vilmos.org (my [127.0.0.1])
	by localhost.localdomain (8.12.5/8.12.5) with ESMTP id h097tb0v003655
	for <parisc-linux@lists.parisc-linux.org>; Wed, 8 Jan 2003 23:55:37 -0800
Received: (from vilmos@localhost)
	by vilmos.org (8.12.5/8.12.5/Submit) id h097tadb003653
	for parisc-linux@lists.parisc-linux.org; Wed, 8 Jan 2003 23:55:36 -0800
Date: Wed, 8 Jan 2003 23:55:36 -0800
From: Vilmos Soti <vilmos@vilmos.org>
Message-Id: <200301090755.h097tadb003653@vilmos.org>
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Printing problem with HP9000 712/80 and two more questions
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

Hello,

I have an old HP9000 712/80 box which I would like to use as an
internal file/print server. The printing doesn't work. I tried
the original kernel which came with Debian, I also tried to cross
compile (on a much faster P3 600MHz) numerous kernels, and I also
tried 2.4.20-pa18 from ftp://ftp.parisc-linux.org. I tried to
permute every option regarding the printer in the kernel config
file, and in all cases, including the default Debian kernel and
the 2.4.20-pa18, I consistently cannot get the printer work.

The printer is a HP LaserJet 1100 connected to the parallel port. The
printer works fine on an Intel box, so it is hopefully not a printer
problem. Whenever I try to print from the HPPA box (even something
like "cat /etc/passwd > /dev/lp0"), absolutely nothing happens.

Here are some relevant files:
cat /proc/iomem
00000000-03ffffff : System RAM
  00000000-000009ff : PDC data (Page Zero)
  00100000-002fbfff : Kernel code
  002fc000-003fbcd3 : Kernel data
f0100000-f01fffff : Lasi
  f0100000-f0100fff : Lasi
  f0102000-f0102fff : Parallel
  f0104000-f0104fff : Lasi Harmony
  f0105000-f0105fff : Serial RS232
  f0106000-f0106fff : Lasi SCSI
  f0107000-f0107fff : Apricot
  f0108000-f010800f : keyboard
  f0108100-f01090ff : Lasi psaux
f0500000-f05fffff : Lasi
  f0500000-f0500fff : Lasi
  f0505000-f0505fff : Serial RS232
f8000000-f8000fff : sti (native)
f8100000-f84fffff : stifb mmio
f9000000-f9ffffff : stifb
fff80000-fffaffff : Central Bus
fffb0000-fffdffff : Local Broadcast
  fffbe000-fffbefff : CPU
fffe0000-ffffffff : Global Broadcast

/proc/interrupts
          CPU00
 32:   37262217      PARISC-CPU  timer
 33:     176500      PARISC-CPU  lasi
 34:          0      PARISC-CPU  lasi
 69:       1022            Lasi  keyboard
 82:          9            Lasi  harmony
 86:     126441            Lasi  lasi710
 87:      49028            Lasi  i82596
 88:          0            Lasi  parport0

Here is the dmesg of the box. I won't break the lines so it is
easier to read.

Linux version 2.4.20-pa18 (bame@dsl2) (gcc version 3.0.3) #1 Fri Dec 27 06:12:20 MST 2002
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00006010 00000481 00000000 00000000 77da0338 00000000 00000004 00000072 00000072
vers  00000009
model 9000/712
Total Memory: 64 Mb
pagetable_init
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sda2 HOME=/ console=tty0 sti=1 sti_font=VGA8x16 TERM=linux palo_kernel=2/boot/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 79.66 BogoMIPS
Memory: 61624k available
Dentry cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Searching for devices...
Found devices:
1. Gecko 80 GSC Core Graphics (10) at 0xf8000000 [1], versions 0x1c, 0x0, 0x85
2. Gecko 80 Core BA (11) at 0xf0100000 [2], versions 0x1c, 0x0, 0x81
3. Gecko 80 Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x1c, 0x0, 0x82
4. Gecko 80 Core LAN (802.3) (10) at 0xf0107000 [2/0/2], versions 0x1c, 0x0, 0x8a
5. Gecko 80 Core RS-232 (10) at 0xf0105000 [2/0/4], versions 0x1c, 0x0, 0x8c
6. Gecko 80 Core Centronics (10) at 0xf0102000 [2/0/6], versions 0x1c, 0x0, 0x74
7. Gecko 80 Audio (10) at 0xf0104000 [2/0/8], versions 0x1c, 0x0, 0x7b
8. Gecko 80 Core PC Floppy (10) at 0xf010a000 [2/0/10], versions 0x1c, 0x0, 0x83
9. Gecko 80 Core PS/2 Port (10) at 0xf0108000 [2/0/11], versions 0x1c, 0x0, 0x84
10. Gecko 80 Core PS/2 Port (10) at 0xf0108100 [2/0/12], versions 0x1c, 0x0, 0x84
11. Gecko 80 Core BA (11) at 0xf0500000 [6], versions 0x1c, 0x0, 0x81
12. Gecko Optional RS-232 (10) at 0xf0505000 [6/0/4], versions 0x18, 0x0, 0x8c
13. Gecko 80 (712/80) (0) at 0xfffbe000 [8], versions 0x601, 0x0, 0x4
14. Memory (1) at 0xfffbf000 [9], versions 0x38, 0x0, 0x9
CPU(s): 1 x PA7100LC (PCX-L) at 80.000000 MHz
Lasi version 0 at 0xf0100000 found.
Lasi version 0 at 0xf0500000 found.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Gecko-style soft power switch enabled.
Starting kswapd
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
STI GSC/PCI graphics driver version 0.9
STI word mode ROM at f0080000, hpa at f8000000
STI id 2b4ded6d-40a00499, conforms to spec rev. 8.04
STI device: HPA208LC1280
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, id: 2b4ded6d, mmio: 0xf8100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0505800 (irq = 122) is a 16550A
PS/2 keyboard port at 0xf0108000 (irq 69) found, device attached.
PS/2 psaux port at 0xf0108100 (irq 69) found, no device attached.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0107000, IRQ 87
eth0: 82596 at 0xf0107000, 08 00 09 83 F6 4A IRQ 87.
82596.c $Revision: 1.30 $
SCSI subsystem driver Revision: 1.00
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2 
scsi0 : LASI SCSI 53c700
scsi0: (6:0) Synchronous at offset 8, period 100ns
  Vendor: MICROP    Model: 2112              Rev: 4024
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
SCSI device sda: 2051460 512-byte hdwr sectors (1050 MB)
Partition check:
 sda: sda1 sda2 sda3
Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 18 at 0xf0104000, IRQ 82
mice: PS/2 mouse device common for all mice
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :    60.800 MB/sec
   8regs_prefetch:    60.800 MB/sec
   32regs    :    70.800 MB/sec
   32regs_prefetch:    70.800 MB/sec
raid5: using function: 32regs_prefetch (70.800 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 266k freed
Adding Swap: 130836k swap-space (priority -1)
EXT3 FS 2.4-0.9.19, 19 August 2002 on sd(8,2), internal journal
eth0: link ok.


Now one thing I found is that the interrupt count for the
printer port doesn't increase even if I send a file to /dev/lp0
or print through the printer daemon. I tried to run
"tunelp /dev/lp0 -i 0", but it complained about invalied argument
to ioctl (maybe wasn't updated since 2.2?) and it says "using IRQ 88".

Anyone has any idea how to solve this problem?

And two more questions. Is the sound card full duplex? My standard
method of determinig, "cat /dev/audio > /dev/audio" told me that
"Device or resource busy" therefore it seems it is not. Is it true?

The other question. I am using emacs, and I regularly see these messages:

Jan  8 23:52:33 hp kernel: emacs(17795): unaligned access to 0x001cdaf2 at ip=0x0008937f
Jan  8 23:52:33 hp kernel: emacs(17795): unaligned access to 0x001cdaf2 at ip=0x0008930b

What are they?

TIA, Vilmos
