Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3DDC7482D
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Sep 2003 06:12:22 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157024025.dialin.heagmedianet.de [213.157.24.25])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h84BvPXc004327
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Thu, 4 Sep 2003 13:59:18 +0200
Message-ID: <3F5728AB.3040501@hrzpub.tu-darmstadt.de>
Date: Thu, 04 Sep 2003 13:57:31 +0200
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------030807030904080702090800"
Subject: [parisc-linux] Kernel crash with 2.6.0-test4-pa8 on 715/100
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
--------------030807030904080702090800
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

I tried to boot 2.6.0-test4-pa8 on my HP 715/100, but it crashed right 
after the message "Freeing unused kernel memory...". I'm using debian 
testing with devfs and gcc-3.3.1.
I think the pb is devfs, so I will try to boot a kernel without it.
Bootlog is attached, Config, System.map is here: 
http://rscholz.bluehash.de/parisc

Greetings,
    Ruediger

--------------030807030904080702090800
Content-Type: text/plain;
 name="gandalf-2.6.0-test4-pa8.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="gandalf-2.6.0-test4-pa8.log"



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
 1: root=/dev/sda4 2: HOME=/
 3: devfs=mount
 4: console=ttyS0
 5: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? 0
2/vmlinux-2.6.0
Current command line:
2/vmlinux-2.6.0 root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102
 0: 2/vmlinux-2.6.0
 1: root=/dev/sda4
 2: HOME=/
 3: devfs=mount
 4: console=ttyS0
 5: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: 'root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.0'
Selected kernel: /vmlinux-2.6.0 from partition 2
ELF32 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 2214104 mediaptr 0x1000
Segment 1 load 0031e000 size 356536 mediaptr 0x21e000
Segment 2 load 00378000 size 323711 mediaptr 0x276000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.0-test4-pa8 (ruediger@gandalf) (gcc-Version 3.3.1 20030626 (Debian prerelease)) #1 Wed Sep 3 13:23:29 CEST 2003
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
Kernel command line: root=/dev/sda4 HOME=/ devfs=mount console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux-2.6.0
PID hash table entries: 16 (order 4: 128 bytes)
Console: colour dummy device 160x64
Calibrating delay loop... 99.73 BogoMIPS
Memory: 126480k available
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
STI GSC/PCI core graphics driver Version 0.9a
STI byte mode ROM at f4000000, hpa at f4000000
STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
STI device: HPA4071A
STI word mode ROM at f0024000, hpa at f8000000
STI id 2b4ded6d-40a00499, conforms to spec rev. 8.04
STI device: HPA208LC1024
fb0: stifb 1280x1024-8 frame buffer device, id: 2bcb015a, mmio: 0xf4100000
fb1: stifb 1024x768-8 frame buffer device, id: 2b4ded6d, mmio: 0xf8100000
Console: switching to colour frame buffer device 160x64
pty: 256 Unix98 ptys configured
Journalled Block Device driver loaded
devfs: v1.22 (20021013) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
Gecko-style soft power switch enabled.
lp: driver loaded but no devices found
Generic RTC Driver v1.07
Serial: 8250/16550 driver $Revision: 1.90 $ IRQ sharing enabled
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
Using anticipatory scheduling elevator
scsi0: (2:0) Synchronous at offset 8, period 100ns
  Vendor: PLEXTOR   Model: CD-ROM PX-20TS    Rev: 1.01
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi0: (3:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST32430N          Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
scsi0: (3:0) Enabling Tag Command Queuing
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
SCSI device sda: drive cache: write back
 /dev/scsi/host0/bus0/target3/lun0: p1 p2 p3 p4
Attached scsi disk sda at scsi0, channel 0, id 3, lun 0
sr0: scsi-1 drive
Uniform CD-ROM driver Revision: 3.12
Attached scsi generic sg0 at scsi0, channel 0, id 2, lun 0,  type 5
Attached scsi generic sg1 at scsi0, channel 0, id 3, lun 0,  type 0
Console: switching to colour frame buffer device 160x64
mice: PS/2 mouse device common for all mice
Keyboard initialization sequence failled
input: PS/2 keyboard port at 0xf0108000 (irq 69) found and attached
input: PS/2 mouse port at 0xf0108100 (irq 69) found and attached
HP SDC: HP SDC at 0xf0201000, IRQ 126 (NMI IRQ 125)
HP SDC: New style SDC
HP SDC: Revision: 1820-4784
HP SDC: TI SN76494 beeper present
HP SDC: OKI MSM-58321 BBRTC present
HP SDC: Spunking the self test register to force PUP on next firmware reset.
oprofile: using timer interrupt.
NET4: Linux TCP/IP 1.0 for NET4.0
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Mounted devfs on /dev
Freeing unused kernel memory: 320k freed

Stack Dump:
 10558758:  10558758 0000000e 10558340 10320010 
 10558748:  10378fb8 00000001 00000000 00000000 
 10558738:  00000000 00007b94 00000297 10133bd0 
 10558728:  00000000 00000000 0000003a 000001db 
 10558718:  10558340 10335810 00000000 105583c0 
 10558708:  0000001a 00000000 00000b98 00000000 
 105586f8:  10592288 00000050 105586d4 10106318 
 105586e8:  103f0aec ffffffdd 103f0810 103f0810 
 105586d8:  0000000e 105586d0 103f259c 105586c8 
 105586c8:  105586c8 00000001 ffffffff 00000000 
 105586b8:  100df4e0 00000001 10570e00 10127688 
 105586a8:  103f0aec ffffffdd 103f0810 103f0810 
 10558698:  0000000e 1032e088 00000b00 00000008 
 10558688:  00000002 ffffffdd 103f0810 102f7000 
 10558678:  105583a8 00000001 100a4d00 10127424 
 10558668:  10592200 00000000 10592200 10584060 
 10558658:  00000000 00000000 10320080 80000000 
 10558648:  00000000 103ca010 00000002 100de370 
 10558638:  00000000 105993cf 10558614 10107254 
 10558628:  1010d310 00000000 00000000 00000000 
 10558618:  00000000 00000000 10320080 80000000 
 10558608:  00000000 103ca010 00000002 100ad640 
 105585f8:  10558388 100be800 00000001 1010a088 
 105585e8:  00000001 00000001 100a4d00 00000000 
 105585d8:  0000000f 0000190e 103d09b8 0000190e 
 105585c8:  0000192c 103cf810 10558500 100a4d00 
 105585b8:  00000000 105583a8 00000001 1010a068 
 105585a8:  00000000 00000000 00000001 00000001 
 10558598:  0000000f 0000192c 00000b98 00000000 
 10558588:  48930130 0000000e 10320010 00000000 
 10558578:  105678e0 00000000 00000008 101fa024 
 10558568:  101fa020 00000000 00000000 00000000 
 10558558:  00000000 00000000 00000000 00000000 
 10558548:  00000000 00000000 00000000 00000000 
 10558538:  41000000 00000000 40800000 00000000 
 10558528:  40000000 00000000 40000000 7fffffff 
 10558518:  41800000 00000000 40200000 00000000 
 10558508:  40200000 00000000 40300000 00000000 
 105584f8:  41000000 00000000 40800000 7fffffff 
 105584e8:  7fffffff 00000000 41000000 7fffffff 
 105584d8:  7fffffff 00000000 40800000 00000000 
 105584c8:  41000000 7fffffff 7fffffff 00000000 
 105584b8:  00000000 00000010 00000010 00000000 
 105584a8:  41800000 00000000 00000000 00000000 
 10558498:  00000000 ffffffff 7f7fffff ffffffff 
 10558488:  7f7fffff 7fffffff 7fffffff 00000000 
 10558478:  40800000 00000000 00000000 00000000 
 10558468:  00000000 00000000 00000000 00000000 
 10558458:  00000000 00000000 00000000 00000000 
 10558448:  00000000 00000000 000d081f 101fad90 
 10558438:  105583c0 00000005 00000b00 1031e010 
 10558428:  1033c528 00000002 105582cc 00000002 
 10558418:  10110cc0 00000501 00000000 00000001 
 10558408:  00000000 00000002 f000b858 f0000704 
 105583f8:  00000001 105582cc 00000000 10378fb8 
 105583e8:  10320010 103cf810 100b05a0 00000002 
 105583d8:  00000002 00000008 00000b00 1032e088 
 105583c8:  101fa01c 1033c010 0004ff0f 00000000 
 105583b8:  10558340 00000060 00000000 101fa01c 
 105583a8:  003cf6c0 f0105800 003ca380 105ded60 
 10558398:  105e0c60 00000000 105dedcc 105ded60 
 10558388:  105e0c60 17ff57a0 105dedcc f0000704 
 10558378:  1032e088 00000b00 100b5820 00000001 
 10558368:  00000002 100b05a0 103cf810 10320010 

Kernel addresses on the stack:
 [<1011f4cc>] scheduler_tick+0x84/0x454
 [<10106068>] parisc_terminate+0x60/0xb4
 [<10133bd0>] rcu_process_callbacks+0x8c/0xf0
 [<10106318>] handle_interruption+0x25c/0x564
 [<10127688>] tasklet_action+0x7c/0xdc
 [<10127424>] do_softirq+0xf0/0xf8
 [<10107254>] do_cpu_irq_mask+0x88/0xfc
 [<1010a088>] intr_check_sig+0x0/0xc
 [<1010a068>] intr_return+0x0/0x14
 [<101fa024>] init_dev+0x5c/0x4c8
 [<10378fb8>] start_kernel+0x4/0x200
 [<101fa01c>] init_dev+0x54/0x4c8
 [<101fab10>] tty_open+0x90/0x394
 [<10165560>] do_lookup+0xb0/0xc8
 [<10160fe8>] chrdev_open+0xac/0x144
 [<10157eb0>] get_empty_filp+0x60/0x124
 [<101b0f5c>] devfs_open+0xa0/0xd0
 [<101564e4>] dentry_open+0x12c/0x1b0
 [<101563b0>] filp_open+0x68/0x70
 [<10123c2c>] printk+0x140/0x1b4
 [<1015684c>] sys_open+0x70/0xb0
 [<101002b0>] init+0x5c/0x150
 [<10109c5c>] ret_from_kernel_thread+0x1c/0x24


Kernel Fault: Code=26 regs=105583c0 (Addr=00000b98)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 1033c010 101fa01c 1032e088
r04-07  00000b00 00000008 00000002 00000002
r08-11  100b05a0 103cf810 10320010 10378fb8
r12-15  00000000 105582cc 00000001 f0000704
r16-19  f000b858 00000002 00000000 00000001
r20-23  00000000 00000501 10110cc0 00000002
r24-27  105582cc 00000002 1033c528 1031e010
r28-31  00000b00 00000005 105583c0 101fad90
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101fa020 101fa024
 IIR: 48930130    ISR: 00000000  IOR: 00000b98
 CPU:        0   CR30: 10558000 CR31: 1036d000
 ORIG_R28: 105678e0
 IAOQ[0]: init_dev+0x58/0x4c8
 IAOQ[1]: init_dev+0x5c/0x4c8
 RP(r2): init_dev+0x54/0x4c8

--------------030807030904080702090800--
