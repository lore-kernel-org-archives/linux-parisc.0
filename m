Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel11.hp.com (palrel11.hp.com [156.153.255.246])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77A264891
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Mar 2002 11:41:01 -0700 (MST)
Received: from hpindda.cup.hp.com (hpindda.cup.hp.com [15.13.95.92])
	by palrel11.hp.com (Postfix) with ESMTP id 9848E60080B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Mar 2002 10:41:00 -0800 (PST)
Received: from cup.hp.com (maverick.cup.hp.com [15.13.105.84])
	by hpindda.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) with ESMTP id KAA25847
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Mar 2002 10:40:55 -0800 (PST)
Message-ID: <3C924032.6E5BB55D@cup.hp.com>
Date: Fri, 15 Mar 2002 10:40:50 -0800
From: Gururaj Ananthateerta <gururaj@cup.hp.com>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
References: <1016088869.3c904925683bb@webmail.tiscali.be>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 0.93 installations on N-Class.,
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

.93 installation woriking fine on n-class.


uname -a
Linux hpntc668 2.4.9-64 #1 Fri Nov 30 20:18:56 MST 2001 parisc64 unknown



-----------------dmesg -output---------------------------------------------
Linux version 2.4.9-64 (root@paer) (gcc version 3.0) #1 Fri Nov 30 20:18:56 MST
2001
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
Determining PDC firmware type: 64 bit PAT.
model   00005d30 00000491 00000000 00000002 270f3a47 100000f0 00000008 000000b2
000000b2
vers    00000300
cpuid   0000024a
CPUID   vers 18 rev 10
model   9000/800/N4000-55
Total Memory: 2048 Mb
pagetable_init
On node 0 totalpages: 524288
zone(0): 524288 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sda4 HOME=/ console=ttyS0 TERM=vt102
Console: colour dummy device 160x64
Calibrating delay loop... 1097.72 BogoMIPS
Memory: 2023968k available
Dentry-cache hash table entries: 131072 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 131072 (order: 9, 2097152 bytes)
Mount-cache hash table entries: 32768 (order: 7, 524288 bytes)
Buffer-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Page-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Searching for devices...
Found devices:
1. Prelude SMC Memory (1) at 0xfffffffffedc0000 [-64], versions 0x90, 0x0, 0x9
2. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed00000 [0], versions
0x803, 0x0, 0xc
3. Elroy PCI Bridge (13) at 0xffffffffbffe0000 [0/0], versions 0x782, 0x0, 0xa
4. Elroy PCI Bridge (13) at 0xffffffffbffe2000 [0/1], versions 0x782, 0x0, 0xa
5. Elroy PCI Bridge (13) at 0xffffffffbffe4000 [0/2], versions 0x782, 0x0, 0xa
6. Elroy PCI Bridge (13) at 0xffffffffbffe8000 [0/4], versions 0x782, 0x0, 0xa
7. Elroy PCI Bridge (13) at 0xffffffffbffea000 [0/5], versions 0x782, 0x0, 0xa
8. Elroy PCI Bridge (13) at 0xffffffffbfff0000 [0/8], versions 0x782, 0x0, 0xa
9. Elroy PCI Bridge (13) at 0xffffffffbfff4000 [0/10], versions 0x782, 0x0, 0xa
10. Elroy PCI Bridge (13) at 0xffffffffbfff8000 [0/12], versions 0x782, 0x0, 0xa
11. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed40000 [1], versions
0x803, 0x0, 0xc
12. Elroy PCI Bridge (13) at 0xfffffffffece0000 [1/0], versions 0x782, 0x0, 0xa
13. Elroy PCI Bridge (13) at 0xfffffffffece4000 [1/2], versions 0x782, 0x0, 0xa
14. Elroy PCI Bridge (13) at 0xfffffffffece8000 [1/4], versions 0x782, 0x0, 0xa
15. Elroy PCI Bridge (13) at 0xfffffffffecf0000 [1/8], versions 0x782, 0x0, 0xa
16. Elroy PCI Bridge (13) at 0xfffffffffecf4000 [1/10], versions 0x782, 0x0, 0xa
17. Elroy PCI Bridge (13) at 0xfffffffffecf8000 [1/12], versions 0x782, 0x0, 0xa
18. DEW BC Runway Port (7) at 0xfffffffffed20000 [32], versions 0x584, 0x0, 0xc
19. Prelude W+ 540 (0) at 0xfffffffffed21000 [33], versions 0x5d3, 0x0, 0x4
20. DEW BC Runway Port (7) at 0xfffffffffed24000 [36], versions 0x584, 0x0, 0xc
21. Prelude W+ 540 (0) at 0xfffffffffed25000 [37], versions 0x5d3, 0x0, 0x4
22. DEW BC Runway Port (7) at 0xfffffffffed28000 [40], versions 0x584, 0x0, 0xc
23. Prelude W+ 540 (0) at 0xfffffffffed29000 [41], versions 0x5d3, 0x0, 0x4
24. DEW BC Runway Port (7) at 0xfffffffffed2c000 [44], versions 0x584, 0x0, 0xc
25. Prelude W+ 540 (0) at 0xfffffffffed2d000 [45], versions 0x5d3, 0x0, 0x4
26. DEW BC Runway Port (7) at 0xfffffffffed60000 [96], versions 0x584, 0x0, 0xc
27. Prelude W+ 540 (0) at 0xfffffffffed61000 [97], versions 0x5d3, 0x0, 0x4
28. DEW BC Runway Port (7) at 0xfffffffffed64000 [100], versions 0x584, 0x0, 0xc
29. Prelude W+ 540 (0) at 0xfffffffffed65000 [101], versions 0x5d3, 0x0, 0x4
CONFIG_SMP=n  ignoring additional CPUs
Warning : device (0, 0x5d3, 0x0, 0x4) NOT claimed by CPU
CONFIG_SMP=n  ignoring additional CPUs
Warning : device (0, 0x5d3, 0x0, 0x4) NOT claimed by CPU
CONFIG_SMP=n  ignoring additional CPUs
Warning : device (0, 0x5d3, 0x0, 0x4) NOT claimed by CPU
CONFIG_SMP=n  ignoring additional CPUs
Warning : device (0, 0x5d3, 0x0, 0x4) NOT claimed by CPU
CONFIG_SMP=n  ignoring additional CPUs
Warning : device (0, 0x5d3, 0x0, 0x4) NOT claimed by CPU
CPU(s): 1 x PA8600 (PCX-W+) at 550.000000 MHz
SBA found Ike rev 2 at 0xfffffffffed00000
SBA found Ike rev 2 at 0xfffffffffed40000
lba version TR2.2 (0x3) found at 0xffffffffbffe0000
lba range[2] : ignoring GMMIO (0xfffffff004000000)
  got res[100:1ff] for resource 0 of Symbios Logic Inc. (formerly NCR) 53c895
  got res[200:2ff] for resource 0 of Symbios Logic Inc. (formerly NCR) 53c875
  got res[300:3ff] for resource 0 of Symbios Logic Inc. (formerly NCR) 53c875
(#2)
  got res[80:ff] for resource 0 of Digital Equipment Corporation DECchip 21142/43

  got res[40:7f] for resource 1 of PCI device 103c:1048 (Hewlett-Packard Company)

  got res[400:43f] for resource 1 of PCI device 103c:1048 (Hewlett-Packard
Company)
  got res[ffffffff80040000:ffffffff8007ffff] for resource 6 of Digital Equipment
Corporation DECchip 21142/43
  got res[ffffffff80001000:ffffffff80001fff] for resource 2 of Symbios Logic Inc.
(formerly NCR) 53c895
  got res[ffffffff80002000:ffffffff80002fff] for resource 2 of Symbios Logic Inc.
(formerly NCR) 53c875
  got res[ffffffff80003000:ffffffff80003fff] for resource 0 of PCI device
103c:1048 (Hewlett-Packard Company)
  got res[ffffffff80004000:ffffffff800043ff] for resource 1 of Digital Equipment
Corporation DECchip 21142/43
  got res[ffffffff80005000:ffffffff800050ff] for resource 1 of Symbios Logic Inc.
(formerly NCR) 53c895
  got res[ffffffff80006000:ffffffff800060ff] for resource 1 of Symbios Logic Inc.
(formerly NCR) 53c875
lba version TR2.2 (0x3) found at 0xffffffffbffe2000
lba range[2] : ignoring GMMIO (0xfffffff084000000)
lba version TR3.0 (0x4) found at 0xffffffffbffe4000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffff104000000)
lba version TR3.0 (0x4) found at 0xffffffffbffe8000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffff204000000)
lba version TR3.0 (0x4) found at 0xffffffffbffea000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffff284000000)
lba version TR3.0 (0x4) found at 0xffffffffbfff0000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffff404000000)
lba version TR3.0 (0x4) found at 0xffffffffbfff4000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffff504000000)
lba version TR3.0 (0x4) found at 0xffffffffbfff8000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffff604000000)
lba version TR3.0 (0x4) found at 0xfffffffffece0000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffff804000000)
lba version TR3.0 (0x4) found at 0xfffffffffece4000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffff904000000)
lba version TR3.0 (0x4) found at 0xfffffffffece8000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffffa04000000)
lba version TR3.0 (0x4) found at 0xfffffffffecf0000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffffc04000000)
lba version TR3.0 (0x4) found at 0xfffffffffecf4000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffffd04000000)
lba version TR3.0 (0x4) found at 0xfffffffffecf8000
kernel BUG at lba_pci.c:1262!
kernel BUG at lba_pci.c:1288!
lba range[2] : ignoring GMMIO (0xfffffffe04000000)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Performance monitoring counters enabled for Prelude W+ 540
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI
enabled
Redundant entry in serial pci_table.  Please send the output of
lspci -vv, this message (4156,4168,4156,4169)
and the manufacturer and name of serial board or modem board
to serial-pci-info@lists.sourceforge.net.
ttyS00 at port 0x0040 (irq = 132) is a 16550A
Redundant entry in serial pci_table.  Please send the output of
lspci -vv, this message (4156,4168,4156,4170)
and the manufacturer and name of serial board or modem board
to serial-pci-info@lists.sourceforge.net.
ttyS01 at port 0x0400 (irq = 133) is a 16550A
request_module[parport_lowlevel]: Root fs not mounted
lp: driver loaded but no devices found
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=16
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre6 (July 2, 2001)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
eth0: Digital DS21143 Tulip rev 65 at 0x80, 00:10:83:F5:85:5B, IRQ 128.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 2, function 0
sym53c8xx: 53c875 detected
sym53c8xx: at PCI bus 0, device 2, function 1
sym53c8xx: 53c875 detected
sym53c8xx: at PCI bus 0, device 1, function 0
sym53c8xx: 53c895 detected
sym53c875-0: rev 0x14 on pci bus 0 device 2 function 0 irq 130
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-1: rev 0x14 on pci bus 0 device 2 function 1 irq 131
sym53c875-1: ID 7, Fast-20, Parity Checking
sym53c895-2: rev 0x1 on pci bus 0 device 1 function 0 irq 129
sym53c895-2: ID 7, Fast-40, Parity Checking
sym53c895-2: SCSI bus mode change from 80 to 80.
scsi0 : sym53c8xx-1.7.3c-20010512
scsi1 : sym53c8xx-1.7.3c-20010512
scsi2 : sym53c8xx-1.7.3c-20010512
  Vendor: SEAGATE   Model: ST39103LC         Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST39175LW         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi1, channel 0, id 6, lun 0
Attached scsi disk sdb at scsi2, channel 0, id 6, lun 0
sym53c875-1-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
SCSI device sda: 17783112 512-byte hdwr sectors (9105 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
sym53c895-2-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 15)
SCSI device sdb: 17783112 512-byte hdwr sectors (9105 MB)
 sdb: unknown partition table
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 16384 buckets, 128Kbytes
TCP: Hash tables configured (established 262144 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Adding Swap: 249848k swap-space (priority -1)
eth0: Setting full-duplex based on MII#1 link partner capability of 41e1.
