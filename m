Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.medianet-world.de (unknown [213.157.0.162])
	by dsl2.external.hp.com (Postfix) with SMTP id B2071482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 09:20:17 -0700 (MST)
Message-ID: <3E4922F6.8020206@bluehash.de>
Date: Tue, 11 Feb 2003 17:21:10 +0100
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <r.scholz@bluehash.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------060706060206080300040804"
Subject: [parisc-linux] Tag Starvation on 715/100
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
--------------060706060206080300040804
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

today my machine hangs when I tried to do a 'cvs update' for the newest 
PA/RISC-Kernel. So I pressed the power button to reboot the machine. But 
now during startup when fsck is running, the scsi-driver gives me an 
error message, that my harddisc is "suffering from tag starvation". 
Later the machine crashes. 
Booting  a 2.5.59-kernel is no problem (even it's not possible to login 
on serial console... ).

Has anybody the same problem and/or can anybody help?

Facts: 715/100, 128 MB, 2 GB Seagate, Kernel 2.4.20-pa22, gcc-3.0.4, 
Debian testing.
System.map is here: 
http://homepages.tu-darmstadt.de/~rscholz/parisc/System.map 
<http://homepages.tu-darmstadt.de/%7Erscholz/parisc/System.map>

TIA, Rüdiger


--------------060706060206080300040804
Content-Type: text/plain;
 name="CAPTURE.TXT"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="CAPTURE.TXT"



----------------------------------------------------------------------------
BootRom Version    1.6  
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
BOOT_ADMIN> bo pri ipl
 


Attempting to boot.

Loading Initial Program Loader


IPL successfully loaded


Booting
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

Partition Start(MB) End(MB) Id Type

1               1      22   f0 Palo
2              23      64   83 ext2
3              65     194   82 swap
4             195    2046   83 ext2
 
PALO(F0) partition contains:
    0/vmlinux32 3223985 bytes @ 0x48000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).Current command line:
2/vmlinux root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102

 0: 2/vmlinux
 1: root=/dev/sda4
 2: HOME=/
 3: devfs=mount
 4: console=ttyS0
 5: TERM=vt102

Edit which field?

(or 'b' to boot with this command line)?

Command line for kernel: 'root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
ELF32 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 2100772 mediaptr 0x1000
Segment 1 load 00302000 size 467584 mediaptr 0x202000
Segment 2 load 00378000 size 286720 mediaptr 0x275000
Segment 3 load 003c0000 size 32768 mediaptr 0x2bb000
Segment 4 load 003e9fac size 107760 mediaptr 0x2c3fac
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.20-pa22 (ruediger@gandalf) (gcc version 3.0.4) #2 Don Jan 23 15:44:27 CET 2003
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 000060b0 00000481 00000000 00000000 77b661a7 00000000 00000004 00000072 00000072
vers  0000000b
model 9000/715
Total Memory: 128 Mb
pagetable_init
On node 0 totalpages: 32768
zone(0): 32768 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 99.73 BogoMIPS
Memory: 126348k available
Dentry cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Searching for devices...
Found devices:
1. Coral SGC Graphics (10) at 0xf4000000 [0], versions 0x4, 0x0, 0x77
2. Mirage GSC Builtin Graphics (10) at 0xf8000000 [1], versions 0x13, 0x0, 0x85
3. Mirage Core BA (11) at 0xf0100000 [2], versions 0x29, 0x0, 0x81
4. Mirage Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x29, 0x0, 0x82
5. Mirage Core LAN (802.3) (10) at 0xf0107000 [2/0/2], versions 0x29, 0x0, 0x8a
6. Mirage Core RS-232 (10) at 0xf0105000 [2/0/4], versions 0x29, 0x0, 0x8c
7. Mirage Core Centronics (10) at 0xf0102000 [2/0/6], versions 0x29, 0x0, 0x74
8. Mirage Audio (10) at 0xf0104000 [2/0/8], versions 0x29, 0x0, 0x7b
9. Mirage Core PC Floppy (10) at 0xf010a000 [2/0/10], versions 0x29, 0x0, 0x83
10. Mirage Core PS/2 Port (10) at 0xf0108000 [2/0/11], versions 0x29, 0x0, 0x84
11. Mirage Core PS/2 Port (10) at 0xf0108100 [2/0/12], versions 0x29, 0x0, 0x84
12. Mirage Wax BA (11) at 0xf0200000 [5], versions 0x13, 0x0, 0x8e
13. Mirage 100 Wax HIL (10) at 0xf0201000 [5/0/1], versions 0x13, 0x0, 0x73
14. Mirage Wax RS-232 (10) at 0xf0202000 [5/0/2], versions 0x13, 0x0, 0x8c
15. Mirage 100 (0) at 0xfffbe000 [8], versions 0x60b, 0x0, 0x4
16. Memory (1) at 0xfffbf000 [9], versions 0x4b, 0x0, 0x9
CPU(s): 1 x PA7100LC (PCX-L) at 100.000000 MHz
Lasi version 0 at 0xf0100000 found.
LED display at f00e0000 registered
Wax at 0xf0200000 found.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Gecko-style soft power switch enabled.
Starting kswapd
Journalled Block Device driver loaded
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
STI GSC/PCI graphics driver version 0.9
STI byte mode ROM at f4000000, hpa at f4000000
STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071A
STI word mode ROM at f0024000, hpa at f8000000
STI id 2b4ded6d-40a00499, conforms to spec rev. 8.04
STI device: HPA208LC1024
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio: 0xf4100000
fb1: stifb 1024x768-8 frame buffer device, id: 2b4ded6d, mmio: 0xf8100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at iomem 0xf0105800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0202800 (irq = 121) is a 16550A
PS/2 keyboard port at 0xf0108000 (irq 69) found, device attached.
PS/2 psaux port at 0xf0108100 (irq 69) found, device attached.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.07
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0107000, IRQ 87
eth0: 82596 at 0xf0107000, 08 00 09 7A DC 08 IRQ 87.
82596.c $Revision: 1.30 $
SCSI subsystem driver Revision: 1.00
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2 
scsi0 : LASI SCSI 53c700
scsi0: (2:0) Synchronous at offset 8, period 100ns
  Vendor: PLEXTOR   Model: CD-ROM PX-20TS    Rev: 1.01
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi0: (3:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST32430N          Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 3, lun 0
scsi0: (3:0) Enabling Tag Command Queuing
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
Partition check:
 /dev/scsi/host0/bus0/target3/lun0: p1 p2 p3 p4
Attached scsi CD-ROM sr0 at scsi0, channel 0, id 2, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.12
Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 18 at 0xf0104000, IRQ 82
mice: PS/2 mouse device common for all mice
HP SDC: HP SDC at 0xf0201000, IRQ 126 (NMI IRQ 125)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :    70.000 MB/sec
   8regs_prefetch:    70.000 MB/sec
   32regs    :   111.200 MB/sec
   32regs_prefetch:   111.600 MB/sec
raid5: using function: 32regs_prefetch (111.600 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
HP SDC: Transaction add failed: transaction already queued?
HP SDC: Transaction add failed: transaction already queued?
md: Autodetecting RAID arrays.
HP SDC: Transaction add failed: transaction already queued?
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
HP SDC: Transaction add failed: transaction already queued?
HP SDC: read timeout (949695us)!
EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access will be enabled during recovery.
scsi0 (3:0) Target is suffering from tag starvation.
scsi0 (3:0) New error handler wants to abort command
	0x2a 00 00 32 1b c8 00 00 08 00 
scsi0 (3:0) New error handler wants to abort command
	0x00 00 00 00 00 00 
scsi0: Bus Reset detected, executing command 00000000, slot 00000000, dsp 000f04a8[04a8]
 failing command because of reset, slot 00010520, cmnd 100db400
 failing command because of reset, slot 00010654, cmnd 100db800
 failing command because of reset, slot 00010788, cmnd 100db600
 failing command because of reset, slot 000108bc, cmnd 100dc200
 failing command because of reset, slot 000109f0, cmnd 100db000
 failing command because of reset, slot 00010b24, cmnd 100dca00
 failing command because of reset, slot 00010c58, cmnd 100db200
 failing command because of reset, slot 00010d8c, cmnd 100eec00
 failing command because of reset, slot 00010ec0, cmnd 100dc800
 failing command because of reset, slot 00011128, cmnd 100dc400
 failing command because of reset, slot 0001125c, cmnd 100db800
 failing command because of reset, slot 000114c4, cmnd 100eee00
 failing command because of reset, slot 000115f8, cmnd 100dce00
 failing command because of reset, slot 0001172c, cmnd 100eea00
scsi0 (3:0) New error handler wants to abort command
	0x2a 00 00 32 37 38 00 00 08 00 

Stack Dump:
 100f8680:  0004ff0e 00002002 00000000 0000ffff 
 100f8670:  1003c960 1022019c 100f8654 100f8654 
 100f8660:  00000000 102e6044 00000001 00000001 
 100f8650:  00001ffb 10587e40 10205d64 00002003 
 100f8640:  0000000f 00000000 00000000 00000000 
 100f8630:  00000000 10205d64 00000000 00000001 

Kernel addresses on the stack:
 [<1022019c>]  [<10205d64>]  [<10205d64>]  [<10206b34>] 
 [<10206d94>]  [<10107c4c>]  [<10107cf4>]  [<1010521c>] 
 [<1025e33c>]  [<101626e4>]  [<10121e38>]  [<10204a0c>] 
 [<10162930>]  [<10204a0c>]  [<10204c1c>]  [<10206c40>] 
 [<101205b8>] 

Kernel Fault: Code=26 regs=100f8680 (Addr=00000048)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001110 Not tainted
r00-03  00000000 103cee41 1022019c 100db600
r04-07  10583014 00002002 00000000 0000ffff
r08-11  1003c960 00002001 10312810 10315810
r12-15  00000000 10587e40 00000001 f0000704
r16-19  f000b858 00000002 00000000 00000005
r20-23  00000000 000108bc 00000003 00000000
r24-27  00000001 00000001 10315b60 10302010
r28-31  00000001 00001ffc 100f8680 1011c9a4
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 102201d4 102201d8
 IIR: 4a930090    ISR: 00000000  IOR: 00000048
 CPU:        0   CR30: 100f8000 CR31: 103c0000
 ORIG_R28: 6f707172

--------------060706060206080300040804--
