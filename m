Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id EC200482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 27 Jan 2002 12:25:15 -0700 (MST)
Date: Sun, 27 Jan 2002 19:14:29 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 743 VME board boots
Message-ID: <20020127191429.GR2884@sleepie.demon.co.uk>
References: <20020127151743.GQ2884@sleepie.demon.co.uk> <20020127172712.B19804@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020127172712.B19804@parcelfarce.linux.theplanet.co.uk>
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

On Sun, Jan 27, 2002 at 05:27:12PM +0000, Matthew Wilcox wrote:
> Cool, can you play mp3s?  The CPU should be fast enough :-)

Yes, uses about 38% CPU :-)

Here's a 2.4.17 bootlog with the previously unknown devices identified.

Richard


Linux version 2.4.17-pa15 (richard@beast) (gcc version 3.0.2 20010829 (prerelease)) #1 Sun Jan 27 18:16:34 GMT 2002
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00006040 00000481 00000000 00000000 4c418c55 00000000 00000004 00000072 00000072
vers  0000000c
model 9000/743
Total Memory: 128 Mb
pagetable_init
On node 0 totalpages: 32768
zone(0): 32768 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/sda3 ro  console=tty0 sti=0 sti_font=VGA8x16
Console: colour dummy device 160x64
Calibrating delay loop... 99.73 BogoMIPS
Memory: 126352k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Searching for devices...
Found devices:
1. Anole Artist Optional Graphics (10) at 0xf8000000 [1], versions 0x8, 0x0, 0x85
2. Anole 100 Core BA (11) at 0xf0100000 [2], versions 0x1b, 0x0, 0x81
3. Anole 100 Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x1b, 0x0, 0x82
4. Anole 100 Core LAN (802.3) (10) at 0xf0107000 [2/0/2], versions 0x1b, 0x0, 0x8a
5. Anole 100 Core RS-232 (10) at 0xf0105000 [2/0/4], versions 0x1b, 0x0, 0x8c
6. Anole 100 Core Centronics (10) at 0xf0102000 [2/0/6], versions 0x1b, 0x0, 0x74
7. Anole 100 Audio (10) at 0xf0104000 [2/0/8], versions 0x1b, 0x0, 0x7b
8. Anole 100 Core PS/2 Port (10) at 0xf0108000 [2/0/11], versions 0x1b, 0x0, 0x84
9. Anole 100 Core PS/2 Port (10) at 0xf0108100 [2/0/12], versions 0x1b, 0x0, 0x84
10. Anole 100 TIMI BA (11) at 0xffc11000 [7], versions 0x1b, 0x0, 0x93
11. Anole 100 VME Networking (10) at 0xffcf0000 [7/0/1], versions 0x1b, 0x0, 0x88
12. Anole 100 Timi RS-232 (10) at 0xffc1a000 [7/0/2], versions 0x21, 0x0, 0x8c
13. Anole 100 Boot Rom (10) at 0xffcf1000 [7/0/3], versions 0x1b, 0x0, 0x8f
14. Anole 100 (743/100) (0) at 0xfffbe000 [8], versions 0x604, 0x0, 0x4
15. Memory Module (1) at 0xfffbf000 [9], versions 0x0, 0x0, 0x9
16. Shrike Add-on FW-SCSI (4) at 0xfff88000 [11], versions 0x14, 0x0, 0x89
17. Anole 100 VME BA (11) at 0xffc00000 [15], versions 0x1b, 0x0, 0x78
CPU(s): 1 x PA7100LC (PCX-L) at 100.000000 MHz
Lasi version 0 at 0xf0100000 found.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
STI word mode ROM at f002e000, hpa=f8000000
STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 8.04
STI device: HPA208LC1280
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, id: 2b4ded6d, mmio: 0xf8100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
IRQ not found for serial device at 0xffc1a000
Warning : device (10, 0x21, 0x0, 0x8c) NOT claimed by Serial RS232
register_kbd_ops(102be4e8), 101ac78c, 101ac7d4
PS/2 keyboard port at 0xf0108000 (irq 69) found, device attached.
PS/2 psaux port at 0xf0108100 (irq 69) found, no device attached.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0107000, IRQ 87
eth0: 82596 at 0xf0107000, 08 00 09 4F FE 1A IRQ 87.
82596.c $Revision: 1.27 $
SCSI subsystem driver Revision: 1.00
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3b-20010512
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi1: 53c710 rev 2 
scsi1 : LASI SCSI 53c700
scsi1: (0:0) Synchronous at offset 8, period 236ns
  Vendor: TOSHIBA   Model: CD-ROM XM-5401TA  Rev: 1036
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi1: (1:0) Synchronous at offset 8, period 100ns
  Vendor: IBM       Model: DCHS04F  CLAR04   Rev: HP53
  Type:   Direct-Access                      ANSI SCSI revision: 02
scsi1: (4:0) Synchronous at offset 8, period 100ns
  Vendor: IBM       Model: DCHS04F  CLAR04   Rev: HP53
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi1, channel 0, id 1, lun 0
Attached scsi disk sdb at scsi1, channel 0, id 4, lun 0
scsi1: (1:0) Enabling Tag Command Queuing
SCSI device sda: 8813870 512-byte hdwr sectors (4513 MB)
Partition check:
 sda: sda1 sda2 sda3
scsi1: (4:0) Enabling Tag Command Queuing
SCSI device sdb: 8813870 512-byte hdwr sectors (4513 MB)
 sdb: sdb1
Attached scsi CD-ROM sr0 at scsi1, channel 0, id 0, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.12
Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 18 at 0xf0104000, IRQ 82
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
NOT FREEING INITMEM
Adding Swap: 249912k swap-space (priority -1)
eth0: link ok.
eth0: link ok.
