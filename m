Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from doorslam.net (port-212-202-173-23.reverse.qdsl-home.de [212.202.173.23])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2BD134829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 06:00:39 -0700 (MST)
Received: from hppa.doorslam.net (localhost [127.0.0.1])
	by doorslam.net (8.12.6/8.12.2) with ESMTP id h31D0Y8g022608
	(version=TLSv1/SSLv3 cipher=DHE-DSS-AES256-SHA bits=256 verify=NO);
	Tue, 1 Apr 2003 15:00:35 +0200 (CEST)
Received: (from paul@localhost)
	by hppa.doorslam.net (8.12.6/8.12.1/Submit) id h31D0XEi025915;
	Tue, 1 Apr 2003 15:00:33 +0200 (CEST)
Date: Tue, 1 Apr 2003 15:00:33 +0200
From: Paul Weissmann <paul@doorslam.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 745i (Pace) boots
Message-ID: <20030401130033.GE25299@hppa.doorslam.net>
Reply-To: paul@doorslam.net
References: <20030401081403.GB25299@hppa.doorslam.net> <20030401125118.GA29376@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="7AUc2qLy4jB3hD7Z"
In-Reply-To: <20030401125118.GA29376@parcelfarce.linux.theplanet.co.uk>
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

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Matthew Wilcox [willy@debian.org] wrote:
> On Tue, Apr 01, 2003 at 10:14:03AM +0200, Paul Weissmann wrote:
> > if someone would tell me how to interrupt the debian-installer from
> > coming up i could provide a dmesg or console log.
> 
> Easiest way is to boot with `init=/bin/sh'.  You do this by interacting
> with IPL/ISL, editing one of the options and appending that string to it.

attached is the typescript from script(1).

	- paul
--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="745i-debian30.txt"

$Id: 745i-debian30.txt,v 1.1 2003/04/01 09:38:18 paul Exp $

BOOT_ADMIN> boot lan

Trying lan.000000-000000.0.0
Boot path initialized.
Attempting to load IPL.


Hard booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

Boot image contains:
    0/vmlinux32 3985679 bytes @ 0x8000
    0/vmlinux64 5275609 bytes @ 0x3d5800
    0/ramdisk 2665562 bytes @ 0x8dd800

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'HOME=/ ramdisk_size=8192 root=/dev/ram console=ttyS0 TERM=vt102 palo_kernel=0/linux'
Selected kernel: /linux from partition 0
Selected ramdisk: /ramdisk from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 32-bit kernelELF32 executable
Entry 001000d8 first 00100000 n 6
Segment 0 load 00100000 size 2202024 mediaptr 0x1000
Segment 1 load 0031a000 size 468144 mediaptr 0x21b000
Segment 2 load 00390000 size 257356 mediaptr 0x28e000
Segment 3 load 003d0000 size 8192 mediaptr 0x2cd000
Segment 4 load 003d8000 size 32768 mediaptr 0x2cf000
Segment 5 load 004020e4 size 112320 mediaptr 0x2d70e4
Loading ramdisk 2665562 bytes @ 05d64000...
Branching to kernel entry point 0x001000d8.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.20-32 (root@mkhppa3) (gcc version 3.0.4) #1 Sat Mar 22 14:03:22 CET 2003
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00004010 00000481 00000000 00000000 77ccf387 ffffffff 00000004 0000000a 0000000a
vers  00000013
model 9000/745
Total Memory: 96 Mb
initrd: 15d64000-15feec5a
initrd: reserving 05d64000-05feec5a (mem_max 06000000)
pagetable_init
On node 0 totalpages: 24576
zone(0): 24576 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ ramdisk_size=8192 root=/dev/ram console=ttyS0 TERM=vt102 palo_kernel=0/linux
Console: colour dummy device 160x64
Calibrating delay loop... 49.86 BogoMIPS
Memory: 91264k available
Dentry cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Searching for devices...
Found devices:
1. Pace SGC Graphics (10) at 0xf4000000 [0], versions 0x10, 0x0, 0x77
2. Pace Core BA (11) at 0xf082f000 [2], versions 0x10, 0x0, 0x70
3. Pace Core SCSI (10) at 0xf0825000 [2/0/1], versions 0x10, 0x0, 0x71
4. Pace Core LAN (802.3) (10) at 0xf0826000 [2/0/2], versions 0x10, 0x0, 0x72
5. Pace Core HIL (10) at 0xf0821000 [2/0/3], versions 0x10, 0x0, 0x73
6. Pace Core RS-232 (10) at 0xf0823000 [2/0/4], versions 0x10, 0x0, 0x75
7. Pace Core RS-232 (10) at 0xf0822000 [2/0/5], versions 0x10, 0x0, 0x75
8. Pace Core Centronics (10) at 0xf0824000 [2/0/6], versions 0x10, 0x0, 0x74
9. Pace Core HPIB (10) at 0xf0835000 [2/0/7], versions 0x10, 0x0, 0x80
10. Pace Audio (10) at 0xf1000000 [2/0/8], versions 0x10, 0x0, 0x7e
11. Pace Core EISA (11) at 0xfc000000 [4], versions 0x10, 0x0, 0x76
12. Pace (745i, 747i) (0) at 0xfffbe000 [8], versions 0x401, 0x0, 0x4
13. Memory (1) at 0xfffbf000 [9], versions 0x20, 0x0, 0x9
CPU(s): 1 x PA7100 (PCX-T) at 50.000000 MHz
Asp version 1 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered
Mongoose EISA Adapter found at 0xfc000000
EISA EEPROM at 0xf0810400
Enumerating EISA bus
EISA slot 1: HWP0C70 EISA DMA 0 IRQ 3 
EISA slot 2 a configured board was not detected ( expected ___FFFF)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch support not available.
Starting kswapd
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
STI GSC/PCI graphics driver version 0.9
STI byte mode ROM at f4000000, hpa at f4000000
STI id 27f12392-40a00499, conforms to spec rev. 8.02
STI device: HPA1991AC19
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, id: 27f12392, mmio: 0xf4100000
pty: 256 Unix98 ptys configured
PDC Software Console version 0.3 (2001-11-17), christoph.plattner@gmx.at
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.07
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0826000, IRQ 87
82596.c: MAC of HP700 LAN read from EEPROM
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 78 F5 79 IRQ 87.
82596.c $Revision: 1.1 $
SCSI subsystem driver Revision: 1.00
3c700: consistent memory allocation failed
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0 
scsi0 : LASI SCSI 53c700
  Vendor: TEAC      Model: FC-1     HF   07  Rev: RV B
  Type:   Direct-Access                      ANSI SCSI revision: 01 CCS
  Vendor: FUJITSU   Model: M2694ES-512       Rev: 812A
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi removable disk sda at scsi0, channel 0, id 0, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 1, lun 0
sda : READ CAPACITY failed.
sda : status = 1, message = 00, host = 0, driver = 08 
Current sd00:00: sns = 70  2
ASC= 4 ASCQ= 0
Raw sense data:0x70 0x00 0x02 0x00 0x00 0x00 0x00 0x08 0x00 0x00 0x00 0x00 0x04 0x00 0x00 0x00 
sda : block size assumed to be 512 bytes, disk size 1GB.  
Partition check:
 sda: I/O error: dev 08:00, sector 0
 I/O error: dev 08:00, sector 0
 unable to read partition table
scsi0: (1:0) Enabling Tag Command Queuing
SCSI device sdb: 2117025 512-byte hdwr sectors (1084 MB)
 sdb: unknown partition table
harmony: no irq found
usb.c: registered new driver usbdevfs
usb.c: registered new driver hub
usb.c: registered new driver hid
hid-core.c: v1.8.1 Andreas Gal, Vojtech Pavlik <vojtech@suse.cz>
hid-core.c: USB HID support drivers
mice: PS/2 mouse device common for all mice
P SDC: HP SDC at 0xf0821000, IRQ 94 (NMI IRQ 93)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
--7AUc2qLy4jB3hD7Z--
