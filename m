Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 430B6482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 18 May 2001 06:52:39 -0600 (MDT)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA25093
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 May 2001 06:45:37 -0600
Sender: jheumann@mailserv2.iuinc.com
Message-ID: <3B052ECE.F8FE6B83@fonts.de>
Date: Fri, 18 May 2001 15:16:46 +0100
From: Jan Heumann <jheumann@fonts.de>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PA-Linux 0.6.1 on HP 9000 710, kernel =?iso-8859-1?Q?can=B4t?= find the
 cd-rom
List-ID: <linux-parisc.vger.kernel.org>

Hi,

ich habe auf mehreren HP 9000 710 50MHz die 0.6.1 PA-RISC ISO getestet.
Jedesmal kann das CD-Laufwerk vom Kernel nicht gefunden werden. Ist dies
noch ein Bug im NCR53c7xx LASI Treiber bzw. ist es bereits behoben?

I have just tested the 0.6.1 PA-RISC ISO on several HP 9000 710 with 50
MHZ. The Kernel is always unable to find the CD-Rom. Is this a bug
within the NCR53c7xx, or am I missing something? Is there a patch/fix?

Here is a copy of the boot log:

Hier das Boot-Log:

(c) Copyright.  Hewlett-Packard Company.  1991.
All rights reserved.

PDC ROM rev. 2.0
IODC ROM rev. 2.0
64 MB of memory configured and tested.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.

Selection process stopped.

Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Search terminated.



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: a
BOOT_ADMIN> info
----------------------------- Hardware Configuration
------------------------

Machine model: 9000/710

Processor Frequency        = 50000000 Hz
I/O Subsystem Frequency    = 25000000 Hz

LAN Jumper Status: External AUI Port selected

Processor Revision                  = 3
System Controller Revision          = 0
Floating Point Coprocessor Revision = 3

Hardware Version            12288     (0x00003000)
Software Version             1153     (0x00000481)

BOOT_ADMIN> boot scsi.4.0

Trying scsi.4.0
Boot path initialized.
Attempting to load IPL.

Hard booted.
palo ipl debackex@pc5158a Wed Apr 11 17:56:43 CEST 2001
0/vmlinux 2619890 bytes @ 0x4fc000
0/palo-cmdline '0/vmlinux ROOT=/ TERM=linux root=/dev/scd0 console=ttyS0
ramdisk=8192'
Kernel: partition 0 file /vmlinux
ELF32 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 1530128 mediaptr 0x1000
Segment 1 load 00276000 size 182408 mediaptr 0x177000
Segment 2 load 002a4000 size 212996 mediaptr 0x1a4000
Segment 3 load 002dc000 size 8192 mediaptr 0x1d9000
Segment 4 load 00323a48 size 75904 mediaptr 0x1dba48
branching to kernel entry point 0x00100000
PDC Console Initialized
Linux version 2.4.0 (debackex@pc5158a) (gcc version 2.97 20010203
(experimental)) #6 Mon May 14 14:37:01 CEST 2001
FP[0] enabled: Rev 3 Model 0
The 32-bit Kernel has started...
Determining PDC firmware type: Older Legacy Box
setup_cmdline(0x64d58,0x64d58,0x0,0x0)
PALO command line: 'ROOT=/ TERM=linux root=/dev/scd0 console=ttyS0
ramdisk=8192'
PALO initrd 0-0
model   00003000 00000481 00000000 00000000 00000000 00000000 00000004
0000000d 00000000
vers    00000003
CPUID   vers 0 rev 0
model   9000/710
Total Memory: 64 Mb
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Searching for devices...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0,
0x77, 0x0, 0x0
2. Bushmaster Core BA (11) at 0xf082f000, versions 0x6, 0x0, 0x70, 0x0,
0x0
3. Bushmaster Core SCSI (10) at 0xf0825000, versions 0x6, 0x0, 0x71,
0x0, 0x0
4. Bushmaster Core LAN (802.3) (10) at 0xf0826000, versions 0x6, 0x0,
0x72, 0x0, 0x0
5. Bushmaster Core HIL (10) at 0xf0821000, versions 0x6, 0x0, 0x73, 0x0,
0x0
6. Bushmaster Core RS-232 (10) at 0xf0823000, versions 0x6, 0x0, 0x75,
0x0, 0x0
7. Bushmaster Core RS-232 (10) at 0xf0822000, versions 0x6, 0x0, 0x75,
0x0, 0x0
8. Bushmaster Core Centronics (10) at 0xf0824000, versions 0x6, 0x0,
0x74, 0x0, 0x0
9. Bushmaster Audio (10) at 0xf1000000, versions 0x6, 0x0, 0x7a, 0x0,
0x0
10. Bushmaster (710) (0) at 0xfffbe000, versions 0x300, 0x0, 0x4, 0x0,
0x81
11. Bushmaster (1) at 0xfffbf000, versions 0x16, 0x0, 0x9, 0x0, 0x0
That's a total of 11 devices.
CPU(s): 1 x PA7000 (PCX-S) at 50.000000 MHz
Kernel command line: ROOT=/ TERM=linux root=/dev/scd0 console=ttyS0
ramdisk=8192
Error reading tod clock
Calibrating delay loop... 49.76 BogoMIPS
Memory: 62044k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
POSIX conformance testing by UNIFIX
ASP version 1 at 0xf0800000 found.
LED (ASP-style) display at f0800020 registered
Found HIL at 0xf0821000, IRQ 94
HIL: timed out, assuming no keyboard present.
Warning : device (10, 0x6, 0x0, 0x73, 0x0) NOT claimed by HIL 712, 715
or similiar
Found i82596 at 0xf0826000, IRQ 87
early initialization of device eth0 is deferred
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
82596.c: MAC of HP700 LAN blindely read from the prom!
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 8C CD 84 IRQ 87.
82596.c $Revision: 1.17 $
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
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
scsi0: Unable to abort command for target 0
scsi0: Unable to send Bus Device Reset for target 0
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 1
scsi0: Unable to send Bus Device Reset for target 1
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 2
scsi0: Unable to send Bus Device Reset for target 2
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 3
scsi0: Unable to send Bus Device Reset for target 3
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 4
scsi0: Unable to send Bus Device Reset for target 4
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 5
scsi0: Unable to send Bus Device Reset for target 5
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
scsi0: Unable to abort command for target 6
scsi0: Unable to send Bus Device Reset for target 6
scsi0: Unable to do SCSI bus reset
scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
scsi0: could not halt NCR chip, stage 0
linear personality registered
raid0 personality registered
raid1 personality registered
raid5 personality registered
raid5: measuring checksumming speed
 8regs          :    34.671 MB/sec
 8regs_prefetch :    40.767 MB/sec
 32regs         :    32.004 MB/sec
 32regs_prefetch:    41.148 MB/sec
raid5: using function: 32regs_prefetch (41.148 MB/sec)
md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md.c: sizeof(mdp_super_t) = 4096
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Cannot open root device "scd0" or 0b:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 0b:00



--
        Jan Heumann

  .~.
  /V\
/( : )\
 ^^ ^^
