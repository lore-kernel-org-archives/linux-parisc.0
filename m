Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA06231
	for <parisc-linux@puffin.external.hp.com>; Sat, 16 Oct 1999 04:51:46 -0600
Received: from hub-fue by rachael.franken.de
	via rmail with uucp
	id <m11cRRt-0027SkC@rachael.franken.de>
	for thepuffingroup.com!parisc-linux; Sat, 16 Oct 1999 11:52:29 +0100 (MET)
	(Smail-3.2 1996-Jul-4 #4 built DST-Sep-8)
Received: (from tsbogend@localhost)
	by alpha.franken.de (8.8.7/8.8.5) id MAA00830
	for parisc-linux@thepuffingroup.com; Sat, 16 Oct 1999 12:46:56 +0200
Date: Sat, 16 Oct 1999 12:46:56 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: parisc-linux@thepuffingroup.com
Message-ID: <19991016124656.A811@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Start sash ...
List-ID: <linux-parisc.vger.kernel.org>

Ok, after hacking half of the night and cursing about a totally fucked
up ffz(), I finally got something (see below). I did some dirty hacks
to get it so far. 

There is something wrong with user page mappings. It looks like brk()
memory is read only mapped. After digging a little bit, I decided to 
workaround this, by mapping every page read/write/execute (dirty hack #1).

The serial port doesn't seem to generate interrupts. So I had to hack the
serial output routine by printing via printk (dirty hack #2):

And sash really doesn't like garbage in argv[], so I cleaned argv before
execve of sash alias init (not so dirty hack #3).

I'll dig into the serial interrupt problem later, since this holds me
back from being setup up for Systems.

Thomas.

---- Starting sash ... -------------------------------------------------

Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Network Station Address 001083-03194b
System IP Address 193.175.24.80
Server IP Address 193.175.24.67

Boot IO Dependent Code (IODC) revision 2


SOFT Booted.

------------------------------------------------------------------------------

PARISC/Linux Bootstrap Version 0.6 (non-interactive)
By Helge Deller & Jason Eckhardt
Built Sat Oct 16 03:23:41 METDST 1999 by tsbogend@parisc

Reading parameters...done.

Loading PA-RISC/Linux Kernel...
No ramdisks available.
SOM-Kernel:
aux_header_location: 00000080
som       : 00200080
exec_dfile: 000B1000
exec_dsize: 0007F000
exec_dmem : C0088000
exec_tfile: 00039000
exec_tsize: 00077008
exec_tmem : C0010000
Code at 0x00010000, size=0x00077008
Data at 0x00088000, size=0x0007F000
BSS  at 0x00107000.

Transferring control to kernel. (At entry point 0x00010000)
The Kernel has started...
FP CCR was 0xc0, will be set to 0xc0
Model: Staccato L2 180 (A Class 180) with 768 MB RAM.
CPU(s): 1 x PA7300LC (PCX-L2, Velociraptor) at 180.000000 MHz
Kernel-stack at C008A000, Size 8192 kB.
Available virtual mapped memory starts at 0xC01355C0 and ends at 0xF0000000.
Searching for devices in PDC firmware... a newer box...
Found devices:
0. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0, 0x0, 0x0, 0x0
1. Phantom PseudoBC GSC+ Port (7) at 0xffc01000, versions 0x505, 0x0, 0x0, 0x0, 0x0
2. HP HSC-PCI Cards (4) at 0xfff84000, versions 0x4, 0x0, 0x9d, 0x0, 0x80
3. Staccato L2 180 (A Class 180) (0) at 0xfffbe000, versions 0x516, 0x0, 0x4, 0x0, 0x81
4. Staccato L2 180 Memory (1) at 0xfffbf000, versions 0x8b, 0x0, 0x9, 0x0, 0x0
5. Staccato 180 Lasi (11) at 0xffd00000, versions 0x5f, 0x0, 0x81, 0x0, 0x0
6. Staccato 180 Core LAN RS-232 (10) at 0xffd05000, versions 0x5f, 0x0, 0x8c, 0x0, 0x0
7. Staccato 180 Core SCSI (10) at 0xffd06000, versions 0x5f, 0x0, 0x82, 0x0, 0x0
8. Dino PCI Bridge (13) at 0xfff80000, versions 0x680, 0x3, 0xa, 0x0, 0x0
That's a total of 9 devices.
Linux version 2.2.12 (tsbogend@parisc) (gcc version egcs-2.91.66 19990314 (egcs-1.1.2 release)) #88
 Sat Oct 16 12:33:36 METDST 1999
initrd: c008e000-c00e5800
command_line: /stand/vmlinux HOME=/ console=ttyS0 TERM=LINUX initrd=0

free_area_init: c013e000 c2000000
mem_map=c013e000
Calibrating delay loop... 239.86 BogoMIPS
Memory: 14788k available (476k kernel code, 1056k data, 64k init) [c0000000,c1000000]
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
Interrupt  3( 3+ 0)
Starting lasi serial at 0xffd05000
ttyS00 at port 0xffd05800 (irq = 261) is a 16450
Dino version 3.x (card mode) found at 0xfff84000
Scanning PCI bus 0
Found a PCI device, and the vendor is 0x1011, device 0x0009
Found a PCI device, and the vendor is 0x1011, device 0x0009
dino_fixup_bus(0xc019b0a0) bus 0 sysdata 0xc019a0e0
Scan for bus 0 returned 0
Dino version 3.1 (bridge mode) found at 0xfff80000
Scanning PCI bus 1
Found a PCI device, and the vendor is 0x1011, device 0x0019
dino_fixup_bus(0xc019b120) bus 1 sysdata 0xc019a1a0
Scan for bus 1 returned 1
**** NOW SWITCHED TO SERIAL CONSOLE ! ****
Linux NET4.0 for Linux 2.2
Based upon Swansea University Computer Society NET3.039
Starting kswapd v 1.2 
Serial driver version 4.90 (1999-09-22) with no serial options enabled
pty: 256 Unix98 ptys configured
rd_init
RAM disk driver initialized:  16 RAM disks of 4096K size
initrd_load
rd_load_image
opening initrd
identify_ramdisk_image
ext2sb->s_magic: 000053ef
RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 350 blocks [1 disk] into ram disk... |/-\|/-\|/-\|/-\|/-\|/done.
initrd_release
VFS: Mounted root (ext2 filesystem).
stat c0104794 type 0
fd 0 opened
It's for the PA-RISC!
It's executable!
It has an appropriate version!
The checksum checks out!
Well, it *smells* like a valid SOM executable
(start_brk) 40017000
(end_code) 0003c000
(start_code) 00001000
(end_data) 40008000
(start_stack) 2000002c
(brk) 40017000
Stand-alone shell (version 2.1)> 



-- 
   This device has completely bogus header. Compaq scores again :-|
It's a host bridge, but it should be called ghost bridge instead ;^)
                                        [Martin `MJ' Mares on linux-kernel]
