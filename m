Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5FE644832
	for <parisc-linux@parisc-linux.org>; Thu, 20 Feb 2003 08:19:36 -0700 (MST)
Date: Thu, 20 Feb 2003 16:19:32 +0100
Message-ID: <3E54DBA20000009A@ocpmta3.freegates.net>
In-Reply-To: <3E48441000002658@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] .config fo a N class?
To: grundler@dsl2.external.hp.com
Cc: parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>-- Original Message --
>From: "Joel Soete" <jsoe0708@tiscali.be>
>Subject: Re: [parisc-linux] .config fo a N class?
>To: grundler@dsl2.external.hp.com
>Cc: parisc-linux@parisc-linux.org
>Date: Wed, 19 Feb 2003 09:19:49 +0100
>
>>
>>On Mon, Feb 17, 2003 at 06:51:01PM +0100, Joel Soete wrote:
>>> >I grab the config file of the test-drive L model; apply it against current
>>> >k-2.4.20-pa26 (just change 64 to 32 bits).
>>>                             ^^^^^^^^^^^^^ My bad: I would have to remember
>>> that hpux-11 have to be 64bits on L and N servers :?
>>
>>right. But L-class also only supports 64-bit.
>>And you want to disable CONFIG_SMP for N-class and L3000.
>>
>>> Well, for now I just boot with a dpkg kernel-image-2.4.19-64 (up) and
>still
>>> have to see what is wrong with eth0:
>>
>>You were not very clear about the symptom.
>
>Yes, sorry: my first goal was to advise that I reach to boot the N and will
>go later examine this pb.
>
>IIRC to start up this box I first unplug the NIC cable to avoid network
>pb.
>After that I changed the config file to restart the built-in NIC which didn't
>come up? A strange thing that I noticed was that there was not hard led
>lighted.
>
>It should be because the switch disable temporarely the port after the cut
>of the link? I will check further...
>
>>And we need a slightly more accurate description
>>of the kernel-image version number.
>>
>it is the image from kernel-image-2.4.19-64_22.2_hppa.deb
>
>>But this might help you anyway
>>| > cvs log driver/nets/tulip/media.c
>>...
>>| revision 1.14
>>|
>>| date: 2002/10/14 23:34:02;  author: grundler;  state: Exp;  lines: +13
>>-13
>>|
>>| 2.4.19-pa22 Fix tulip phy reset/init
>>| DP83840A.pdf and lxt971d.pdf both require polling
>>| the reset bit (bit 15) in mdio control register to
>>| determine when a reset has completed. Then the
>>| "init" sequence can be sent.
>>
>I will check if I can still find back some sources
>>
>>> eth0 Digital DS21143 Tulip rev 65 at 0x80 ... irq 128
>>>
>>> Is there known problem with this type of NIC?
>>
>>yes - there was. But built-in should work. add-on cards had problems.
>>
>>> Next step would be to install a gcc-64 to recompile the kernel 2.4.20-pa27
>>> and have a new look on this eth0.
>>
>>yes - good plan
>>
Yes it was the best, here is my dmesg (get through NIC):

Linux version 2.4.20-pa27-64 (root@palx2000) (gcc version 3.2.3 20030208
(prerelease)) #1 Wed Feb 19 18:05:47 CET 2003
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model 00005d30 00000491 00000000 00000002 27988e5d 100000f1 00000008 000000b2
000000b2
vers  00000301
CPUID vers 18 rev 11 (0x0000024b)
capabilities 0x1
model 9000/800/N4000-55
Total Memory: 2048 Mb
pagetable_init
On node 0 totalpages: 524288
zone(0): 524288 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=3/boot/vmlinux-2.4.20-pa27-64
Console: colour dummy device 160x64
Calibrating delay loop... 1097.72 BogoMIPS
Memory: 2043596k available
Dentry cache hash table entries: 131072 (order: 9, 2097152 bytes)
Inode cache hash table entries: 131072 (order: 9, 2097152 bytes)
Mount-cache hash table entries: 32768 (order: 7, 524288 bytes)
Buffer-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Page-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Searching for devices...
Found devices:
1. Memory (1) at 0xfffffffffedc0000 [192], versions 0x90, 0x0, 0x9
2. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed00000 [0], versions
0x803, 0x0, 0xc
3. Elroy PCI Bridge (13) at 0xffffffffbffe0000 [0/0], versions 0x782, 0x0,
0xa
4. Elroy PCI Bridge (13) at 0xffffffffbffe2000 [0/1], versions 0x782, 0x0,
0xa
5. Elroy PCI Bridge (13) at 0xffffffffbffe4000 [0/2], versions 0x782, 0x0,
0xa
6. Elroy PCI Bridge (13) at 0xffffffffbffe8000 [0/4], versions 0x782, 0x0,
0xa
7. Elroy PCI Bridge (13) at 0xffffffffbffea000 [0/5], versions 0x782, 0x0,
0xa
8. Elroy PCI Bridge (13) at 0xffffffffbfff0000 [0/8], versions 0x782, 0x0,
0xa
9. Elroy PCI Bridge (13) at 0xffffffffbfff4000 [0/10], versions 0x782, 0x0,
0xa
10. Elroy PCI Bridge (13) at 0xffffffffbfff8000 [0/12], versions 0x782, 0x0,
0xa
11. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed40000 [1], versions
0x803, 0x0, 0xc
12. Elroy PCI Bridge (13) at 0xfffffffffece0000 [1/0], versions 0x782, 0x0,
0xa
13. Elroy PCI Bridge (13) at 0xfffffffffece4000 [1/2], versions 0x782, 0x0,
0xa
14. Elroy PCI Bridge (13) at 0xfffffffffece8000 [1/4], versions 0x782, 0x0,
0xa
15. Elroy PCI Bridge (13) at 0xfffffffffecf0000 [1/8], versions 0x782, 0x0,
0xa
16. Elroy PCI Bridge (13) at 0xfffffffffecf4000 [1/10], versions 0x782, 0x0,
0xa
17. Elroy PCI Bridge (13) at 0xfffffffffecf8000 [1/12], versions 0x782, 0x0,
0xa
18. DEW BC Runway Port (7) at 0xfffffffffed24000 [36], versions 0x584, 0x0,
0xc
19. Unknown machine (0) at 0xfffffffffed25000 [37], versions 0x5d3, 0x0,
0x0
20. DEW BC Runway Port (7) at 0xfffffffffed2c000 [44], versions 0x584, 0x0,
0xc
21. Unknown machine (0) at 0xfffffffffed2d000 [45], versions 0x5d3, 0x0,
0x0
CONFIG_SMP=n  ignoring additional CPUs
CPU(s): 1 x PA8600 (PCX-W+) at 550.000000 MHz
SBA found Ike rev 2 at 0xfffffffffed00000
SBA found Ike rev 2 at 0xfffffffffed40000
lba version TR4.0 (0x5) found at 0xffffffffbffe0000
lba range[2] : ignoring GMMIO (0xfffffff004000000)
lba version TR4.0 (0x5) found at 0xffffffffbffe2000
lba range[2] : ignoring GMMIO (0xfffffff084000000)
lba version TR4.0 (0x5) found at 0xffffffffbffe4000
NOTICE: PCI bus reset still asserted! (clearing)
NOTICE: Enabling PCI Arbitration
lba range[2] : ignoring GMMIO (0xfffffff104000000)
lba version TR4.0 (0x5) found at 0xffffffffbffe8000
lba range[2] : ignoring GMMIO (0xfffffff204000000)
lba version TR4.0 (0x5) found at 0xffffffffbffea000
lba range[2] : ignoring GMMIO (0xfffffff284000000)
lba version TR4.0 (0x5) found at 0xffffffffbfff0000
NOTICE: PCI bus reset still asserted! (clearing)
NOTICE: Enabling PCI Arbitration
lba range[2] : ignoring GMMIO (0xfffffff404000000)
lba version TR4.0 (0x5) found at 0xffffffffbfff4000
NOTICE: PCI bus reset still asserted! (clearing)
NOTICE: Enabling PCI Arbitration
lba range[2] : ignoring GMMIO (0xfffffff504000000)
lba version TR4.0 (0x5) found at 0xffffffffbfff8000
NOTICE: PCI bus reset still asserted! (clearing)
NOTICE: Enabling PCI Arbitration
lba range[2] : ignoring GMMIO (0xfffffff604000000)
lba version TR4.0 (0x5) found at 0xfffffffffece0000
NOTICE: PCI bus reset still asserted! (clearing)
NOTICE: Enabling PCI Arbitration
lba range[2] : ignoring GMMIO (0xfffffff804000000)
lba version TR4.0 (0x5) found at 0xfffffffffece4000
NOTICE: PCI bus reset still asserted! (clearing)
NOTICE: Enabling PCI Arbitration
lba range[2] : ignoring GMMIO (0xfffffff904000000)
lba version TR4.0 (0x5) found at 0xfffffffffece8000
NOTICE: PCI bus reset still asserted! (clearing)
NOTICE: Enabling PCI Arbitration
lba range[2] : ignoring GMMIO (0xfffffffa04000000)
lba version TR4.0 (0x5) found at 0xfffffffffecf0000
NOTICE: PCI bus reset still asserted! (clearing)
NOTICE: Enabling PCI Arbitration
lba range[2] : ignoring GMMIO (0xfffffffc04000000)
lba version TR4.0 (0x5) found at 0xfffffffffecf4000
lba range[2] : ignoring GMMIO (0xfffffffd04000000)
lba version TR4.0 (0x5) found at 0xfffffffffecf8000
lba range[2] : ignoring GMMIO (0xfffffffe04000000)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch support not available.
Performance monitoring counters enabled for Unknown machine
Starting kswapd
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
STI GSC/PCI graphics driver version 0.9
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI
enabled
ttyS00 at iomem 0xffffffff80000000 (irq = 132) is a 16550A
ttyS01 at iomem 0xffffffff80000008 (irq = 132) is a 16450
ttyS02 at iomem 0xffffffff80000010 (irq = 132) is a 16550A
ttyS03 at iomem 0xffffffff80000038 (irq = 132) is a 16550A
lp: driver loaded but no devices found
Generic RTC Driver v1.07
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre12 (Aug 9, 2002)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at 0x80, 00:30:6E:1C:B2:0B, IRQ 128.
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
tulip1:  Advertising 01e1 on PHY 1, previously advertising 0101.
eth1: Digital DS21143 Tulip rev 65 at 0x40000, 00:30:6E:21:14:B4, IRQ 384.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 2, function 0
sym53c8xx: 53c875 detected 
sym53c8xx: at PCI bus 0, device 2, function 1
sym53c8xx: 53c875 detected 
sym53c8xx: at PCI bus 0, device 1, function 0
sym53c8xx: 53c895 detected 
sym53c875-0: rev 0x37 on pci bus 0 device 2 function 0 irq 130
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-1: rev 0x37 on pci bus 0 device 2 function 1 irq 131
sym53c875-1: ID 7, Fast-20, Parity Checking
sym53c895-2: rev 0x1 on pci bus 0 device 1 function 0 irq 129
sym53c895-2: ID 7, Fast-20, Parity Checking
sym53c895-2: SCSI bus mode change from 80 to 80.
scsi0 : sym53c8xx-1.7.3c-20010512
scsi1 : sym53c8xx-1.7.3c-20010512
scsi2 : sym53c8xx-1.7.3c-20010512
blk: queue 000000008f952428, I/O limit 4095Mb (mask 0xffffffff)
  Vendor: SEAGATE   Model: ST34371N          Rev: HPM4
  Type:   Direct-Access                      ANSI SCSI revision: 02
blk: queue 000000008f952628, I/O limit 4095Mb (mask 0xffffffff)
Attached scsi disk sda at scsi2, channel 0, id 4, lun 0
sym53c895-2-<4,*>: FAST-20 SCSI 20.0 MB/s (50.0 ns, offset 15)
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 >
STI GSC/PCI graphics driver version 0.9
BUG: Skipping previously registered driver: sti (native)
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :  2542.400 MB/sec
   8regs_prefetch:  1948.800 MB/sec
   32regs    :  2065.600 MB/sec
   32regs_prefetch:  1938.400 MB/sec
raid5: using function: 8regs (2542.400 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 16384 buckets, 128Kbytes
TCP: Hash tables configured (established 262144 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 314k freed
Adding Swap: 123680k swap-space (priority -1)

I will now build another Debian unstable disk :)

Cheers,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
