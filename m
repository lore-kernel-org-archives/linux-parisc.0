Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mel-rti19.wanadoo.fr (unknown [193.252.19.44])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0753482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 29 Oct 2001 13:41:07 -0700 (MST)
Message-ID: <005401c160ba$56bd13a0$010101a8@TPDEV.local>
From: "jean-yves GUILLEVIC" <jean-yves.guillevic@wanadoo.fr>
To: <parisc-linux@lists.parisc-linux.org>
Date: Mon, 29 Oct 2001 21:43:12 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] 715S/33 aka Strider-33
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

Hello All

I got a 715S/33 aka Strider-33 than does not want to boot PALINUX :~)
this is some information about my machine as Thomas Marteau requested.
i do not have HPUX so i cannot record it and answer some questions in the
hardware database.
i record my machine as a 715/33 aka Scorpio-33 but it is not one.it is a
Strider-33
there is many ref for this machine Apollo modele 715t/33 (from the front)
and also 425t (back)
i do my kernel by myself because none of the other went so far from the
CDROM v0.9.0 and v0.9.2.
i use linux-20011011.tar.gz
the x-compiler comes from  xc-20010905.tar.gz
and for palo palo-20010909.tar.gz
i build a disque on a pc and i plug it in the HPPA. (and try one more
boot...)
if someone can help he will be welcome.
if someone wants more info just ask.
Regards
Jean-Yves

following a listing of my best infos:

(c) Copyright.  Hewlett-Packard Company.  1992.
All rights reserved.
Portions of this code are (c) Copyright Samsung Electronics Co., Ltd, 91, 92

PDC ROM rev. 1.0
IODC ROM rev. 1.0
64 MB of memory have been configured.


Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.3.0                 FUJITSU M1606S-512



b)   Boot from specified device
s)   Search for bootable devices
a)   Enter Boot Administration mode
x)   Exit and continue boot sequence
?)   Help

Select from menu: a
BOOT_ADMIN> info all
---------------------- Boot Sequence/Miscellaneous
Information ---------------

Wed Oct  10 21:36:01 GMT 2001    (20:01:10:10:21:36:01)
OSF Operating System selected.
Autoselect OFF.
Secure Boot Mode OFF.
LAN Station Address:  080009-41f40f
FASTSIZE =      0x08   ( 64 MB)
64 MB of memory have been configured.

Primary boot path   = scsi.6.0
Alternate boot path = scsi.5.0
Console path        = graphics_1
Keyboard path       = hil

----------- I/O and Processor Dependent Code (PDC/IODC)
Revisions -----------

Processor Dependent Code (PDC) Revision  = 1.0

EISA Adapter IODC
     Hardware Version              208     (0x000000d0)
     Software Version            30208     (0x00007600)

SCSI IODC
     Hardware Version              208     (0x000000d0)
     Software Version            28928     (0x00007100)
     IODC Revision                   0     (0x00000000)

LAN IODC
     Hardware Version              208     (0x000000d0)
     Software Version            29184     (0x00007200)
     IODC Revision                   0     (0x00000000)

RS232 IODC
     Hardware Version              208     (0x000000d0)
     Software Version            29952     (0x00007500)
     IODC Revision                   0     (0x00000000)

HP-HIL IODC
     Hardware Version              208     (0x000000d0)
     Software Version            29440     (0x00007300)
     IODC Revision                   0     (0x00000000)


----------------------------- Hardware
Configuration ------------------------

Machine model: 9000/715

Processor Frequency             = 33333500 Hz
I/O Subsystem Frequency         = 16666750 Hz

SCSI Jumper Frequency setting   = 33333500 Hz
EISA Jumper Frequency setting   = 16500000 Hz


LAN Jumper Status: Internal ThinLAN Port selected

Processor Revision                  = 8
System Controller Revision          = 0
Floating Point Coprocessor Revision = 1

Hardware Version            12592     (0x00003130)
Software Version             1153     (0x00000481)

----------------------------------------------------------------------------

(c) Copyright.  Hewlett-Packard Company.  1992.
All rights reserved.
Portions of this code are (c) Copyright Samsung Electronics Co., Ltd, 91, 92

PDC ROM rev. 1.0
IODC ROM rev. 1.0
64 MB of memory have been configured.


Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.3.0                 FUJITSU M1606S-512



b)   Boot from specified device
s)   Search for bootable devices
a)   Enter Boot Administration mode
x)   Exit and continue boot sequence
?)   Help

Select from menu: b p0

Trying scsi.3.0
Boot path initialized.
Attempting to load IPL.


Hard booted.
palo ipl 0.94 root@jygx Sat Oct 20 08:59:09 CEST 2001
0/vmlinux32 3154742 bytes @ 0x48000
Partition Start(MB) End(MB) Id Type
1               1      23   f0 Palo
2              24     925   83 ext2
3             926    1035   82 swap

Command line: 'HOME=/ TERM=linux root=/dev/sda2 console=ttyS0'

Kernel: partition 2 file /vmlinux32
ext2 block size 4096
ext2_mount(partition 2) returns 0
Opening /vmlinux32
ext2_open(/vmlinux32) = 3
ELF32 executable
Entry 001000d0 first 00100000 n 6
Segment 0 load 00100000 size 1711660 mediaptr 0x1000
Segment 1 load 002a2000 size 281928 mediaptr 0x1a3000
Segment 2 load 002e8000 size 381244 mediaptr 0x1e8000
Segment 3 load 00348000 size 8192 mediaptr 0x246000
Segment 4 load 00350000 size 32768 mediaptr 0x248000
Segment 5 load 0038e67c size 88016 mediaptr 0x25067c
branching to kernel entry point 0x001000d0
Linux version 2.4.9-pa47 (root@jygx) (gcc version 3.0.2 20010829
(prerelease)) #3 Sat Oct 20 08:54:02 CEST 2001
Kernel loaded. Setup...
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00003130 00000481 00000000 00000000 7825e314 ffffffff 00000004
0000000a 0000000a
vers 00000008
CPUID vers 0 rev 0
model 9000/715
Total Memory: 64 Mb
pagetable_init
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/sda2 console=ttyS0
Console: colour dummy device 160x64
Calibrating delay loop... 33.17 BogoMIPS
Memory: 61656k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Searching for devices...
Found devices:
1. Strider-33 Core BA (11) at 0xf082f000, versions 0xd, 0x0, 0x70
2. Strider-33 Core SCSI (10) at 0xf0825000, versions 0xd, 0x0, 0x71
3. Strider-33 Core LAN (802.3) (10) at 0xf0826000, versions 0xd, 0x0, 0x72
4. Strider-33 Core HIL (10) at 0xf0821000, versions 0xd, 0x0, 0x73
5. Strider-33 Core RS-232 (10) at 0xf0823000, versions 0xd, 0x0, 0x75
6. Strider-33 Core RS-232 (10) at 0xf0822000, versions 0xd, 0x0, 0x75
7. Strider-33 Core Centronics (10) at 0xf0824000, versions 0xd, 0x0, 0x74
8. Strider-33 Audio (10) at 0xf1000000, versions 0xd, 0x0, 0x7b
9. Strider-33 Core EISA (11) at 0xfc000000, versions 0xd, 0x0, 0x76
10. Strider-33 (715S/33) (0) at 0xfffbe000, versions 0x313, 0x0, 0x4
11. Strider-33 (707T) (1) at 0xfffbf000, versions 0x1d, 0x0, 0x9
That's a total of 11 devices.
CPU(s): 1 x PA7100 (PCX-T) at 33.333500 MHz
Mongoose EISA Adapter found at 0xfc000000
Asp version 1 at 0xf0800000 found.
LED (ASP-style) display at f0800020 registered
POSIX conformance testing by UNIFIX
**************JYG 20011012***************
lock_kernel.
do_basic_setup.
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
Warning : device (10, 0xd, 0x0, 0x73) NOT claimed by HIL
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0826000, IRQ 87
82596.c: MAC of HP700 LAN read from EEPROM
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 41 F4 0F IRQ 87.
82596.c $Revision: 1.23 $
SCSI subsystem driver Revision: 1.00
53c700: consistent memory allocation failed
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0
scsi0 : LASI SCSI 53c700
  Vendor: FUJITSU   Model: M1606S-512        Rev: 6C01
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 3, lun 0
scsi0: (3:0) Enabling Tag Command Queuing
SCSI device sda: 2131992 512-byte hdwr sectors (1092 MB)
Partition check:
 sda: sda1 sda2 sda3



Dumping Stack from 104fc000 to 104fc600:
c000 00000000 00000040 00000000 00000000 102b5160 00000000 00000000 ffffffff
c020 00000004 00000000 00000000 00000000 00000000 00000000 ffffffff 102b23e0
c040 102b23e0 00000b45 104f4000 10348000 102bb600 00000000 00000000 00000000
c060 00000000 00000000 00000000 00000001 00000000 00000000 00000000 00000000
c080 00000000 10348000 10348000 104d0000 104ec000 00000000 104dc098 10348098
c0a0 00000000 102b40b4 104fc0a8 104fc0a8 00000000 00000000 00000000 00000000
c0c0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 104fc000
c0e0 1011b008 00000000 00000204 00000000 00000000 000008bc 00000000 00000ac0
c100 00000000 00000000 00000000 00000000 00000000 00000000 80000000 00000000
c120 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c140 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c160 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c180 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1a0 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c1c0 fffffeff 00000000 ffffffff 00000000 102b6120 ffffffff ffffffff ffffffff
c1e0 ffffffff ffffffff ffffffff 00800000 05000000 00000000 ffffffff ffffffff
c200 ffffffff 000003c3 000003c3 00000400 00000400 ffffffff ffffffff ffffffff
c220 ffffffff ffffffff ffffffff 00007377 61707065 72000000 00000000 00000000
c240 00000000 00000000 00000000 00000000 00000000 00000000 00003c36 00800327
c260 102b7010 00003c36 000ff000 1027a170 1002ada0 0004000e fc4ff000 fc4ff000
c280 00000089 10119424 0006e480 00003c36 00800327 10361810 1035d75b 102e8fd4
c2a0 00000024 0000003c 0000003e 102b5010 00000001 1035d75b 00000089 00000000
c2c0 10100420 00003c36 00000000 0000000b 10350000 0006e480 00003c36 10365abc
c2e0 10287884 1002e120 00000089 10350000 0006e480 00003c36 00008124 1035d73a
c300 1035d737 101595e4 00000010 00000010 00000000 00000000 00000003 00000000
c320 10348554 10287a70 00000000 102e8fd4 00000000 102e1804 1035a290 1035a010
c340 1035a010 101595e4 102e18d4 1035a650 41000000 00000000 00000003 00000000
c360 10348594 1028787c 00000000 103a4e40 1029a2e8 1029a2ec fc4ff000 00000089
c380 00000008 10159018 0000000a 1035a6c8 103485e8 00000000 fc4ff000 00000001
c3a0 00008124 10348594 000000f0 103a4240 00000000 1002d000 1002c040 1035a010
c3c0 1035a010 10159018 fffffff0 10027120 30313233 34353637 00000000 1002c040
c3e0 1002b0a0 1002c040 00000000 102b7410 0004000e fc4ff000 fc4ff000 1035a010
c400 1035a010 1012f338 00000000 1035d010 00000001 104fc9c0 10106cf0 00000001
c420 000000f0 00000000 000000f0 103a4e40 fff00000 40000000 00000000 00000000
c440 102bb040 102bb060 102bb1fc 00000000 00000000 00000000 104fc454 00000000
c460 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c480 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
c4a0 00000000 00000000 00000000 10106c4c 00000000 00000000 00000000 00000000
c4c0 00000000 10348000 00000000 00000000 0000088b 00000001 00000001 1027a244
c4e0 00000000 00000000 00000000 10100458 00000000 00000000 00000000 00000000
c500 10348000 00be0000 f0001018 000ff000 001a5a59 102e8fd4 0004000e fc4ff000
c520 102b5010 104fc000 102bb600 102e9194 10348000 00be0000 00000000 00000000
c540 104fc000 102bb600 00000000 1034513c 1034510c 104d9c40 102b7410 1028d8d0
c560 1034513c 103450cc 00000000 102fa9e0 00000000 00000000 00000000 00000000
c580 1034513c 10345104 00000000 104fc58c 104fc58c 103450e4 00000000 104fc58c
c5a0 104fc58c 104fc000 fc4ff000 1010a828 104fc000 102bb600 102d4af0 1034513c
c5c0 00000007 102d5d50 1035a5d8 0004000e fc4ff000 102b5010 102d4010 00000000
c5e0 102d5544 00000000 00000000 102fab74 102d53d0 104d9d40 00000000 104d9d40

High Priority Machine Check (HPMC): Code=1 regs=102a5080 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111000001111
r0-3     00000000 1021e800 102fab98 10373810
r4-7     10374004 1035a5d8 1035a010 1035a010
r8-11    102b5010 fc4ff000 0004000e 102e8fd4
r12-15   001a5a59 000ff000 f0001018 00000000
r16-19   00000001 08000058 f000069c 0000000f
r20-23   00000000 102d5d40 1021fed0 0000ffff
r24-27   102d5c68 10295c10 f1000001 102a2010
r28-31   000000ff 00000780 104fc600 1021f244
sr0-3    00000000 00000000 00000000 00000000
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1021efe8 1021efec
 IIR: e840c000    ISR: 00000000  IOR: 102fab98
 CPU:        0   CR30: 104fc000 CR31: 10350000
 ORIG_R28: 00000000
