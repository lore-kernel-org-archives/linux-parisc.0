Return-Path: <andy@puszczka.com>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3890A48E4
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Mar 2004 04:20:52 -0700 (MST)
Received: from tolstoy.puszczka.com (47.80-202-73.nextgentel.com
	[80.202.73.47])
	by mail.broadpark.no (Postfix) with ESMTP id 9382A34FC
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  8 Mar 2004 12:20:50 +0100 (MET)
Message-ID: <25271.193.161.152.244.1078745317.squirrel@www.puszczka.com>
Date: Mon, 8 Mar 2004 12:28:37 +0100 (CET)
From: "Andy Walker" <andy@puszczka.com>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Subject: [parisc-linux] No PS2 keyboard/mouse on B132L, 2.6.[34]
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

I've a B132L running Gentoo. With 2.4 I had the PS/2 keyboard working fine
throught a Raritan Compuswitch KVM, but the mouse (wireless Intellimouse
clone - 2 buttons pluss roller/middle) was dead. Decided to try out 2.6
partly to excercise udev, but mostly in the hope that all the input layer
work and PS/2 changes would bring the mouse to life. I should probably add
that there are two PCs on the KVM - one running 2.6.3 and one running
2.4.24. Both run the mouse and keyboard flawlessly.

To the point. I grabbed 2.6.3-pa0 from Gentoo hppa-dev-kernel, configured
and compiled it. The keyboard and mouse are both dead. I downloaded
2.6.4-rc1-pa2 from cvs.parisc-linux.org but the result is exactly the same.
Some info below. Clues anybody?

Why is 8/12 (0x00089) reported as unknown in the device table and in
proc/interrupts? Its the Zalon HVD SCSI.

What about the SDC failed transactions. Is that an artifact of having HIL
compiled in but unused?

regards,
-Andy

weasel drivers # uname -a
Linux weasel 2.6.4-rc1-pa2 #2 Sun Mar 7 17:49:32 CET 2004 parisc PA7300LC
(PCX-L2) 9000/778/B132L GNU/Linux

weasel drivers # dmesg
Linux version 2.6.4-rc1-pa2 (root@weasel) (gcc version 3.3.2) #2 Sun Mar 7
17:49:32 CET 2004
FP[0] enabled: Rev 1 Model 15
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005010 00000481 00000000 02020202 77f85570 100000f0 00000004
000000ba 000000ba
vers  00000008
CPUID vers 15 rev 8 (0x000001e8)
capabilities 0x2
model 9000/778/B132L
Total Memory: 384 Mb
On node 0 totalpages: 98304
  DMA zone: 98304 pages, LIFO batch:16
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
LED display at f0190001 registered
Built 1 zonelists
Kernel command line: root=/dev/sda2 HOME=/ console=tty0 sti=8/8
sti_font=VGA8x16 TERM=linux palo_kernel=2/boot/vmlinux
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Memory: 385388k available
Calibrating delay loop... 87.85 BogoMIPS
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. Merlin+ 132 Dino PS/2 Port at 0xfff81000 [1] { 10, 0x0, 0x022, 0x00096
} 2. Merlin+ 132 Dino RS-232 at 0xfff83000 [3] { 10, 0x0, 0x022, 0x0008c }
3. Phantom PseudoBC GSC+ Port at 0xffc00000 [8] { 7, 0x0, 0x504, 0x00000 }
4. Dino PCI Bridge at 0xfff80000 [8/0] { 13, 0x1, 0x680, 0x0000a } 5.
Coral SGC Graphics at 0xf4000000 [8/8] { 10, 0x0, 0x004, 0x00077 } 6.
unknown device at 0xfff8c000 [8/12] { 4, 0x0, 0x03c, 0x00089 }
7. Merlin 132 Core BA at 0xffd00000 [8/16] { 11, 0x0, 0x03c, 0x00081 }, 
additional addresses: 0xffd0c000 0xffc00000
8. Merlin 132 Core Centronics at 0xffd02000 [8/16/0] { 10, 0x0, 0x03c,
0x00074 },  additional addresses: 0xffd01000 0xffd03000
9. Merlin 132 Core Audio at 0xffd04000 [8/16/1] { 10, 0x4, 0x03c, 0x0007b
} 10. Merlin 132 Core RS-232 at 0xffd05000 [8/16/4] { 10, 0x0, 0x03c,
0x0008c } 11. Merlin 132 Core SCSI at 0xffd06000 [8/16/5] { 10, 0x0,
0x03c, 0x00082 } 12. Merlin 132 Core LAN (802.3) at 0xffd07000 [8/16/6] {
10, 0x0, 0x03c, 0x0008a }
13. Merlin 132 Core PS/2 Port at 0xffd08000 [8/16/7] { 10, 0x0, 0x03c,
0x00084 }
14. Merlin 132 Core PS/2 Port at 0xffd08100 [8/16/8] { 10, 0x0, 0x03c,
0x00084 }
15. Merlin 132 Wax BA at 0xffe00000 [8/20] { 11, 0x0, 0x040, 0x0008e } 16.
Merlin 132 Wax HIL at 0xffe01000 [8/20/1] { 10, 0x0, 0x040, 0x00073 } 17.
Merlin 132 Wax RS-232 at 0xffe02000 [8/20/2] { 10, 0x0, 0x040, 0x0008c }
18. Merlin 132 Wax EISA BA at 0xfc000000 [8/20/5] { 11, 0x0, 0x040,
0x00090 },  additional addresses: 0xf0184000
19. Gecko GSC Core Graphics at 0xf8000000 [8/24] { 10, 0x0, 0x016, 0x00085
},  additional addresses: 0xf0011000
20. Merlin L2 132 (9000/778/B132L) at 0xfffbe000 [62] { 0, 0x0, 0x501,
0x00004 }
21. Memory at 0xfffbf000 [63] { 1, 0x0, 0x060, 0x00009 }
CPU(s): 1 x PA7300LC (PCX-L2) at 132.000000 MHz
Lasi version 0 at 0xffd00000 found.
Wax at 0xffe00000 found.
Wax EISA Adapter found at 0xfc000000
EISA EEPROM at 0xf0184000
Enumerating EISA bus
EISA: Probing bus 0 at parisc8:20:5
EISA: Mainboard HWPC000 detected.
EISA: Detected 0 cards.
Dino parisc8:0 version 2.1 found at 0xfff80000
The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
Systems shipped after Aug 20, 1997 will not exhibit this problem.
Models affected: C180, C160, C160L, B160L, and B132L workstations.

Dino parisc8:0: No PCI devices enabled.
SCSI subsystem initialized
STI GSC/PCI core graphics driver Version 0.9a
    id 2bcb015a-9a02587, conforms to spec rev. 8.04
    graphics card name: HPA4071B_LZ
    id 2d08c0a7-9a02587, conforms to spec rev. 8.07
    graphics card name: INTERNAL_EG_1280
fb0: stifb 1280x1024-8 frame buffer device, HPA4071B_LZ, id: 2bcb015a,
mmio: 0xf4100000
fb1: stifb 1280x1024-8 frame buffer device, INTERNAL_EG_1280, id:
2d08c0a7, mmio: 0xf8100000
ikconfig 0.7 with /proc/config*
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
Soft power switch enabled, polling @ 0xf0140000.
Console: switching to colour frame buffer device 160x64
lp: driver loaded but no devices found
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
ttyS0 at MMIO 0xffd05800 (irq = 90) is a 16550A
Serial: device 0xfff83000 not configured.
Enable support for Wax, Lasi, Asp or Dino.
ttyS1 at MMIO 0xffe02800 (irq = 121) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xffd07000, IRQ 87
eth%d: 82596 at 0xffd07000, 00 60 B0 07 1C 2C IRQ 87.
82596.c $Revision: 1.29 $
airo:  Probing for PCI adapters
airo:  Finished probing for PCI adapters
zalon_probe: Zalon vers field is 0x1, IRQ 35
ncr53c720-0: rev 0xf irq 35
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3e
Using anticipatory io scheduler
  Vendor: SEAGATE   Model: ST39173WD         Rev: 5764
  Type:   Direct-Access                      ANSI SCSI revision: 02
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2
scsi1 : LASI SCSI 53c700
scsi1: (2:0) Synchronous at offset 8, period 236ns
  Vendor: TOSHIBA   Model: CD-ROM XM-5401TA  Rev: 1036
  Type:   CD-ROM                             ANSI SCSI revision: 02
st: Version 20040213, fixed bufsize 32768, s/g segs 256
ncr53c720-0-<0,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sda: 17783240 512-byte hdwr sectors (9105 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 >
Attached scsi disk sda at scsi0, channel 0, id 0, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.20
Attached scsi CD-ROM sr0 at scsi1, channel 0, id 2, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 0, lun 0,  type 0
Attached scsi generic sg1 at scsi1, channel 0, id 2, lun 0,  type 5
Console: switching to colour frame buffer device 160x64
mice: PS/2 mouse device common for all mice
serio: GSC PS2 keyboard port at 0xffd08000 irq 69 @ parisc8:16:7
serio: GSC PS2 mouse port at 0xffd08100 irq 69 @ parisc8:16:8
HP SDC: HP SDC reports successful PUP.
HP SDC: HP SDC at 0xffe01000, IRQ 126 (NMI IRQ 125)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware
reset. HP SDC MLC: Registering the System Domain Controller's HIL MLC.
oprofile: using timer interrupt.
NET: Registered protocol family 2
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET: Registered protocol family 1
NET: Registered protocol family 17
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 332k freed
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
HP SDC: read timeout (1537786us)!
Adding 525304k swap on /dev/sda3.  Priority:-1 extents:1
EXT3 FS on sda2, internal journal
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda5, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda6, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda7, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda8, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
eth0: link ok.
weasel drivers #
weasel drivers # cat /proc/interrupts
           CPU00
  2:          0            EISA  cascade
 32:    5268327      PARISC-CPU  timer
 33:      11276      PARISC-CPU  lasi
 34:          0      PARISC-CPU  Dino parisc8:0
 35:      49026      PARISC-CPU  parisc8:12
 39:        433      PARISC-CPU  wax
 69:         50            Lasi  GSC PS2 keyboard, GSC PS2 mouse
 86:         15            Lasi  parisc8:16:5
 87:      11201            Lasi  i82596
 88:          0            Lasi  parport0
 90:         10            Lasi  serial
117:          0             Wax  EISA
125:          0             Wax  HP SDC NMI
126:        433             Wax  HP SDC

weasel drivers # zcat /proc/config.gz

#
# Automatically generated make config: don't edit
#
CONFIG_PARISC=y
CONFIG_MMU=y
CONFIG_STACK_GROWSUP=y
CONFIG_RWSEM_GENERIC_SPINLOCK=y

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=y
CONFIG_CLEAN_COMPILE=y
CONFIG_STANDALONE=y
CONFIG_BROKEN_ON_SMP=y

#
# General setup
#
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_SYSCTL=y
CONFIG_LOG_BUF_SHIFT=15
CONFIG_HOTPLUG=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_EMBEDDED is not set
CONFIG_KALLSYMS=y
CONFIG_FUTEX=y
CONFIG_EPOLL=y
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_AS=y
CONFIG_IOSCHED_DEADLINE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set

#
# Loadable module support
#
CONFIG_MODULES=y
# CONFIG_MODULE_UNLOAD is not set
CONFIG_OBSOLETE_MODPARM=y
CONFIG_MODVERSIONS=y
CONFIG_KMOD=y

#
# Processor type and features
#
# CONFIG_PA7000 is not set
CONFIG_PA7100LC=y
# CONFIG_PA7200 is not set
# CONFIG_PA8X00 is not set
CONFIG_PA11=y
# CONFIG_64BIT is not set
# CONFIG_SMP is not set
# CONFIG_PREEMPT is not set
# CONFIG_HPUX is not set

#
# Bus options (PCI, PCMCIA, EISA, GSC, ISA)
#
CONFIG_GSC=y
CONFIG_HPPB=y
CONFIG_IOMMU_CCIO=y
CONFIG_GSC_LASI=y
CONFIG_GSC_WAX=y
CONFIG_EISA=y
CONFIG_EISA_NAMES=y
# CONFIG_ISA is not set
CONFIG_PCI=y
CONFIG_PCI_LEGACY_PROC=y
CONFIG_PCI_NAMES=y
CONFIG_GSC_DINO=y
CONFIG_PCI_LBA=y
CONFIG_IOSAPIC=y
CONFIG_IOMMU_SBA=y
CONFIG_SUPERIO=y
CONFIG_CHASSIS_LCD_LED=y
CONFIG_PDC_CHASSIS=y

#
# PCMCIA/CardBus support
#
# CONFIG_PCMCIA is not set

#
# PCI Hotplug Support
#
# CONFIG_HOTPLUG_PCI is not set

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
# CONFIG_BINFMT_MISC is not set

#
# Device Drivers
#

#
# Generic Driver Options
#
# CONFIG_FW_LOADER is not set

#
# Memory Technology Devices (MTD)
#
# CONFIG_MTD is not set

#
# Parallel port support
#
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=y
CONFIG_PARPORT_PC_CML1=y
# CONFIG_PARPORT_SERIAL is not set
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
CONFIG_PARPORT_GSC=y
# CONFIG_PARPORT_OTHER is not set
# CONFIG_PARPORT_1284 is not set

#
# Plug and Play support
#

#
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_UMEM is not set
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_CRYPTOLOOP=y
# CONFIG_BLK_DEV_NBD is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_BLK_DEV_INITRD=y
# CONFIG_DCSSBLK is not set

#
# ATA/ATAPI/MFM/RLL support
#
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
CONFIG_CHR_DEV_ST=y
# CONFIG_CHR_DEV_OSST is not set
CONFIG_BLK_DEV_SR=y
# CONFIG_BLK_DEV_SR_VENDOR is not set
CONFIG_CHR_DEV_SG=y

#
# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
#
# CONFIG_SCSI_MULTI_LUN is not set
# CONFIG_SCSI_REPORT_LUNS is not set
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set

#
# SCSI low-level drivers
#
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AHA1740 is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC7XXX_OLD is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_MEGARAID is not set
# CONFIG_SCSI_SATA is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_CPQFCTS is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_EATA is not set
# CONFIG_SCSI_EATA_PIO is not set
# CONFIG_SCSI_FUTURE_DOMAIN is not set
# CONFIG_SCSI_GDTH is not set
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
CONFIG_SCSI_LASI700=y
CONFIG_53C700_MEM_MAPPED=y
CONFIG_53C700_LE_ON_BE=y
CONFIG_SCSI_SYM53C8XX_2=y
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
# CONFIG_SCSI_SYM53C8XX_IOMAPPED is not set
CONFIG_SCSI_ZALON=y
CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS=8
CONFIG_SCSI_NCR53C8XX_MAX_TAGS=32
CONFIG_SCSI_NCR53C8XX_SYNC=20
# CONFIG_SCSI_NCR53C8XX_PROFILE is not set
# CONFIG_SCSI_QLOGIC_ISP is not set
# CONFIG_SCSI_QLOGIC_FC is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
CONFIG_SCSI_QLA2XXX=y
# CONFIG_SCSI_QLA21XX is not set
# CONFIG_SCSI_QLA22XX is not set
# CONFIG_SCSI_QLA2300 is not set
# CONFIG_SCSI_QLA2322 is not set
# CONFIG_SCSI_QLA6312 is not set
# CONFIG_SCSI_QLA6322 is not set
# CONFIG_SCSI_SIM710 is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_DC390T is not set
# CONFIG_SCSI_NSP32 is not set
# CONFIG_SCSI_DEBUG is not set

#
# Multi-device support (RAID and LVM)
#
# CONFIG_MD is not set

#
# Fusion MPT device support
#
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_IEEE1394 is not set

#
# I2O device support
#
# CONFIG_I2O is not set

#
# Macintosh device drivers
#

#
# Networking support
#
CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
CONFIG_PACKET_MMAP=y
CONFIG_NETLINK_DEV=y
CONFIG_UNIX=y
# CONFIG_NET_KEY is not set
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
# CONFIG_IP_PNP_DHCP is not set
CONFIG_IP_PNP_BOOTP=y
# CONFIG_IP_PNP_RARP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_ARPD is not set
# CONFIG_INET_ECN is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
# CONFIG_IPV6 is not set
# CONFIG_DECNET is not set
# CONFIG_BRIDGE is not set
# CONFIG_NETFILTER is not set

#
# SCTP Configuration (EXPERIMENTAL)
#
CONFIG_IPV6_SCTP__=y
# CONFIG_IP_SCTP is not set
# CONFIG_ATM is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_LLC2 is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_NET_DIVERT is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_NET_FASTROUTE is not set
# CONFIG_NET_HW_FLOWCONTROL is not set

#
# QoS and/or fair queueing
#
# CONFIG_NET_SCHED is not set

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
CONFIG_NETDEVICES=y

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_TUN is not set
# CONFIG_ETHERTAP is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=y
# CONFIG_MII is not set
CONFIG_LASI_82596=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_NET_VENDOR_SMC is not set

#
# Tulip family network device support
#
CONFIG_NET_TULIP=y
# CONFIG_DE2104X is not set
CONFIG_TULIP=y
# CONFIG_TULIP_MWI is not set
# CONFIG_TULIP_MMIO is not set
# CONFIG_TULIP_NAPI is not set
# CONFIG_DE4X5 is not set
# CONFIG_WINBOND_840 is not set
# CONFIG_DM9102 is not set
# CONFIG_DEPCA is not set
# CONFIG_HP100 is not set
CONFIG_NET_PCI=y
# CONFIG_PCNET32 is not set
# CONFIG_AMD8111_ETH is not set
# CONFIG_ADAPTEC_STARFIRE is not set
# CONFIG_AC3200 is not set
# CONFIG_B44 is not set
# CONFIG_FORCEDETH is not set
# CONFIG_DGRS is not set
# CONFIG_EEPRO100 is not set
# CONFIG_E100 is not set
# CONFIG_LNE390 is not set
# CONFIG_FEALNX is not set
# CONFIG_NATSEMI is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_NE3210 is not set
# CONFIG_ES3210 is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_SIS900 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SUNDANCE is not set
# CONFIG_TLAN is not set
# CONFIG_VIA_RHINE is not set

#
# Ethernet (1000 Mbit)
#
# CONFIG_ACENIC is not set
CONFIG_DL2K=y
# CONFIG_E1000 is not set
# CONFIG_NS83820 is not set
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
# CONFIG_R8169 is not set
# CONFIG_SIS190 is not set
# CONFIG_SK98LIN is not set
# CONFIG_TIGON3 is not set

#
# Ethernet (10000 Mbit)
#
# CONFIG_IXGB is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Wireless LAN (non-hamradio)
#
CONFIG_NET_RADIO=y

#
# Obsolete Wireless cards support (pre-802.11)
#
# CONFIG_STRIP is not set

#
# Wireless 802.11b ISA/PCI cards support
#
CONFIG_AIRO=y
# CONFIG_HERMES is not set
# CONFIG_ATMEL is not set
CONFIG_NET_WIRELESS=y
#
# Token Ring devices
#
# CONFIG_TR is not set
# CONFIG_NET_FC is not set
# CONFIG_RCPCI is not set
# CONFIG_SHAPER is not set

#
# Wan interfaces
#
# CONFIG_WAN is not set

#
# Amateur Radio support
#
# CONFIG_HAMRADIO is not set

#
# IrDA (infrared) support
#
# CONFIG_IRDA is not set

#
# Bluetooth support
#
# CONFIG_BT is not set

#
# ISDN subsystem
#
# CONFIG_ISDN is not set

#
# Telephony Support
#
# CONFIG_PHONE is not set

#
# Input device support
#
CONFIG_INPUT=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_TSDEV is not set
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input I/O drivers
#
# CONFIG_GAMEPORT is not set
CONFIG_SOUND_GAMEPORT=y
CONFIG_SERIO=y
# CONFIG_SERIO_SERPORT is not set
# CONFIG_SERIO_PARKBD is not set
CONFIG_SERIO_GSCPS2=y
CONFIG_HP_SDC=y
CONFIG_HIL_MLC=y
# CONFIG_SERIO_PCIPS2 is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
# CONFIG_KEYBOARD_ATKBD is not set
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_NEWTON is not set
CONFIG_KEYBOARD_HIL=y
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
# CONFIG_MOUSE_SERIAL is not set
CONFIG_MOUSE_HIL=y
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_IFORCE is not set
# CONFIG_JOYSTICK_WARRIOR is not set
# CONFIG_JOYSTICK_MAGELLAN is not set
# CONFIG_JOYSTICK_SPACEORB is not set
# CONFIG_JOYSTICK_SPACEBALL is not set
# CONFIG_JOYSTICK_STINGER is not set
# CONFIG_JOYSTICK_TWIDDLER is not set
# CONFIG_JOYSTICK_DB9 is not set
# CONFIG_JOYSTICK_GAMECON is not set
# CONFIG_JOYSTICK_TURBOGRAFX is not set
# CONFIG_INPUT_JOYDUMP is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
# CONFIG_INPUT_PCSPKR is not set
# CONFIG_INPUT_UINPUT is not set
CONFIG_HP_SDC_RTC=y

#
# Character devices
#
CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
# CONFIG_SERIAL_NONSTANDARD is not set

#
# Serial drivers
#
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
CONFIG_SERIAL_8250_MANY_PORTS=y
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
# CONFIG_SERIAL_8250_MULTIPORT is not set
# CONFIG_SERIAL_8250_RSA is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MUX is not set
# CONFIG_PDC_CONSOLE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_PRINTER=y
# CONFIG_LP_CONSOLE is not set
# CONFIG_PPDEV is not set
# CONFIG_TIPAR is not set

#
# Mice
#
# CONFIG_BUSMOUSE is not set
# CONFIG_QIC02_TAPE is not set

#
# IPMI
#
# CONFIG_IPMI_HANDLER is not set

#
# Watchdog Cards
#
# CONFIG_WATCHDOG is not set
# CONFIG_NVRAM is not set
CONFIG_GEN_RTC=y
# CONFIG_GEN_RTC_X is not set
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
# CONFIG_AGP is not set
# CONFIG_DRM is not set
# CONFIG_RAW_DRIVER is not set

#
# I2C support
#
# CONFIG_I2C is not set

#
# Multimedia devices
#
# CONFIG_VIDEO_DEV is not set

#
# Digital Video Broadcasting Devices
#
# CONFIG_DVB is not set

#
# Graphics support
#
CONFIG_FB=y
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_IMSTT is not set
CONFIG_FB_STI=y
# CONFIG_FB_RIVA is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON_OLD is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_VIRTUAL is not set

#
# Console display driver support
#
# CONFIG_MDA_CONSOLE is not set
CONFIG_STI_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=160
CONFIG_DUMMY_CONSOLE_ROWS=64
CONFIG_DUMMY_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_PCI_CONSOLE=y
# CONFIG_FONTS is not set
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y

#
# Logo configuration
#
CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
CONFIG_LOGO_LINUX_VGA16=y
CONFIG_LOGO_LINUX_CLUT224=y
CONFIG_LOGO_PARISC_CLUT224=y

#
# Sound
#
CONFIG_SOUND=m

#
# Advanced Linux Sound Architecture
#
# CONFIG_SND is not set

#
# Open Sound System
#
# CONFIG_SOUND_PRIME is not set
CONFIG_SOUND_HARMONY=m

#
# USB support
#
# CONFIG_USB is not set

#
# USB Gadget Support
#
# CONFIG_USB_GADGET is not set

#
# File systems
#
CONFIG_EXT2_FS=y
# CONFIG_EXT2_FS_XATTR is not set
CONFIG_EXT3_FS=y
# CONFIG_EXT3_FS_XATTR is not set
CONFIG_JBD=y
# CONFIG_JBD_DEBUG is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_ROMFS_FS is not set
# CONFIG_QUOTA is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
# CONFIG_ZISOFS is not set
# CONFIG_UDF_FS is not set

#
# DOS/FAT/NT Filesystems
#
# CONFIG_FAT_FS is not set
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
# CONFIG_DEVFS_FS is not set
# CONFIG_DEVPTS_FS_XATTR is not set
CONFIG_TMPFS=y
# CONFIG_HUGETLB_PAGE is not set
CONFIG_RAMFS=y

#
# Miscellaneous filesystems
#
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set

# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_CRAMFS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set

#
# Network File Systems
#
CONFIG_NFS_FS=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V4 is not set
# CONFIG_NFS_DIRECTIO is not set
CONFIG_NFSD=y
CONFIG_NFSD_V3=y
# CONFIG_NFSD_V4 is not set
CONFIG_NFSD_TCP=y
CONFIG_ROOT_NFS=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_EXPORTFS=y
CONFIG_SUNRPC=y
# CONFIG_SUNRPC_GSS is not set
# CONFIG_SMB_FS is not set
# CONFIG_CIFS is not set
# CONFIG_NCP_FS is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y

#
# Native Language Support
#
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
# CONFIG_NLS_CODEPAGE_850 is not set
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ISO8859_1 is not set
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_UTF8 is not set

#
# Profiling support
#
CONFIG_PROFILING=y
CONFIG_OPROFILE=y

#
# Kernel hacking
#
CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_SLAB is not set
CONFIG_MAGIC_SYSRQ=y
CONFIG_FRAME_POINTER=y
# CONFIG_DEBUG_INFO is not set

#
# Security options
#
# CONFIG_SECURITY is not set

#
# Cryptographic options
#
CONFIG_CRYPTO=y
# CONFIG_CRYPTO_HMAC is not set
# CONFIG_CRYPTO_NULL is not set
# CONFIG_CRYPTO_MD4 is not set
# CONFIG_CRYPTO_MD5 is not set
# CONFIG_CRYPTO_SHA1 is not set
# CONFIG_CRYPTO_SHA256 is not set
# CONFIG_CRYPTO_SHA512 is not set
# CONFIG_CRYPTO_DES is not set
# CONFIG_CRYPTO_BLOWFISH is not set
# CONFIG_CRYPTO_TWOFISH is not set
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_AES is not set
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST6 is not set
# CONFIG_CRYPTO_DEFLATE is not set
# CONFIG_CRYPTO_TEST is not set

#
# Library routines
#
CONFIG_CRC32=y
