Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.powertech.no (smtp1.powertech.no [195.159.0.145])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A4E5482A
	for <parisc-linux@parisc-linux.org>; Mon, 17 Dec 2001 04:56:53 -0700 (MST)
Received: from nyepost.start.no (nyepost.start.no [195.159.1.214])
	by smtp1.powertech.no (Postfix) with ESMTP id D34FF8B06
	for <parisc-linux@parisc-linux.org>; Mon, 17 Dec 2001 12:56:39 +0100 (CET)
Received: (from apache@localhost)
	by nyepost.start.no (8.11.6/8.11.2) id fBHBlN322188
	for parisc-linux@parisc-linux.org; Mon, 17 Dec 2001 12:47:23 +0100
To: parisc-linux@parisc-linux.org
Message-ID: <1008589643.3c1ddb4b75583@nyepost.start.no>
Date: Mon, 17 Dec 2001 12:47:23 +0100 (CET)
From: Andy Walker <squawker@start.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Status report - B132L and 725/100
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

Hi folks,

This is stock 0.9.3.

Over the weekend I was using the B132L with an original HP keyboard.
No sign of the LASI PS/2 keyboard timeouts that were bugging me on
thursday night. Whether that's because the HP keyboard differs from
the generic PS/2 keyboard I was using before, or just because I wasn't
hitting the cdrom hard for data at the same time I don't know. I'll
report back if I see the problem again.

Fired up the 725/100 I was talking about last week. Works like a charm.
Initially I used the builtin framebuffer (HPA208LC1280 - 1280-1024-8).
Then I stuck in a Coral GSC (HPA4071B_LZ) in GSC slot 2.

Both work fine, but the same weird thing with the frame buffer ordering
occurred with the 725/100 as it did with the B132L last week. With the
console set in the PDC to the built-in fb, the kernel starts to boot
on that device, then finds the Coral first and continues to boot
on that, calling it fb0. Setting the console in PDC to the Coral makes
everything work properly - the system boots all the way on the Coral.

I had to pull the Bluefish F/W-Diff card (or at least disconnect the
disk) but it may have been termination problems causing the timeouts/
resets. Something else to test :-)

Here's the dmesg from the 725/100. The unknown scancode, 7f, is
less-than/greater-than on a Norwegian PS/2 keyboard. I imagine that
can be fixed :-)

-Andy

Linux version 2.4.9-32 (root@paer) (gcc version 3.0.2 (Debian)) #1 Fri Nov 30 
19:36:30 MST 2001
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model	000060d0 00000481 00000000 00000000 77ec54a0 00000000 00000004 00000072 
00000072
vers	0000000b
CPUID	vers 0 rev 0
model	9000/725
Total Memory: 320 Mb
pagetable_init
On node 0 totalpages: 81920
zone(0): 81920 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sda2 HOME=/ console=tty0 sti=0 sti_font=VGA8x16 
TERM=linux
Console: colour dummy device 160x64
Calibrating delay loop... 99.73 BogoMIPS
Memory: 319540k available
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Searching for devices...
Found devices:
1. Coral SGC Graphics (10) at 0xf4000000 [0], versions 0x4, 0x0, 0x77
2. Electra GSC Builtin Graphics (10) at 0xf8000000 [1], versions 0x14, 0x0, 0x85
3. Electra Core BA (11) at 0xf0100000 [2], versions 0x2a, 0x0, 0x81
4. Electra Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x2a, 0x0, 0x82
5. Electra Core LAN (802.3) (10) at 0xf0107000 [2/0/2], versions 0x2a, 0x0, 0x8a
6. Electra Core RS-232 (10) at 0xf0105000 [2/0/4], versions 0x2a, 0x0, 0x8c
7. Electra Core Centronics (10) at 0xf0102000 [2/0/6], versions 0x2a, 0x0, 0x74
8. Electra Audio (10) at 0xf0104000 [2/0/8], versions 0x2a, 0x0, 0x7b
9. Electra Core PC Floppy (10) at 0xf010a000 [2/0/10], versions 0x2a, 0x0, 0x83
10. Electra Core PS/2 Port (10) at 0xf0108000 [2/0/11], versions 0x2a, 0x0, 0x84
11. Electra Core PS/2 Port (10) at 0xf0108100 [2/0/12], versions 0x2a, 0x0, 0x84
12. Electra Wax EISA BA (11) at 0xfc000000 [4], versions 0x2a, 0x0, 0x90
13. Electra Wax BA (11) at 0xf0200000 [5], versions 0x14, 0x0, 0x8e
14. Electra Wax HIL (10) at 0xf0201000 [5/0/1], versions 0x14, 0x0, 0x73
15. Electra Wax RS-232 (10) at 0xf0202000 [5/0/2], versions 0x14, 0x0, 0x8c
16. Electra 100 (0) at 0xfffbe000 [8], versions 0x60d, 0x0, 0x4
17. Electra 100 (1) at 0xfffbf000 [9], versions 0x4d, 0x0, 0x9
CPU(s): 1 x PA7100LC (PCX-L) at 100.000000 MHz
Lasi version 0 at 0xf0100000 found.
LED display at f00e0000 registered
Wax at 0xf0200000 found.
Wax: HIL Keyboard-NMI registered.
Wax EISA Adapter found at 0xfc000000
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
STI byte mode ROM at f4000000, hpa=f4000000
STI byte mode ROM, id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071B_LZ
STI word mode ROM at f0024000, hpa=f8000000
STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 8.04
STI device: HPA208LC1280
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio: 0xf4100000
fb1: stifb 1280x1024-8 frame buffer device, id: 2b4ded6d, mmio: 0xf8100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI 
enabled
ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0202800 (irq = 121) is a 16550A
PS/2 keyboard port at 0xf0108000 (irq 69) found, device attached.
PS/2 psaux port at 0xf0108100 (irq 69) found, device attached.
Found HIL at 0xf0201000, IRQ 126
HIL: no keyboard present.
Warning : device (10, 0x14, 0x0, 0x73) NOT claimed by HIL
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0107000, IRQ 87
eth0: 82596 at 0xf0107000, 08 00 09 0A 0C 6B IRQ 87.
82596.c $Revision: 1.26 $
SCSI subsystem driver Revision: 1.00
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2 
scsi0 : LASI SCSI 53c700
scsi0: (3:0) Synchronous at offset 8, period 200ns
  Vendor: HP        Model: HP35480A          Rev: 1109
  Type:   Sequential-Access                  ANSI SCSI revision: 02
scsi0: (6:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST31055N          Rev: 0532
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
scsi0: (6:0) Enabling Tag Command Queuing
SCSI device sda: 2069860 512-byte hdwr sectors (1060 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
Lasi Harmony Audio rev. 18 at 0xf0104000, using IRQ 82
sticonsole_init: searching for STI ROMs
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Adding Swap: 195384k swap-space (priority -1)
eth0: link ok.
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored
keyboard: unrecognized scancode (7f) - ignored



------------------------------------------------------------
Få din egen @start.no-adresse gratis på http://www.start.no/
