Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lefou.zayda.com (unknown [204.99.158.177])
	by dsl2.external.hp.com (Postfix) with ESMTP id C35A2482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 22:09:11 -0600 (MDT)
Received: from localhost (sonny@localhost)
	by lefou.zayda.com (8.9.3/8.9.3) with ESMTP id WAA19823
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 22:09:09 -0600
Date: Mon, 24 Sep 2001 22:09:09 -0600 (MDT)
From: Sonny Cook <sonny@aspersion.org>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] kernel 2.5.9-pa24 won't boot 735/125
In-Reply-To: <Pine.LNX.4.33.0109201328390.14604-100000@lefou>
Message-ID: <Pine.LNX.4.33.0109242042210.17244-100000@lefou>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Okay, I've written off cross compiling as a loss.  I did get a 715/80
working with no obvious problems.  I've compiled a kernel with the
EARLY_BOOTUP_DEBUG flag defined.  So, I boot my 735/125 with that kernel
and get much more interesting information.  Thusly:

Trying scsi.5.0
Boot path initialized.
Attempting to load IPL.
Hard booted.
palo ipl 0.94 sonny@foucault Wed Sep 19 22:52:46 MDT 2001

Partition Start(MB) End(MB) Id Type
1               1      16   f0 Palo
2              17    2046   83 ext2
Command line: 'HOME=/ TERM=LINUX console=ttyS0 root=/dev/sda2'

Kernel: partition 2 file /boot/vmlinux
ext2_mount(partition 2) returns 0
Opening /boot/vmlinux
ext2_open(/boot/vmlinux) = 3
ELF32 executable
Entry 00100000 first 00100000 n 6
Segment 0 load 00100000 size 1629016 mediaptr 0x1000
Segment 1 load 0028e000 size 239576 mediaptr 0x18f000
Segment 2 load 002cc000 size 353468 mediaptr 0x1ca000
Segment 3 load 00324000 size 8192 mediaptr 0x221000
Segment 4 load 00328000 size 32768 mediaptr 0x223000
Segment 5 load 0034b82c size 84992 mediaptr 0x22b82c
branching to kernel entry point 0x00100000
Linux version 2.4.9-pa24 (root@geordi) (gcc version 3.0 20010315
(prerelease)) # 4 Mon Sep 24 03:21:06 MDT 2001
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: Older Legacy Box
model   00002060 00000481 00000000 00000000 77a67807 ffffffff 00000004
0000000a
0000000a
vers    00000015
CPUID   vers 0 rev 0
model   9000/735
Total Memory: 336 Mb
pagetable_init
On node 0 totalpages: 86016
zone(0): 86016 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=LINUX console=ttyS0 root=/dev/sda2
Console: colour dummy device 160x64
Initialized PDC Console for debugging.
Calibrating delay loop... 124.51 BogoMIPS
Memory: 335820k available
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
POSIX conformance testing by UNIFIX
Searching for devices...
Found devices:
1. Coral SGC Graphics (10) at 0xf8000000, versions 0x4, 0x0, 0x77
2. Outfield Core BA (11) at 0xf082f000, versions 0x9, 0x0, 0x70
3. Outfield Core SCSI (10) at 0xf0825000, versions 0x9, 0x0, 0x71
4. Outfield Core LAN (802.3) (10) at 0xf0826000, versions 0x9, 0x0, 0x72
5. Outfield Core HIL (10) at 0xf0821000, versions 0x9, 0x0, 0x73
6. Outfield Core RS-232 (10) at 0xf0823000, versions 0x9, 0x0, 0x75
7. Outfield Core RS-232 (10) at 0xf0822000, versions 0x9, 0x0, 0x75
8. Outfield Core Centronics (10) at 0xf0824000, versions 0x9, 0x0,
0x74
9. Outfield FW SCSI (10) at 0xf0830000, versions 0x9, 0x0, 0x7c
10. Outfield Audio (10) at 0xf1000000, versions 0x9, 0x0, 0x7f
11. Cobra EISA BA (11) at 0xfc000000, versions 0x4, 0x0, 0x76
12. Snake Cheetah (735/130) (0) at 0xfffbe000, versions 0x206, 0x0,
0x4
13. Snake Cheetah (1) at 0xfffbf000, versions 0x37, 0x0, 0x9
That's a total of 13 devices.
CPU(s): 1 x PA7100 (PCX-T) at 125.000000 MHz
Asp version 20 at 0xf0800000 found.
LED (ASP-style) display at f0800020 registered
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Found HIL at 0xf0821000, IRQ 94
HIL: no keyboard present.
Warning : device (10, 0x9, 0x0, 0x73) NOT claimed by HIL
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0826000, IRQ 87
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 0B 53 75 IRQ 87.
82596.c $Revision: 1.22 $
SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
scsi0: Revision 0x0
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: SEAGATE   Model: ST32430N          Rev: 0510
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
SCSI device sda: 4197405 512-byte hdwr sectors (2149 MB)
Partition check:
 sda: sda1 sda2
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
ip_conntrack (2623 buckets, 20984 max)
ip_tables: (c)2000 Netfilter core team
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
INIT: version 2.78 booting
Activating swap...
Checking root file system...
Parallelizing fsck version 1.19 (13-Jul-2000)
/dev/sda2 was not cleanly unmounted, check forced.
/dev/sda2: 29437/260096 files (0.1% non-contiguous), 94659/519769
blocks
Checking all file systems...
Parallelizing fsck version 1.19 (13-Jul-2000)
Setting kernel variables.
Mounting local filesystems...
not mounted anything
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: eth0: Transceiver problem.
done.

Setting the System Clock using the Hardware Clock as reference...
Cannot access the Hardware Clock via any known method.
Use the --debug option to see the details of our search for an access
method.
System Clock set. Local time: Tue Sep 25 20:35:45 MDT 2001

Cleaning: /tmp /var/lock /var/run.

At this point the system refuses to give any more output.  I can ping the
box, but there are no services running (sshd is supposed to start up.)  I
also assume that the root file system (/dev/sdb2) is indeed mounted,
because if I just cold reboot, it has to fsck the filesystem next time.

The kernel is compiled without STI or framebuffer support.  It also has
all of the non experimental iptables options compiled in.

Any ideas???


On Thu, 20 Sep 2001, Sonny Cook wrote:

> Hi,
> I just tried my hand at cross compiling the parisc-linux kernel on my x86
> box.  Something compiled, so I put the vmlinux on my 735/125 and tried to
> boot it.  It went like this:
>
> Hard booted.
> palo ipl 0.94 sonny@foucault Wed Sep 19 22:52:46 MDT 2001
> 0/vmlinux32 3153422 bytes @ 0x48000
> Partition Start(MB) End(MB) Id Type
> 1               1      16   f0 Palo
> 2              17    2046   83 ext2
>
> Command line: 'HOME=/ TERM=LINUX console=tty root=/dev/sda2'
>
> Kernel: partition 2 file /boot/vmlinux
> ext2 block size 4096
> ext2_mount(partition 2) returns 0
> Opening /boot/vmlinux
> ext2_open(/boot/vmlinux) = 3
> ELF32 executable
> Entry 001000d0 first 00100000 n 6
> Segment 0 load 00100000 size 1714332 mediaptr 0x1000
> Segment 1 load 002a4000 size 281768 mediaptr 0x1a4000
> Segment 2 load 002ec000 size 376840 mediaptr 0x1e9000
> Segment 3 load 0034c000 size 8192 mediaptr 0x246000
> Segment 4 load 00350000 size 32768 mediaptr 0x248000
> Segment 5 load 0038d684 size 88048 mediaptr 0x250684
> branching to kernel entry point 0x001000d0
>
> At this point, I can't even think where to begin looking for problems.
> Any hints?
>
> Thanks,
> Sonny
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
>
