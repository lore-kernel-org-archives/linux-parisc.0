Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob01.one.net.au (mail-ob01.one.net.au [61.12.0.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B3C9482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Apr 2001 04:42:56 -0600 (MDT)
Received: Received: [from peewee (async202-bri-isp-9.nas.one.net.au [61.12.65.203])
	by mail-ob01.one.net.au  with SMTP id f3MAgsK02316
	for <parisc-linux@lists.parisc-linux.org>; Sun, 22 Apr 2001 20:42:55 +1000 (EST)]
Message-ID: <014101c0cb19$96dd4b80$1401a8c0@peewee>
From: "Matthew van de Werken" <mvdw73@one.net.au>
To: <parisc-linux@lists.parisc-linux.org>
Date: Sun, 22 Apr 2001 20:47:09 +1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] How do I use the FW scsi on 735?
List-ID: <linux-parisc.vger.kernel.org>

Hi folks:

I have a 735 which I have managed to boot using a disk I originally hosted
on an x86 Linux box. However, this disk is a narrow scsi disk, while I want
to use the other disks I have for this machine (which are UW SCSI disks).
The problem I have is that while the system recognises the narrow scsi disk,
it doesn't recognise the UW scsi disks I have attached, even though these
are recognised at boot time by the HP PDC-ROM.

I've tried fdisk'ing the /dev/sdb and /dev/sdc devices, but these are
inaccessible (at least by fdisk); the devices don't seem to come up in the
boot sequence, while the narrow-scsi disk is recognised by Linux (I've
appended the whole boot sequence captured from the terminal).

Any ideas?

Cheers,
MvdW

PS: I added the sim700=nodisc:0xff line to the end of the command line as I
thought this might have something to do with the problem - I get the same
thing without it.

PPS: I *love* the fact I can run Linux on this! Thanks to all!

PPPS: Anyone needing any help in booting from a SCSI disk originally hosted
from x86-linux, look at the ESIEE web site: http://mkhppa1.esiee.fr/en -
they have great info.



(c) Copyright.  Hewlett-Packard Company.  1992.
All rights reserved.

PDC ROM rev. 1.1
IODC ROM rev. 1.0
304 MB of memory configured and tested.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.

Selection process stopped.

Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.4.0                 SEAGATE ST15150N
P1                    fwscsi.6.0               HP      C2247
P2                    fwscsi.3.0               SEAGATE ST43401N



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: b p0

Trying scsi.4.0
Boot path initialized.
Attempting to load IPL.


Hard booted.
palo ipl root@zookeeper Sun Apr 22 08:12:41 EST 2001
0/vmlinux 2499228 bytes @ 0x48000
0/palo-cmdline '2/boot/vmlinux HOME=/ TERM=linux console=ttyS0
root=/dev/sda2 si
m700=nodisc:0xff'
/dev/ida1  f0         63      32067
/dev/ida2  83      32130    3277260
/dev/ida3  82    3309390     626535
/dev/ida4  83    3935925    4450005
Kernel: partition 2 file /boot/vmlinux
ext2 block size 4096
ext2_mount(partition 2) returns 0fail!
ext2_open(/boot/vmlinux) = 3
ELF32 executable
Entry 00100188 first 00100000 n 4
Segment 0 load 00100000 size 1394304 mediaptr 0x1000
Segment 1 load 00256000 size 174968 mediaptr 0x156000
Segment 2 load 00284000 size 221184 mediaptr 0x181000
Segment 3 load 002e1768 size 68976 mediaptr 0x1b7768
branching to kernel entry point 0x00100188
PDC Console Initialized
Linux version 2.4.0 (root@zookeeper) (gcc version 3.0 20010315 (prerelease))
#6
Sun Apr 22 07:39:30 EST 2001
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Older Legacy Box
setup_cmdline(0x64cc4,0x64cc4,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux console=ttyS0 root=/dev/sda2
sim700=nodisc
:0xff'
PALO initrd 0-0
model   00002030 00000481 00000000 00000000 7778dc84 ffffffff 00000004
0000000a
0000000a
vers    0000000b
CPUID   vers 0 rev 0
model   9000/735
Total Memory: 304 Mb
pagetable_init
On node 0 totalpages: 77824
zone(0): 77824 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Searching for devices...
Found devices:
1. Outfield Core BA (11) at 0xf082f000, versions 0x9, 0x0, 0x70, 0x0, 0x0
2. Outfield Core SCSI (10) at 0xf0825000, versions 0x9, 0x0, 0x71, 0x0, 0x0
3. Outfield Core HIL (10) at 0xf0821000, versions 0x9, 0x0, 0x73, 0x0, 0x0
4. Outfield Core RS-232 (10) at 0xf0823000, versions 0x9, 0x0, 0x75, 0x0,
0x0
5. Outfield Core RS-232 (10) at 0xf0822000, versions 0x9, 0x0, 0x75, 0x0,
0x0
6. Outfield Core Centronics (10) at 0xf0824000, versions 0x9, 0x0, 0x74,
0x0, 0x
0
7. Outfield FW SCSI (10) at 0xf0830000, versions 0x9, 0x0, 0x7c, 0x0, 0x0
8. Outfield Audio (10) at 0xf1000000, versions 0x9, 0x0, 0x7f, 0x0, 0x0
9. Outfield FDDI (10) at 0xf0831000, versions 0x9, 0x0, 0x7d, 0x0, 0x0
10. Cobra EISA BA (11) at 0xfc000000, versions 0x4, 0x0, 0x76, 0x0, 0x0
11. Hardball (735/99) (0) at 0xfffbe000, versions 0x203, 0x0, 0x4, 0x0, 0x81
12. Hardball (1) at 0xfffbf000, versions 0x19, 0x0, 0x9, 0x0, 0x0
That's a total of 12 devices.
CPU(s): 1 x PA7100 (PCX-T) at 99.000000 MHz
Kernel command line: HOME=/ TERM=linux console=ttyS0 root=/dev/sda2
sim700=nodis
c:0xff
Calibrating delay loop... 98.71 BogoMIPS
Memory: 304048k available
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
VFS: Diskquotas version dquot_6.4.0 initialized
POSIX conformance testing by UNIFIX
ASP version 20 at 0xf0800000 found.
LED (ASP-style) display at f0800020 registered
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
request_module[parport_lowlevel]: Root fs not mounted
lp: driver loaded but no devices found
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI
ena
bled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
ppdev: user-space parallel port driver
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
lp0: using parport0 (interrupt-driven).
SCSI subsystem driver Revision: 1.00
sim700: Couldn't get consistent shared memory
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86, options 1
scsi0: Revision 0x0
Post test1, istat 05, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: WARNING: target data areas are not dma coherent!
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: SEAGATE   Model: ST15150N          Rev: 0023
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 4, lun 0
SCSI device sda: 8388315 512-byte hdwr sectors (4295 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
IP-Config: No network devices available.
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
modprobe: modprobe: Can't open dependencies file
/lib/modules/2.4.0/modules.dep
(No such file or directory)
INIT: version 2.78 booting
Activating swap...
Adding Swap: 313256k swap-space (priority -1)
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended
Calculating module dependencies... depmod: Can't open
/lib/modules/2.4.0/modules
.dep for writing
done.
Loading modules:
modprobe: Can't open dependencies file /lib/modules/2.4.0/modules.dep (No
such f
ile or directory)
Checking all file systems...
Parallelizing fsck version 1.19 (13-Jul-2000)
Setting kernel variables.
Mounting local filesystems...
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended
/dev/sda4 on /extra type ext2 (rw,errors=remount-ro)
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: done.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Sat Sep 26 02:01:15 MDT 1998

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Restoring IP chains: ipchains: Incompatible with this kernel
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting internet superserver: inetd.
Starting OpenBSD Secure Shell server: sshd.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.

Debian GNU/Linux testing/unstable
pehc base tarball 2001-04-04 see /home/demo/README for more info
hippo login:
