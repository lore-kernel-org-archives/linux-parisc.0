Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from out005pub.verizon.net (out005pub.verizon.net [206.46.170.105])
	by dsl2.external.hp.com (Postfix) with ESMTP id D21ED482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 09:07:29 -0700 (MST)
Received: from verizon.net (pool-151-201-226-132.pitt.east.verizon.net [151.201.226.132])
	by out005pub.verizon.net  with ESMTP
	for <parisc-linux@lists.parisc-linux.org>; id g0BG7AG16425
	Fri, 11 Jan 2002 10:07:10 -0600 (CST)
Message-ID: <3C3F0DD1.4040508@verizon.net>
Date: Fri, 11 Jan 2002 11:07:45 -0500
From: Rafael Herrera <vze26vn8@verizon.net>
Reply-To: raffo@neuronet.pitt.edu
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How to configure EISA network card in 715/80
References: <3C3F06DD.6050409@verizon.net> <20020111154337.D26644@parcelfarce.linux.theplanet.co.uk>
Content-Type: multipart/mixed;
 boundary="------------070701060308020605020306"
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

This is a multi-part message in MIME format.
--------------070701060308020605020306
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Matthew Wilcox wrote:

> yep it's the hp100 driver.  i've used it myself (when i got a ping back
> from it, i declared the eisa code good enough to commit :-).  in config,
> that's: HP 10/100VG PCLAN (ISA, EISA, PCI) support' CONFIG_HP100
 

It does not seem to be found. See my attached dmesg.


> btw, the 100Mbit port is 100VG, not 100TX so you need 100VG equipment
> to work with it.  the 10Mbit port is vanilla 10baseT though.


I can get a hold onsome of that equipment.

Thanks.
-- 
      Rafael

--------------070701060308020605020306
Content-Type: text/plain;
 name="dmesg1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dmesg1"

Linux version 2.4.17-pa6 (raffo@inca) (gcc version 3.0.2 20010829 (prerelease)) #11 Fri Jan 11 10:56:42 EST 2002
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00006190 00000481 00000000 00000000 7795c3b3 00000000 00000004 00000072 00000072
vers  0000000b
model 9000/715
Total Memory: 48 Mb
pagetable_init
On node 0 totalpages: 12288
zone(0): 12288 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/sda2 eisa_irq_edge=3,4,5,7,9,10,11,14,15 console=tty0 sti=1 sti_font=VGA8x16
Console: colour dummy device 160x64
Calibrating delay loop... 79.66 BogoMIPS
Memory: 45348k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Searching for devices...
Found devices:
1. Mirage 80 GSC Builtin Graphics (10) at 0xf8000000 [1], versions 0x10, 0x0, 0x85
2. Mirage 80 Core BA (11) at 0xf0100000 [2], versions 0x2b, 0x0, 0x81
3. Mirage 80 Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x2b, 0x0, 0x82
4. Mirage 80 Core LAN (802.3) (10) at 0xf0107000 [2/0/2], versions 0x2b, 0x0, 0x8a
5. Mirage 80 Core RS-232 (10) at 0xf0105000 [2/0/4], versions 0x2b, 0x0, 0x8c
6. Mirage 80 Core Centronics (10) at 0xf0102000 [2/0/6], versions 0x2b, 0x0, 0x74
7. Mirage 80 Audio (10) at 0xf0104000 [2/0/8], versions 0x2b, 0x0, 0x7b
8. Mirage 80 Core PC Floppy (10) at 0xf010a000 [2/0/10], versions 0x2b, 0x0, 0x83
9. Mirage 80 Core PS/2 Port (10) at 0xf0108000 [2/0/11], versions 0x2b, 0x0, 0x84
10. Mirage 80 Core PS/2 Port (10) at 0xf0108100 [2/0/12], versions 0x2b, 0x0, 0x84
11. Pace Wax BA (11) at 0xf0200000 [5], versions 0x10, 0x0, 0x8e
12. Pace Core HIL (10) at 0xf0201000 [5/0/1], versions 0x10, 0x0, 0x73
13. Mirage 80 Wax RS-232 (10) at 0xf0202000 [5/0/2], versions 0x10, 0x0, 0x8c
14. Mirage 80 (0) at 0xfffbe000 [8], versions 0x619, 0x0, 0x4
15. Mirage 80 (1) at 0xfffbf000 [9], versions 0x4f, 0x0, 0x9
CPU(s): 1 x PA7100LC (PCX-L) at 80.000000 MHz
Lasi version 0 at 0xf0100000 found.
LED display at f010c000 registered
Wax at 0xf0200000 found.
Wax: HIL Keyboard-NMI registered.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Enabled gecko-style soft power switch.
Starting kswapd
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
STI word mode ROM at f0024000, hpa=f8000000
STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 8.04
STI device: HPA208LC1280
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, id: 2b4ded6d, mmio: 0xf8100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0202800 (irq = 121) is a 16550A
PS/2 keyboard port at 0xf0108000 (irq 69) found, device attached.
PS/2 psaux port at 0xf0108100 (irq 69) found, device attached.
Found HIL at 0xf0201000, IRQ 126
HIL: no keyboard present.
Warning : device (10, 0x10, 0x0, 0x73) NOT claimed by HIL
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize

PCI or EISA Host Bus Adapter 0 not registered. in16(0x100) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x120) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x140) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x160) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x180) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x1a0) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x1c0) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x1e0) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x200) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x220) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x240) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x260) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x280) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x2a0) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x2c0) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x2e0) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x300) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x320) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x340) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x360) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x380) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x3a0) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x3c0) returning -1

PCI or EISA Host Bus Adapter 0 not registered. in16(0x3e0) returning -1
loop: loaded (max 8 devices)
Found i82596 at 0xf0107000, IRQ 87
eth0: 82596 at 0xf0107000, 08 00 09 3B F2 06 IRQ 87.
82596.c $Revision: 1.27 $
SCSI subsystem driver Revision: 1.00
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2 
scsi0 : LASI SCSI 53c700
scsi0: (3:0) Synchronous at offset 8, period 100ns
  Vendor: QUANTUM   Model: XP34550S          Rev: LXY1
  Type:   Direct-Access                      ANSI SCSI revision: 02
scsi0: (3:1) Synchronous at offset 8, period 100ns
  Vendor: NEC       Model: CD-ROM DRIVE:461  Rev: 2.3d
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi0: (4:1) Synchronous at offset 8, period 124ns
Attached scsi disk sda at scsi0, channel 0, id 3, lun 0
scsi0: (3:0) Enabling Tag Command Queuing
sda: Spinning up disk....ready
SCSI device sda: 8890760 512-byte hdwr sectors (4552 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
Attached scsi CD-ROM sr0 at scsi0, channel 0, id 4, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.12
Lasi Harmony Audio rev. 0 at 0xf0104000, using IRQ 82
sticonsole_init: searching for STI ROMs
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :    60.800 MB/sec
   8regs_prefetch:    60.800 MB/sec
   32regs    :    88.400 MB/sec
   32regs_prefetch:    88.400 MB/sec
raid5: using function: 32regs_prefetch (88.400 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
NOT FREEING INITMEM
Adding Swap: 249136k swap-space (priority -1)
scsi0 (3:0) Target is suffering from tag starvation.
eth0: link ok.

--------------070701060308020605020306--
