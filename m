Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx04.nexgo.de (mx04.nexgo.de [151.189.8.80])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF7AA4843
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Sep 2001 05:08:15 -0600 (MDT)
Message-ID: <3BAF13BC.3090302@hrzpub.tu-darmstadt.de>
Date: Mon, 24 Sep 2001 13:06:36 +0200
From: =?ISO-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] Additional Address cleanup
References: <20010921104838.A2049@beavis.ybsoft.com>
Content-Type: multipart/mixed;
 boundary="------------030305010602090100020802"
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------030305010602090100020802
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

I've tested the patch on my 715/100. I enabled STI-Console only and no 
STI-fb, because of the second Coral Graphics Card in my box.Using the 
kernel 2.4.9-pa25, the new patch kernel boots out of the box, but it 
doesn't recognize my graphics cards. I also changed the 
kmalloc-statement according to your second mail .

I added the bootlog.

Any hints? Ruediger


--------------030305010602090100020802
Content-Type: text/plain;
 name="logfile.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="logfile.txt"



----------------------------------------------------------------------------
BootRom Version    1.4  
Memory Size:  128 MB
----------------------------------------------------------------------------




(c) Copyright 1990-1994, Hewlett-Packard Company.
All rights reserved

Press <ESCAPE> to stop boot sequence.
----------------------------------------------------------------------------
Command                                Description
-------                                -----------
Auto [boot|search] [on|off]            Set/show auto mode
Boot [pri|alt [isl]]                   Boot from primary or alternate path
Boot [scsi|eisa.<slot>[.<addr>]] [isl] Boot from SCSI or EISA
Boot lan[.<addr>] [install] [isl]      Boot from LAN
Chassis [on|off]                       Set/show chassis codes display mode
DefaultSS                              Reboot and set EEPROM to default values
Diagnostic [on|off]                    Set/show diagnostic boot mode
Fastboot [on|off]                      Set/show fast boot mode
Help                                   Show this command menu
Information                            Show system information
LanAddress                             Show LAN station addresses
Monitor [<DEV>[.<type>]]               Set/show graphics monitor type
                                       (<DEV>=graphics|graphics_<1|2>)
Path [pri|alt [<DEV>[.<addr>]]]        Set/show boot source path
                                       (<DEV>=lan|scsi|eisa.<slot>)
Path [console [<DEV>[.<parm>]]]        Set/show boot console path
                                       (<DEV>=<RS232>|<GRAPH>
                                        <RS232>=rs232|rs232_2
                                        <parm>=<baud>.<length>.<parity>
                                        <GRAPH>=graphics|graphics_<1|2>
                                        <parm>=<monitor>)
Path [keyboard [hil|ps2]]              Set/show boot keyboard path
Pim [hpmc|toc|lpmc]                    Show PIM info
Search [ipl] [scsi|eisa]               Show potential boot devices
Search [ipl] [lan [install]]           Show potential boot LAN devices
Secure [on|off]                        Set/show security mode
----------------------------------------------------------------------------
BOOT_ADMIN>bo pri ipl




Attempting to boot.

Loading Initial Program Loader


IPL successfully loaded


Booting
palo ipl 0.93 root@gandalf Sun Jul  8 12:19:37 CEST 2001
0/vmlinux32 2918801 bytes @ 0x48000
Partition Start(MB) End(MB) Id Type
1               1      22   f0 Palo
2              23      64   83 ext2
3              65     194   82 swap
4             195    2046   83 ext2
Current command line:

2/vmlinux-test root=/dev/sda4 HOME=/ TERM=linux console=ttyS0
 0: 2/vmlinux-test
 1: root=/dev/sda4
 2: HOME=/
 3: TERM=linux
 4: console=ttyS0

Edit which field?
(or 'b' to boot with this command line)? b
Command line: 'root=/dev/sda4 HOME=/ TERM=linux console=ttyS0'

Kernel: partition 2 file /vmlinux-test
ext2 block size 1024
ext2_mount(partition 2) returns 0
ext2_open(/vmlinux-test) = 3
ELF32 executable
Entry 001000b0 first 00100000 n 6
Segment 0 load 00100000 size 1689384 mediaptr 0x1000
Segment 1 load 0029e000 size 275544 mediaptr 0x19e000
Segment 2 load 002e4000 size 361024 mediaptr 0x1e2000
Segment 3 load 00340000 size 8192 mediaptr 0x23b000
Segment 4 load 00348000 size 32768 mediaptr 0x23d000
Segment 5 load 00384acc size 86704 mediaptr 0x245acc
branching to kernel entry point 0x001000b0
Set default PSW W bit to 0
Linux version 2.4.9-pa25 (ruediger@gandalf) (gcc version 3.0.2 20010825 (Debian prerelease)) #1 Sam Sep 22 17:06:55 CEST 2001
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Older Legacy Box
model	000060b0 00000481 00000000 00000000 77b661a7 00000000 00000004 00000072 00000072
vers	0000000b
CPUID	vers 0 rev 0
model	9000/715
Total Memory: 128 Mb
pagetable_init
On node 0 totalpages: 32768
zone(0): 32768 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sda4 HOME=/ TERM=linux console=ttyS0
Console: colour dummy device 160x64
Calibrating delay loop... 99.73 BogoMIPS
Memory: 126136k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
Searching for devices...
Found devices:
1. Coral SGC Graphics (10) at 0xf4000000, versions 0x4, 0x0, 0x77
2. Mirage GSC Builtin Graphics (10) at 0xf8000000, versions 0x13, 0x0, 0x85
3. Mirage Core BA (11) at 0xf0100000, versions 0x29, 0x0, 0x81
4. Mirage Core SCSI (10) at 0xf0106000, versions 0x29, 0x0, 0x82
5. Mirage Core LAN (802.3) (10) at 0xf0107000, versions 0x29, 0x0, 0x8a
6. Mirage Core RS-232 (10) at 0xf0105000, versions 0x29, 0x0, 0x8c
7. Mirage Core Centronics (10) at 0xf0102000, versions 0x29, 0x0, 0x74
8. Mirage Audio (10) at 0xf0104000, versions 0x29, 0x0, 0x7b
9. Mirage Core PC Floppy (10) at 0xf010a000, versions 0x29, 0x0, 0x83
10. Mirage Core PS/2 Port (10) at 0xf0108000, versions 0x29, 0x0, 0x84
11. Mirage Core PS/2 Port (10) at 0xf0108100, versions 0x29, 0x0, 0x84
12. Mirage Wax BA (11) at 0xf0200000, versions 0x13, 0x0, 0x8e
13. Mirage 100 Wax HIL (10) at 0xf0201000, versions 0x13, 0x0, 0x73
14. Mirage Wax RS-232 (10) at 0xf0202000, versions 0x13, 0x0, 0x8c
15. Mirage 100 (0) at 0xfffbe000, versions 0x60b, 0x0, 0x4
16. Mirage 100 (1) at 0xfffbf000, versions 0x4b, 0x0, 0x9
That's a total of 16 devices.
CPU(s): 1 x PA7100LC (PCX-L) at 100.000000 MHz
iosapic_init()
pdc_pci_irt_size: -1
Lasi version 0 at 0xf0100000 found.
LED display at f00e0000 registered
Wax at 0xf0200000 found.
Wax: HIL Keyboard-NMI registered.
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
VFS: Diskquotas version dquot_6.4.0 initialized
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0202800 (irq = 121) is a 16550A
Lasi PS/2 receive buffer timeout
PS/2 keyboard port at 0xf0108000 (irq 69) found, no device attached.
Lasi PS/2 transmit buffer timeout
PS/2 psaux port at 0xf0108100 (irq 69) found, no device attached.
Found HIL at 0xf0201000, IRQ 126
HIL: keyboard found at id 0
HIL: keymap loaded.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0107000, IRQ 87
eth0: 82596 at 0xf0107000, 08 00 09 7A DC 08 IRQ 87.
82596.c $Revision: 1.22 $
SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c710 (SCSI-ID 7) at f0106100, IRQ 86, options 0
scsi0: Revision 0x2
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: SEAGATE   Model: ST32430N          Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
Lasi Harmony Audio rev. 18 at 0xf0104000, using IRQ 82
sticonsole_init: searching for STI ROMs
Warning : device (10, 0x4, 0x0, 0x77) NOT claimed by sti (native)
Warning : device (10, 0x13, 0x0, 0x85) NOT claimed by sti (native)
md: linear personality registered
md: raid0 personality registered
md: raid1 personality registered
md: raid5 personality registered
raid5: measuring checksumming speed
   8regs     :    70.800 MB/sec
   8regs_prefetch:    98.000 MB/sec
   32regs    :   118.400 MB/sec
   32regs_prefetch:   164.400 MB/sec
raid5: using function: 32regs_prefetch (164.400 MB/sec)
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
INIT: version 2.78 booting
Activating swap...
Adding Swap: 132920k swap-space (priority -1)
Checking root file system...
Parallelizing fsck version 1.22 (22-Jun-2001)
/dev/sda4: clean, 41827/237120 files, 162129/474075 blocks
Checking all file systems...
Parallelizing fsck version 1.22 (22-Jun-2001)
/dev/sda2: clean, 23/10944 files, 14621/43617 blocks
Setting kernel variables.
Loading the saved-state of the serial devices... 
Mounting local filesystems...
mount: devpts already mounted on /dev/pts
/dev/sda2 on /boot type ext2 (rw,errors=remount-ro)
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: eth0: link ok.
done.
Starting portmap daemon: portmap.
Starting portmapper... Mounting remote filesystems...
mount: RPC: Unable to receive; errno = Connection refused

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Mon Sep 24 11:52:03 CEST 2001

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting NFS common utilities: statd lockd.
Starting internet superserver: inetd.
Not starting NFS kernel daemon: No exports.
Starting OpenBSD Secure Shell server: sshd.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.
Starting web server: apache.
/usr/sbin/apachectl start: httpd started

Debian GNU/Linux testing/unstable gandalf ttyS0

gandalf login: 
--------------030305010602090100020802--
