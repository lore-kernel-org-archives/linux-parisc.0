Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sun2.gestelvan.nl (d107214.upc-d.chello.nl [213.46.107.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0391D4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 Jan 2003 13:00:11 -0700 (MST)
Received: from mijn.mine.nu (amd.gestelvan.nl [192.168.11.20])
	by sun2.gestelvan.nl (8.9.3/8.9.3) with ESMTP id VAA07191
	for <parisc-linux@lists.parisc-linux.org>; Sat, 4 Jan 2003 21:02:05 +0100
Message-ID: <3E173DE1.4090203@mijn.mine.nu>
Date: Sat, 04 Jan 2003 21:02:41 +0100
From: Frank van Gestel <fvgestel@mijn.mine.nu>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] hp735 Differential SCSI
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

Hello,

I recently got my hands on a hp735, with some diskarrays connected to 
the differential scsi interface. I'm now trying get the kernel driver 
working. I read a lot of posts about it in the past and I found the 
outfield patch on the ftp-site.
After installing latest kernel sources and patch, I tried compiling a 
new kernel. This kernel resulted in crash. After some debugging I found 
out that the zalon address was used instead of the outfield, so I made 
the following change in zalon7xx.c :

hosts_used = zalon_attach(hosts_tptr, dev->hpa +
                (zalon?GSC_SCSI_ZALON_OFFSET:SCSI_OUTFIELD_OFFSET),
                dev, irq, zalon_id, !zalon /* outfield */);

Now the kernel detects the chip. It still crashes the kernel. After 
numerous hard resets and a lot of debugging lines, I got the 
boot-sequence shown below. I'm not a hardware guy  and know nothing 
about registerscripts, etc... Anybody else got ideas?...

Frank van Gestel

------------------------------------------------------

(c) Copyright.  Hewlett-Packard Company.  1992.
All rights reserved.

PDC ROM rev. 2.7
IODC ROM rev. 1.1
224 MB of memory configured and tested.


Selecting a system to boot.
To stop selection process, press and hold the ESCAPE key.

Selection process stopped.

Searching for Potential Boot Devices.
To terminate search, press and hold the ESCAPE key.

Device Selection      Device Path              Device Type
----------------------------------------------------------------------------

P0                    scsi.1.0                 MICROP  1588-15MBSUN0669
P1                    scsi.0.0                 MAXTOR  LXT-213S SUN0207
P2                    fwscsi.6.0               SEAGATE ST32430W
P3                    lan.080020-11f7e6.0.0    sun2



b)    Boot from specified device
s)    Search for bootable devices
a)    Enter Boot Administration mode
x)    Exit and continue boot sequence
?)    Help

Select from menu: b
Enter boot selection, (h)elp, or e(x)it: p3

Trying lan.080020-11f7e6.0.0
Boot path initialized.
Attempting to load IPL.


Hard booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

Boot image contains:
    0/vmlinux32 3067289 bytes @ 0x8000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'HOME=/ root=/dev/sdb2 console=ttyS0 TERM=vt102 
palo_ke

rnel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing 
32-bit kernel ELF32 executable
Entry 00100208 first 00100000 n 6
Segment 0 load 00100000 size 1836364 mediaptr 0x1000
Segment 1 load 002c2000 size 277984 mediaptr 0x1c2000
Segment 2 load 00308000 size 230992 mediaptr 0x206000
Segment 3 load 00344000 size 8192 mediaptr 0x23f000
Segment 4 load 00348000 size 32768 mediaptr 0x241000
Segment 5 load 00371984 size 93920 mediaptr 0x249984
Branching to kernel entry point 0x00100208.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.20-pa18 (root@hp735) (gcc version 3.0.4) #29 Sat Jan 4 
19:52:4

1 CET 2003
FP[0] enabled: Rev 1 Model 9
The 32-bit Kernel has started...
Determining PDC firmware type: Snake.
model 00002060 00000481 00000000 00000000 00ce8116 ffffffff 00000004 
0000000a 0000000a
vers  00000016
model 9000/735
Total Memory: 224 Mb
pagetable_init
On node 0 totalpages: 57344
zone(0): 57344 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ root=/dev/sdb2 console=ttyS0 TERM=vt102 
palo_kernel=0/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 124.51 BogoMIPS
Memory: 223996k available
Dentry cache hash table entries: 32768 (order: 6, 262144 bytes)
Inode cache hash table entries: 16384 (order: 5, 131072 bytes)
Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 65536 (order: 6, 262144 bytes)
Searching for devices...
Found devices:
1. Coral SGC Graphics (10) at 0xf8000000 [1], versions 0x4, 0x0, 0x77
2. Outfield Core BA (11) at 0xf082f000 [2], versions 0x9, 0x0, 0x70
3. Outfield Core SCSI (10) at 0xf0825000 [2/0/1], versions 0x9, 0x0, 0x71
4. Outfield Core LAN (802.3) (10) at 0xf0826000 [2/0/2], versions 0x9, 
0x0, 0x72
5. Outfield Core HIL (10) at 0xf0821000 [2/0/3], versions 0x9, 0x0, 0x73
6. Outfield Core RS-232 (10) at 0xf0823000 [2/0/4], versions 0x9, 0x0, 0x75
7. Outfield Core RS-232 (10) at 0xf0822000 [2/0/5], versions 0x9, 0x0, 0x75
8. Outfield Core Centronics (10) at 0xf0824000 [2/0/6], versions 0x9, 
0x0, 0x74
9. Outfield FW SCSI (10) at 0xf0830000 [2/0/7], versions 0x9, 0x0, 0x7c
10. Outfield Audio (10) at 0xf1000000 [2/0/8], versions 0x9, 0x0, 0x7f
11. Cobra EISA BA (11) at 0xfc000000 [4], versions 0x4, 0x0, 0x76
12. Snake Cheetah (735/130) (0) at 0xfffbe000 [8], versions 0x206, 0x0, 0x4
13. Memory (1) at 0xfffbf000 [9], versions 0x37, 0x0, 0x9
CPU(s): 1 x PA7100 (PCX-T) at 125.000000 MHz
Cutoff version 4 at 0xf082f000 found.
LED (ASP-style) display at f0800020 registered
Mongoose EISA Adapter found at 0xfc000000
EISA EEPROM at 0xf0810400
Enumerating EISA bus
EISA slot 1: HWP1850 EISA IRQ 3
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch support not available.
Starting kswapd
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
parport_init_chip: enhanced parport-modes not supported.
parport0: PC-style at 0xf0824800, irq 88 [PCSPP]
STI GSC/PCI graphics driver version 0.9
STI byte mode ROM at f8000000, hpa at f8000000
STI id 26d1482a-40a00499, conforms to spec rev. 8.02
STI device: HPA1659A
Console: switching to colour frame buffer device 160x64
fb0: stifb 1280x1024-8 frame buffer device, id: 26d1482a, mmio: 0xf8100000
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with no serial options enabled
ttyS00 at iomem 0xf0823800 (irq = 90) is a 16550A
ttyS01 at iomem 0xf0822800 (irq = 89) is a 16550A
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0826000, IRQ 87
82596.c: MAC of HP700 LAN read from EEPROM
eth0: Couldn't get consistent shared memory
eth0: 82596 at 0xf0826000, 08 00 09 8C 45 7C IRQ 87.
82596.c $Revision: 1.30 $
SCSI subsystem driver Revision: 1.00
scsi_register_host: tttt1
scsi_register_host: tttt2
zalon7xx_detect: ttt1
zalon_attach
ncr53c8xx: 
setup=disc:y,specf:3,tags:8,sync:12,burst:7,wide:y,diff:0,revprob:n,b

uschk:0x1
ncr53c8xx: 
setup=mpar:y,spar:y,fsn=n,verb:0,debug:0x0,led:n,settle:2,irqm:0x0,nv

ram:0x1,pcifix:0x0
io_port:F0830100
ncr53c8xx: 53c720 detected
ncr_attach
ncr_prepare_setting
ncr_init_burst
ncr_init_burst
ncr_name
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
ncr_prepare_setting
ncr_script_fill start
ncr_script_fill end
ncr_script_copy_and_bind start
ncr_script_copy_and_bind end
ncr_script_copy_and_bind start
ncr_script_copy_and_bind end
ncr_chip_reset start
ncr_chip_reset end
ncr_snooptest start
ncr_regtest start
ncr_regtest end
do_big_flush start
do_big_flush end
/* instruction  OUTL (nc_dsp, (v)) generates CPU exceptions : */
Trap 5 on CPU 0

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  00000000 102d012c 10109064 00000001
r04-07  1008e000 0008b244 00000000 10336810
r08-11  1008e034 00000000 00000002 000f4000
r12-15  00000001 000ff000 f0001420 00000000
r16-19  100556c0 08000058 c000c000 90000000
r20-23  00000000 00000001 28181da7 0000021b
r24-27  00000001 00000064 102d0230 102c0010
r28-31  00000000 00000005 10055900 1011fed8
sr0-3   00000000 00000000 00000000 00000000
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10109068 1010906c
 IIR: 2269f204    ISR: 00000000  IOR: 102d3800
 CPU:        0   CR30: 10054000 CR31: 10348000
 ORIG_R28: 103571ff

*/  After removing the instruction, the folllowing happens : */
ncr_chip_reset start
ncr_chip_reset end
CACHE TEST FAILED: timeout.
CACHE INCORRECTLY CONFIGURED.
ncr_name
ncr53c720-0: detaching...
