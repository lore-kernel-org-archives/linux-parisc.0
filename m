Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A7B6482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jul 2003 13:30:38 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157001091.dialin.heagmedianet.de [213.157.1.91])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h6JJTu8Q012963
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Sat, 19 Jul 2003 21:29:59 +0200
Message-ID: <3F199AB5.8010602@hrzpub.tu-darmstadt.de>
Date: Sat, 19 Jul 2003 21:23:33 +0200
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------050503030805080500070407"
Subject: [parisc-linux] 2.6.0-test1-pa1 crashes on 715/100
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
--------------050503030805080500070407
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi there!

I tried to run 2.6.0-test1-pa1 on my machine but it crashes right after 
"Freeing unused kernel memory". IAOQ says something bout 
"canonicalize_funcptr_for_compare" so I will give gcc-3.2 a run to see 
how far the kernel will get then.
Greetings,
Ruediger

--------------050503030805080500070407
Content-Type: text/plain;
 name="gandalf-2.6.0.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="gandalf-2.6.0.log"



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
palo ipl 1.2 root@b2000 Tue Jan 14 13:13:07 MST 2003


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

(or 'b' to boot with this command line)? 0

2/vmlinux-2.6.0-test1-pa1

Current command line:

2/vmlinux-2.6.0-test1-pa1 root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102

 0: 2/vmlinux-2.6.0-test1-pa1

 1: root=/dev/sda4

 2: HOME=/

 3: devfs=mount

 4: console=ttyS0

 5: TERM=vt102


Edit which field?

(or 'b' to boot with this command line)? 0 b


Command line for kernel: 'root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.0-test1-pa1'

Selected kernel: /vmlinux-2.6.0-test1-pa1 from partition 2

ELF32 executable

Entry 00100000 first 00100000 n 3

Segment 0 load 00100000 size 2266045 mediaptr 0x1000

Segment 1 load 0032a000 size 409816 mediaptr 0x22b000

Segment 2 load 00390000 size 532608 mediaptr 0x290000

Branching to kernel entry point 0x00100000.  If this is the last

message you see, you may need to switch your console.  This is

a common symptom -- search the FAQ and mailing list at parisc-linux.org


Linux version 2.6.0-test1-pa1 (ruediger@gandalf) (gcc version 3.2.3 20030415 (Debian prerelease)) #1 Fri Jul 18 21:58:57 CEST 2003
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 000060b0 00000481 00000000 00000000 77b661a7 00000000 00000004 00000072 00000072
vers  0000000b
model 9000/715
Total Memory: 128 Mb
pagetable_init
On node 0 totalpages: 32768
  DMA zone: 32768 pages, LIFO batch:8
  Normal zone: 0 pages, LIFO batch:1
  HighMem zone: 0 pages, LIFO batch:1
Building zonelist for node : 0
Kernel command line: root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.0-test1-pa1
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Calibrating delay loop... 99.73 BogoMIPS
Memory: 126192k available
Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)
Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
-> /dev
-> /dev/console
-> /root
POSIX conformance testing by UNIFIX
Initializing RT netlink socket
EISA bus registered
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
BIO: pool of 256 setup, 14Kb (56 bytes/bio)
biovec pool[0]:   1 bvecs: 244 entries (12 bytes)
biovec pool[1]:   4 bvecs: 244 entries (48 bytes)
biovec pool[2]:  16 bvecs: 244 entries (192 bytes)
biovec pool[3]:  64 bvecs: 244 entries (768 bytes)
biovec pool[4]: 128 bvecs: 122 entries (1536 bytes)
biovec pool[5]: 256 bvecs:  61 entries (3072 bytes)
SCSI subsystem initialized
pty: 256 Unix98 ptys configured
Journalled Block Device driver loaded
devfs: v1.22 (20021013) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Serial: 8250/16550 driver $Revision: 1.90 $ IRQ sharing enabled
Gecko-style soft power switch enabled.
lp: driver loaded but no devices found
Generic RTC Driver v1.07
ttyS0 at MMIO 0xf0105800 (irq = 90) is a 16550A
ttyS1 at MMIO 0xf0202800 (irq = 121) is a 16550A
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0107000, IRQ 87
eth0: 82596 at 0xf0107000, 08 00 09 7A DC 08 IRQ 87.
82596.c $Revision: 1.29 $
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2
scsi0 : LASI SCSI 53c700
anticipatory scheduling elevator
scsi0: (2:0) Synchronous at offset 8, period 100ns
  Vendor: PLEXTOR   Model: CD-ROM PX-20TS    Rev: 1.01
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi0: (3:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST32430N          Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
st: Version 20030622, fixed bufsize 32768, s/g segs 256
scsi0: (3:0) Enabling Tag Command Queuing
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
SCSI device sda: drive cache: none
 /dev/scsi/host0/bus0/target3/lun0: p1 p2 p3 p4
Attached scsi disk sda at scsi0, channel 0, id 3, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.12
Attached scsi generic sg0 at scsi0, channel 0, id 2, lun 0,  type 5
Attached scsi generic sg1 at scsi0, channel 0, id 3, lun 0,  type 0
STI GSC/PCI core graphics driver Version 0.9a
STI byte mode ROM at f4000000, hpa at f4000000
STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071A
STI word mode ROM at f0024000, hpa at f8000000
STI id 2b4ded6d-40a00499, conforms to spec rev. 8.04
STI device: HPA208LC1024
sticon: Initializing STI text console.
Console: switching to colour STI console 160x64
mice: PS/2 mouse device common for all mice
Keyboard initialization sequence failled
input: PS/2 keyboard port at 0xf0108000 (irq 69) found and attached
input: PS/2 mouse port at 0xf0108100 (irq 69) found and attached
NET4: Linux TCP/IP 1.0 for NET4.0
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Mounted devfs on /dev
Freeing unused kernel memory: 524k freed

Stack Dump:
 10590598:  10590598 10343200 17f22200 00000001
 10590588:  10030110 17eef620 0900deee 0900deee
 10590578:  1033f000 10597980 10419810 00027774
 10590568:  00000000 00000008 00000001 1032c810
 10590558:  10419810 10342810 10419e44 10590200
 10590548:  0000000f 00000000 00027550 0000000f
 10590538:  00000010 00000010 00000000 1010631c
 10590528:  0000000f 00000148 103f7bcc 10590488
 10590518:  00000008 10343124 00000201 00000001
 10590508:  10343468 10343010 00000010 faf00810
 105904f8:  0000005f 00000010 00000010 00000050
 105904e8:  00000010 00000010 00000001 10419e44
 105904d8:  17eef620 00027550 1032a010 0000000e
 105904c8:  105b6534 103f7b40 10590480 0000005f
 105904b8:  00000010 00000010 00000050 10121658
 105904a8:  0000000f 00000148 103f7bcc 10590408
 10590498:  00000000 10343448 17eef620 0000000f
 10590488:  10030110 10343124 00000000 00000000
 10590478:  17fd0000 17ee7200 17ee7200 101b0b8c
 10590468:  17ed966c 10590210 10590108 17ed9600
 10590458:  17ed9600 10404260 00000000 17ee7340
 10590448:  00000000 17ee7340 100837a0 17eef668
 10590438:  103f7bcc 103f7bcc 10590414 1010a088
 10590428:  10121e1c 10597670 00000000 00000001
 10590418:  10590414 10590414 10121e1c 10590388
 10590408:  00000000 10587348 105881d0 00000000
 105903f8:  00000000 17f3e060 17ee7340 1013a4f0
 105903e8:  17f3e0cc 10590210 10590108 00000000
 105903d8:  1033f000 10590210 00027550 00000000
 105903c8:  0c601094 0000000d 105900d4 1044c730
 105903b8:  00000000 40181838 10401604 101e650c
 105903a8:  101e6508 00000000 00000000 00000000
 10590398:  00000000 00000000 00000000 00000001
 10590388:  00000000 00000001 00000001 00000000
 10590378:  00000000 10590108 00000003 101b0a64
 10590368:  00000006 00000000 00000000 00000000
 10590358:  05b6719b 00000000 00000002 00000000
 10590348:  10590108 17eef820 17ee6420 10343124
 10590338:  000014f4 000006fc 00000df8 101567a4
 10590328:  00000000 00000001 00000001 f0000704
 10590318:  f000b858 00000002 0000000f 10340810
 10590308:  ffffe836 10340810 0000000f 00000000
 105902f8:  10590140 00000064 10390000 00000000
 105902e8:  00000002 00000000 00000002 10419e44
 105902d8:  10342810 00000000 00000002 00000000
 105902c8:  00000002 00000002 1033b020 f0000704
 105902b8:  00000001 00000001 00000000 1016955c
 105902a8:  1032c810 10419810 10342810 00000000
 10590298:  00000000 00000000 00000000 00000000
 10590288:  00000000 00000000 00000000 40061097
 10590278:  10590200 00000400 00000000 1032a010
 10590268:  00027552 00000400 00000000 00000400
 10590258:  00000000 101e64d8 00027552 1032a010
 10590248:  0900deee 1033f000 10597670 10419810
 10590238:  00027774 00000000 105900d4 00000001
 10590228:  1033f000 00026f74 105b6540 105900c8
 10590218:  105b6534 0000000e 1032a010 00027550
 10590208:  10130070 10383010 0006000e f0000704
 105901f8:  00000001 10597670 00000000 10166bb8
 105901e8:  00000004 faf002c8 1032a010 0000000c
 105901d8:  00000000 ffffffe0 10597670 00000040
 105901c8:  105b6854 0000000d 00000000 10419810
 105901b8:  10597670 1033f000 0900deee 10130070
 105901a8:  00020002 00000000 00020002 faf00350

Kernel addresses on the stack:
 [<10234de8>] scsi_request_fn+0x54/0x2ec
 [<10106074>] parisc_terminate+0x5c/0xa8
 [<1010631c>] handle_interruption+0x25c/0x56c
 [<10121658>] io_schedule+0x3c/0x68
 [<101b0b8c>] new_devfs_lookup_struct+0x18/0x50
 [<1010a088>] intr_check_sig+0x0/0xc
 [<1013a4f0>] filemap_nopage+0x2b4/0x3cc
 [<101e650c>] __canonicalize_funcptr_for_compare+0x34/0x128
 [<101b0a64>] devfs_open+0xa4/0xd4
 [<101567a4>] dentry_open+0x12c/0x1b0
 [<1016955c>] locate_fd+0x120/0x15c
 [<10166bb8>] open_namei+0xac/0x4b8
 [<10130070>] do_sigaction+0xf0/0x28c
 [<10106210>] handle_interruption+0x150/0x56c
 [<10130568>] sys_rt_sigaction+0x80/0xb4
 [<1010afe8>] syscall_exit+0x0/0x28
 [<1010a088>] intr_check_sig+0x0/0xc


Kernel Fault: Code=15 regs=10590200 (Addr=00027550)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001110 Not tainted
r00-03  00000000 10383010 10130070 00027550
r04-07  1032a010 0000000e 105b6534 105900c8
r08-11  105b6540 00026f74 1033f000 00000001
r12-15  105900d4 00000000 00027774 10419810
r16-19  10597670 1033f000 0900deee 1032a010
r20-23  00027552 101e64d8 00000000 00000400
r24-27  00000000 00000400 00027552 1032a010
r28-31  00000000 00000400 10590200 40061097
sr0-3   00000001 00000001 00000000 00000001
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101e6508 101e650c
 IIR: 0c601094    ISR: 00000000  IOR: 00027550
 CPU:        0   CR30: 10590000 CR31: 10386000
 ORIG_R28: 00000000
 IAOQ[0]: __canonicalize_funcptr_for_compare+0x30/0x128
 IAOQ[1]: __canonicalize_funcptr_for_compare+0x34/0x128
 RP(r2): do_sigaction+0xf0/0x28c


--------------050503030805080500070407--
