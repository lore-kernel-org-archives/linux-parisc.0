Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx04.nexgo.de (mx04.nexgo.de [151.189.8.80])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC61D482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Dec 2001 13:33:33 -0700 (MST)
Received: from hrzpub.tu-darmstadt.de (dialin-145-254-194-012.arcor-ip.net [145.254.194.12])
	by mx04.nexgo.de (Postfix) with ESMTP id A482A37F3D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Dec 2001 21:33:18 +0100 (CET)
Message-ID: <3C1D0565.3000805@hrzpub.tu-darmstadt.de>
Date: Sun, 16 Dec 2001 21:34:45 +0100
From: =?ISO-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/mixed;
 boundary="------------020905020905010301050705"
Subject: [parisc-linux] StiFB-Problems
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
--------------020905020905010301050705
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi there,

I have a question concerning the StiFB. I have  715/100 with two 
graphics cards, a built-in one and a HCRX-24 (listed by the kernel as 
Coral SGC). How can I change the device of the StiFB?
I tried sti=0 and sti=1 as boot parameter, but nothing happens. The 
console always opens on the fb0-device (the HCRX-24). I also tried 
video=map:x , which caused a crash right after palo loaded the kernel.
But I can use the built-in card with XFree86. If I add the line  
"fbdevice" "/dev/fb1" to XF86Config, then XFree starts on the built-in card.
Can somebody help me ? The Resolution of the HCRX (1280x1024) is a 
little bit to high for my 17"-Monitor (The font is so small...)

Another problem : Using mpg321 from the 0.9.3 release gives me  the 
failure "Illegal instruction". Glibc-Version is 2.2.4-7. The stack dump 
is in the attached boot.log-file.

And a last question (a little OT): I want to buy a CD-ROM for my box. 
Which one fits the bay with the panel? I tried a Plextor TS-40, but it 
was a bit to large.

Rüdiger

--------------020905020905010301050705
Content-Type: text/plain;
 name="boot.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="boot.log"

Linux version 2.4.16-pa20 (ruediger@gandalf) (gcc version 3.0.2 (Debian)) #1 Sun Dec 16 14:09:47 CET 2001
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
Kernel command line: root=/dev/sda4 HOME=/ console=tty0 sti=0 sti_font=VGA8x16 TERM=linux
Console: colour dummy device 160x64
Calibrating delay loop... 99.73 BogoMIPS
Memory: 126152k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
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
16. Mirage 100 (1) at 0xfffbf000 [9], versions 0x4b, 0x0, 0x9
CPU(s): 1 x PA7100LC (PCX-L) at 100.000000 MHz
Lasi version 0 at 0xf0100000 found.
LED display at f00e0000 registered
Wax at 0xf0200000 found.
Wax: HIL Keyboard-NMI registered.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Enabled gecko-style soft power switch.
Starting kswapd
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
Trying STI ROM at f4000000, hpa at f4000000
STI byte mode ROM at f4000000, hpa=f4000000
selected 8x16 fb-font VGA8x16
STI byte mode ROM, id 2bcb015a-9a02587, conforms to spec rev. 8.04
 supports 3 monitors
 font start 00003f74
 region list 00003f58
 init_graph 000000d8
 alternate code type 0
region #0: phys f4000000, virt f4000000, len=768kB, btlb=1, sysonly=0, cache=0, last=0
region #1: phys f5000000, virt f5000000, len=16384kB, btlb=1, sysonly=0, cache=0, last=0
region #2: phys f4100000, virt f4100000, len=2560kB, btlb=1, sysonly=0, cache=0, last=0
region #3: phys f40c0000, virt f40c0000, len=256kB, btlb=1, sysonly=0, cache=0, last=0
region #4: phys f4c00000, virt f4c00000, len=4096kB, btlb=1, sysonly=0, cache=0, last=0
region #5: phys f4380000, virt f4380000, len=4kB, btlb=0, sysonly=1, cache=0, last=1
3 text planes
1280 x 1024 screen resolution
   0 x    0 offscreen
2048 x 1024 layout
regions at f4000000 f5000000 f4100000 f40c0000
regions at f4c00000 f4380000 00000000 00000000
reent_lvl 0
save_addr 0006a400
monitor 3
in friendly mode: 0
power consumption 0 watts
freq ref 0
sti_mem_addr 005ef460 (size=256 bytes)
8 bits per pixel
8 used bits
24 planes
attributes 00003836
STI device: HPA4071A
Trying STI ROM at f8000000, hpa at f8000000
Trying STI ROM at f0024000, hpa at f8000000
STI word mode ROM at f0024000, hpa=f8000000
STI word mode ROM, id 2b4ded6d-40a00499, conforms to spec rev. 8.04
 supports 13 monitors
 font start 000037d4
 region list 000037c0
 init_graph 00000808
 alternate code type 0
region #0: phys f0024000, virt f0024000, len=24kB, btlb=1, sysonly=0, cache=0, last=0
region #1: phys f9000000, virt f9000000, len=16384kB, btlb=1, sysonly=0, cache=0, last=0
region #2: phys f8100000, virt f8100000, len=2560kB, btlb=1, sysonly=0, cache=0, last=0
region #3: phys f8380000, virt f8380000, len=4kB, btlb=0, sysonly=1, cache=0, last=1
3 text planes
1024 x  768 screen resolution
   0 x    0 offscreen
2048 x 1024 layout
regions at f0024000 f9000000 f8100000 f8380000
regions at 00000000 00000000 00000000 00000000
reent_lvl 0
save_addr 0006a800
monitor 9
in friendly mode: 0
power consumption 0 watts
freq ref 0
sti_mem_addr 005ef660 (size=256 bytes)
8 bits per pixel
8 used bits
8 planes
attributes 00001836
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
Found HIL at 0xf0201000, IRQ 126
HIL: no keyboard present.
Warning : device (10, 0x13, 0x0, 0x73) NOT claimed by HIL
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Found i82596 at 0xf0107000, IRQ 87
eth0: 82596 at 0xf0107000, 08 00 09 7A DC 08 IRQ 87.
82596.c $Revision: 1.27 $
SCSI subsystem driver Revision: 1.00
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2 
scsi0 : LASI SCSI 53c700
scsi0: (6:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST32430N          Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
scsi0: (6:0) Enabling Tag Command Queuing
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
Lasi Harmony Audio rev. 18 at 0xf0104000, using IRQ 82
sticonsole_init: searching for STI ROMs
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     : 17177.600 MB/sec
   8regs_prefetch:    70.800 MB/sec
   32regs    :   118.400 MB/sec
   32regs_prefetch:   119.200 MB/sec
raid5: using function: 8regs (17177.600 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
NOT FREEING INITMEM
Adding Swap: 132920k swap-space (priority -1)
eth0: link ok.
Warning: Remapping obsolete /dev/fb* minor 32 to 1
mpg321 (pid 219): Privileged operation (code 10)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111000001111 Not tainted
r00-03  00000000 40028cc0 4000b947 00000081
r04-07  4026e3a4 402855d0 40257e84 0002fd90
r08-11  4025163c 40028544 faf03cc8 40257e84
r12-15  4024e000 00000080 4024f1dc 40253a30
r16-19  40028544 0000000c 00000000 40028544
r20-23  0000001b 00036b10 00000000 4024e000
r24-27  40284b10 00000081 40256e58 00027e50
r28-31  00000081 00000041 faf03e00 4000933f
sr0-3   00000018 00000018 00000000 00000018
sr4-7   00000018 00000018 00000018 00000018
IASQ: 00000018 00000018 IAOQ: 4000b66b 4000b66f
 IIR: 04000000    ISR: 00000018  IOR: 00000000
 CPU:        0   CR30: 16b40000 CR31: 10360000
 ORIG_R28: 00000000

--------------020905020905010301050705--
