Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from inca.herrera.edu (pool-151-201-226-202.pitt.east.verizon.net [151.201.226.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABD764885
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Mar 2002 23:11:21 -0700 (MST)
Received: from neuronet.pitt.edu (localhost [127.0.0.1])
	by inca.herrera.edu (8.11.6/8.11.6/SuSE Linux 0.5) with ESMTP id g2G5oD830790
	for <parisc-linux@lists.parisc-linux.org>; Sat, 16 Mar 2002 00:50:13 -0500
Message-ID: <3C92DD15.4060008@neuronet.pitt.edu>
Date: Sat, 16 Mar 2002 00:50:13 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] EISA 100/10 add-on card causes kernel BUG
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

A while ago I asked about support for the EISA 100/10 network cards. By 
enabling the HP100 driver the card gets detected as eth0.

During boot, at the time when the network interface is set up a kernel 
BUG is generated. Similar behavior with kernel version 2.4.18-pa0, too. 
What follows is the console output:

Linux version 2.4.18-pa5 (raffo@inca) (gcc version 3.0.2 20010829 
(prerelease)) #3 Sat Mar 16 00:29:45 EST 2002
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00003160 00000481 00000000 00000000 77b82c78 ffffffff 00000004 
0000000a 0000000a
vers  00000013
model 9000/715
Total Memory: 64 Mb
pagetable_init
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/sda3 
eisa_irq_edge=3,4,5,7,9,10,11,14,15  console=ttyS0 palo_kernel=0/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 74.75 BogoMIPS
Memory: 61500k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Searching for devices...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000 [0], versions 0x6, 0x0, 0x77
2. Scorpio Sr. Core BA (11) at 0xf082f000 [2], versions 0x19, 0x0, 0x70
3. Scorpio Sr. Core SCSI (10) at 0xf0825000 [2/0/1], versions 0x19, 0x0, 
0x71
4. Scorpio Sr. Core LAN (802.3) (10) at 0xf0826000 [2/0/2], versions 
0x19, 0x0, 0x72
5. Scorpio Sr. Core HIL (10) at 0xf0821000 [2/0/3], versions 0x19, 0x0, 0x73
6. Scorpio Sr. Core RS-232 (10) at 0xf0823000 [2/0/4], versions 0x19, 
0x0, 0x75
7. Scorpio Sr. Core RS-232 (10) at 0xf0822000 [2/0/5], versions 0x19, 
0x0, 0x75
8. Scorpio Sr. Core Centronics (10) at 0xf0824000 [2/0/6], versions 
0x19, 0x0, 0x74
9. Scorpio Sr. Audio (10) at 0xf1000000 [2/0/8], versions 0x19, 0x0, 0x7b
10. Scorpio Sr. EISA BA (11) at 0xfc000000 [4], versions 0x19, 0x0, 0x76
11. Scorpio Sr.(715/75) (0) at 0xfffbe000 [8], versions 0x316, 0x0, 0x4
12. Memory (1) at 0xfffbf000 [9], versions 0x27, 0x0, 0x9
CPU(s): 1 x PA7100 (PCX-T) at 75.000000 MHz
Asp version 1 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered
Mongoose EISA Adapter found at 0xfc000000
EISA EEPROM at 0xf0810400
Enumerating EISA bus
EISA slot 1: HWP1990 EISA IRQ 3 <4>IRQ 3 polarity configured twice (last 
to level)

POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
Journalled Block Device driver loaded
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
STI byte mode ROM at f4000000, hpa=f4000000
STI byte mode ROM, id 27f12392-40a00499, conforms to spec rev. 8.02
STI device: HPA1991AC19
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, id: 27f12392, mmio: 0xf4100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ 
SERIAL_PCI enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Found HIL at 0xf0821000, IRQ 94
HIL: no keyboard present.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
hp100: eth0: Using (slow) programmed i/o mode.
hp100: eth0: HP J2577 at 0x1c38, IRQ 3, EISA bus, 128k SRAM (rx/tx 75%).
hp100: eth0: Adapter is attached to 10Mb/s network.
loop: loaded (max 8 devices)
Found i82596 at 0xf0826000, IRQ 87
82596.c: MAC of HP700 LAN read from EEPROM
eth1: Couldn't get consistent shared memory
eth1: 82596 at 0xf0826000, 08 00 09 87 89 28 IRQ 87.
82596.c $Revision: 1.29 $
SCSI subsystem driver Revision: 1.00
53c700: consistent memory allocation failed
53c700: Version 2.7 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0
scsi0 : LASI SCSI 53c700
   Vendor: DEC       Model: RZ26L    (C) DEC  Rev: 440C
   Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
scsi0: (6:0) Enabling Tag Command Queuing
SCSI device sda: 2050860 512-byte hdwr sectors (1050 MB)
Partition check:
  sda: sda1 sda2 sda3
Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 0 at 0xf1000000, IRQ 82
sticonsole_init: searching for STI ROMs
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
    8regs     : 12246.800 MB/sec
    8regs_prefetch:    55.600 MB/sec
    32regs    :    56.800 MB/sec
    32regs_prefetch:    56.800 MB/sec
raid5: using function: 8regs (12246.800 MB/sec)
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
NOT FREEING INITMEM (386k)
INIT: version 2.84 booting
Activating swap.
Adding Swap: 124800k swap-space (priority -1)
Checking root file system...
fsck 1.26 (3-Feb-2002)
/dev/sda3: clean, 37561/110656 files, 129875/220926 blocks
System time was Sat Mar 16 05:42:22 UTC 2002.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Sat Mar 16 05:42:35 UTC 2002.
Checking all file systems...
fsck 1.26 (3-Feb-2002)
Setting kernel variables.
Loading the saved-state of the serial devices...
Cannot set serial info: Address already in use
/dev/ttyS0 at 0x0000 (irq = 90) is a 16550A
Cannot set serial info: Address already in use
/dev/ttyS1 at 0x0000 (irq = 89) is a 16550A
Mounting local filesystems...
nothing was mounted
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces:

kernel BUG at printk.c:489!
Linux version 2.4.18-pa5 (raffo@inca) (gcc version 3.0.2 20010829 
(prerelease)) #3 Sat Mar 16 00:29:45 EST 2002
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00003160 00000481 00000000 00000000 77b82c78 ffffffff 00000004 
0000000a 0000000a
vers  00000013
model 9000/715
Total Memory: 64 Mb
pagetable_init
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/sda3 
eisa_irq_edge=3,4,5,7,9,10,11,14,15  console=ttyS0 palo_kernel=0/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 74.75 BogoMIPS
Memory: 61500k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Searching for devices...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000 [0], versions 0x6, 0x0, 0x77
2. Scorpio Sr. Core BA (11) at 0xf082f000 [2], versions 0x19, 0x0, 0x70
3. Scorpio Sr. Core SCSI (10) at 0xf0825000 [2/0/1], versions 0x19, 0x0, 
0x71
4. Scorpio Sr. Core LAN (802.3) (10) at 0xf0826000 [2/0/2], versions 
0x19, 0x0, 0x72
5. Scorpio Sr. Core HIL (10) at 0xf0821000 [2/0/3], versions 0x19, 0x0, 0x73
6. Scorpio Sr. Core RS-232 (10) at 0xf0823000 [2/0/4], versions 0x19, 
0x0, 0x75
7. Scorpio Sr. Core RS-232 (10) at 0xf0822000 [2/0/5], versions 0x19, 
0x0, 0x75
8. Scorpio Sr. Core Centronics (10) at 0xf0824000 [2/0/6], versions 
0x19, 0x0, 0x74
9. Scorpio Sr. Audio (10) at 0xf1000000 [2/0/8], versions 0x19, 0x0, 0x7b
10. Scorpio Sr. EISA BA (11) at 0xfc000000 [4], versions 0x19, 0x0, 0x76
11. Scorpio Sr.(715/75) (0) at 0xfffbe000 [8], versions 0x316, 0x0, 0x4
12. Memory (1) at 0xfffbf000 [9], versions 0x27, 0x0, 0x9
CPU(s): 1 x PA7100 (PCX-T) at 75.000000 MHz
Asp version 1 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered
Mongoose EISA Adapter found at 0xfc000000
EISA EEPROM at 0xf0810400
Enumerating EISA bus
EISA slot 1: HWP1990 EISA IRQ 3 <4>IRQ 3 polarity configured twice (last 
to level)

POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
Journalled Block Device driver loaded
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
STI byte mode ROM at f4000000, hpa=f4000000
STI byte mode ROM, id 27f12392-40a00499, conforms to spec rev. 8.02
STI device: HPA1991AC19
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, id: 27f12392, mmio: 0xf4100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ 
SERIAL_PCI enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Found HIL at 0xf0821000, IRQ 94
HIL: no keyboard present.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
hp100: eth0: Using (slow) programmed i/o mode.
hp100: eth0: HP J2577 at 0x1c38, IRQ 3, EISA bus, 128k SRAM (rx/tx 75%).
hp100: eth0: Adapter is attached to 10Mb/s network.
loop: loaded (max 8 devices)
Found i82596 at 0xf0826000, IRQ 87
82596.c: MAC of HP700 LAN read from EEPROM
eth1: Couldn't get consistent shared memory
eth1: 82596 at 0xf0826000, 08 00 09 87 89 28 IRQ 87.
82596.c $Revision: 1.29 $
SCSI subsystem driver Revision: 1.00
53c700: consistent memory allocation failed
53c700: Version 2.7 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0
scsi0 : LASI SCSI 53c700
   Vendor: DEC       Model: RZ26L    (C) DEC  Rev: 440C
   Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
scsi0: (6:0) Enabling Tag Command Queuing
SCSI device sda: 2050860 512-byte hdwr sectors (1050 MB)
Partition check:
  sda: sda1 sda2 sda3
Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 0 at 0xf1000000, IRQ 82
sticonsole_init: searching for STI ROMs
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
    8regs     : 12246.800 MB/sec
    8regs_prefetch:    55.600 MB/sec
    32regs    :    56.800 MB/sec
    32regs_prefetch:    56.800 MB/sec
raid5: using function: 8regs (12246.800 MB/sec)
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
NOT FREEING INITMEM (386k)
Adding Swap: 124800k swap-space (priority -1)
kernel BUG at printk.c:489!
kernel BUG at printk.c:489!
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x24000000 to 0x24000240:
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

[a lot of these ...]

Dumping Stack from 0x202f8000 to 0x202f8b40:
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x202f8000 to 0x202f8f80:
WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x202f8000 to 0x202f93c0:
WARNING! Stack pointer and cr30 do not correspond!
WARNING! Stack pointer and cr30 do not correspond!
WARNING! Stack pointer and cr30 do not correspond!
WARNING! Stack pointer and cr30 do not correspond!
WARNING! Stack pointer and cr30 do not correspond!
WARNING! Stack pointer and cr30 do not correspond!
WARNING! Stack pointer and cr30 do not correspond!
WARNING! Stack pointer and cr30 do not correspond!
WARNING! Stack pointer and cr30 do not correspond!
WARNING! Stack pointer and cr30 do not correspond!


-- 
      Rafael
