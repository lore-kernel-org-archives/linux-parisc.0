Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel10.hp.com (palrel10.hp.com [156.153.255.245])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6DFE74853
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 16:08:48 -0700 (MST)
Received: from hpindda.cup.hp.com (hpindda.cup.hp.com [15.13.95.92])
	by palrel10.hp.com (Postfix) with ESMTP id B5BCCC007C4
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 15:08:47 -0800 (PST)
Message-ID: <3C8E8A6F.2AD5761C@cup.hp.com>
Date: Tue, 12 Mar 2002 15:08:31 -0800
From: Gururaj Ananthateerta <gururaj@cup.hp.com>
MIME-Version: 1.0
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Switch console error.
References: <3C8E5DCD.942E6278@cup.hp.com> <20020312201309.H30538@parcelfarce.linux.theplanet.co.uk> <3C8E6704.81F14945@cup.hp.com> <20020312204919.I30538@parcelfarce.linux.theplanet.co.uk>  <3C8E8520.EC6877E3@cup.hp.com> <20020312225858.A979E38556@carmen.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
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

Matt Taggart wrote:

> Gururaj Ananthateerta writes...
>
> > Apologies folks.
> > helped a lot. I cud figure out that my kernel was  a32-bit
> > i got htis hppa-linux-gcc and compiled  a 64-bit kernel.
>
> You need hppa64-linux-gcc to build a 64 bit kernel. You can get compilers
> from the ftp.parisc-linux.org site.

I did that, but the kernel panic during  boot and the following was the
message
on the screen.

--------------------------------Start Msg -------------------------
29. Prelude W+ 540 (0) at 0xfffffffffed65000 [101], versions 0x5d3, 0x0, 0x4

CPU(s): 6 x PA8600 (PCX-W+) at 550.000000 MHz
SBA found Ike rev 2 at 0xfffffffffed00000
SBA found Ike rev 2 at 0xfffffffffed40000
lba version TR2.2 (0x3) found at 0xffffffffbffe0000
lba range[2] : ignoring GMMIO (0xfffffff004000000)
lba version TR2.2 (0x3) found at 0xffffffffbffe2000
lba range[2] : ignoring GMMIO (0xfffffff084000000)
lba version TR3.0 (0x4) found at 0xffffffffbffe4000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffff104000000)
lba version TR3.0 (0x4) found at 0xffffffffbffe8000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffff204000000)
lba version TR3.0 (0x4) found at 0xffffffffbffea000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffff284000000)
lba version TR3.0 (0x4) found at 0xffffffffbfff0000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffff404000000)
lba version TR3.0 (0x4) found at 0xffffffffbfff4000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffff504000000)
lba version TR3.0 (0x4) found at 0xffffffffbfff8000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffff604000000)
lba version TR3.0 (0x4) found at 0xfffffffffece0000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffff804000000)
lba version TR3.0 (0x4) found at 0xfffffffffece4000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffff904000000)
lba version TR3.0 (0x4) found at 0xfffffffffece8000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffffa04000000)
lba version TR3.0 (0x4) found at 0xfffffffffecf0000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffffc04000000)
lba version TR3.0 (0x4) found at 0xfffffffffecf4000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffffd04000000)
lba version TR3.0 (0x4) found at 0xfffffffffecf8000
kernel BUG at lba_pci.c:1250!
kernel BUG at lba_pci.c:1285!
lba range[2] : ignoring GMMIO (0xfffffffe04000000)
POSIX conformance testing by UNIFIX
FP[1] enabled: Rev 1 Model 16
FP[2] enabled: Rev 1 Model 16
FP[3] enabled: Rev 1 Model 16
FP[4] enabled: Rev 1 Model 16
FP[5] enabled: Rev 1 Model 16
SMP: Total 6 of 6 processors activated (6586.37 BogoMIPS noticed).
Waiting on wait_init_idle (map = 0x3e)
All processors have done init_idle
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Performance monitoring counters enabled for Prelude W+ 540
Starting kswapd
Journalled Block Device driver loaded
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
Redundant entry in serial pci_table.  Please send the output of
lspci -vv, this message (103c,1048,103c,1049)
and the manufacturer and name of serial board or modem board
to serial-pci-info@lists.sourceforge.net.
ttyS00 at iomem 0xffffffff80000000 (irq = 132) is a 16550A
ttyS01 at iomem 0xffffffff80000008 (irq = 132) is a 16550A
ttyS02 at iomem 0xffffffff80000010 (irq = 132) is a 16550A
Redundant entry in serial pci_table.  Please send the output of
lspci -vv, this message (103c,1048,103c,104a)
and the manufacturer and name of serial board or modem board
to serial-pci-info@lists.sourceforge.net.
ttyS03 at iomem 0xffffffff80003000 (irq = 133) is a 16550A
ttyS04 at iomem 0xffffffff80003008 (irq = 133) is a 16550A
lp: driver loaded but no devices found
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
eth0: Digital DS21143 Tulip rev 65 at 0x80, 00:10:83:F5:85:5B, IRQ 128.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 2, function 0
sym53c8xx: 53c875 detected
sym53c8xx: at PCI bus 0, device 2, function 1
sym53c8xx: 53c875 detected
sym53c8xx: at PCI bus 0, device 1, function 0
sym53c8xx: 53c895 detected
sym53c875-0: rev 0x14 on pci bus 0 device 2 function 0 irq 130
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-1: rev 0x14 on pci bus 0 device 2 function 1 irq 131
sym53c875-1: ID 7, Fast-20, Parity Checking
sym53c895-2: rev 0x1 on pci bus 0 device 1 function 0 irq 129
sym53c895-2: ID 7, Fast-10, Parity Checking
sym53c895-2: SCSI bus mode change from 80 to 80.
scsi0 : sym53c8xx-1.7.3c-20010512
scsi1 : sym53c8xx-1.7.3c-20010512
scsi2 : sym53c8xx-1.7.3c-20010512
  Vendor: SEAGATE   Model: ST39103LC         Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: HP        Model: DVD-ROM 305       Rev: 1.01
  Type:   CD-ROM                             ANSI SCSI revision: 02
Attached scsi disk sda at scsi1, channel 0, id 6, lun 0
sym53c875-1-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
SCSI device sda: 17783112 512-byte hdwr sectors (9105 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
Attached scsi CD-ROM sr0 at scsi2, channel 0, id 2, lun 0
sym53c895-2-<2,*>: FAST-10 SCSI 10.0 MB/s (100.0 ns, offset 16)
sr0: scsi3-mmc drive: 16x/40x cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.12
sticonsole_init: searching for STI ROMs
BUG: Skipping previously registered driver: sti (native)
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :  2536.400 MB/sec
   8regs_prefetch:  1966.400 MB/sec
   32regs    :  2071.600 MB/sec
   32regs_prefetch:  1935.600 MB/sec
raid5: using function: 8regs (2536.400 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 2048 buckets, 96Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
NOT FREEING INITMEM (488k)
INIT: version 2.84 booting

************* SYSTEM ALERT **************
SYSTEM NAME: hpntc660
DATE: 03/12/2002 TIME: 23:39:32
ALERT LEVEL: 7 = reserved

REASON FOR ALERT
SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         FLASH     ON         ON

0x0000407000FF6292 00000000 00000000 - type  0 = Data Field Unused
0x5800487000FF6292 00006602 0C172720 - type 11 = Timestamp 03/12/2002
23:39:32
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:Timeout!
*****************************************

----------------------End Msg---------------------------
