Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8DB9B482C
	for <parisc-linux@parisc-linux.org>; Thu, 15 Nov 2001 14:46:02 -0700 (MST)
Message-ID: <3BF4363C.42B5F4AE@esiee.fr>
Date: Thu, 15 Nov 2001 22:40:12 +0100
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Hppa <debian-hppa@lists.debian.org>,
	"parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------F0E628938ADB2B3342B55372"
Subject: [parisc-linux] The A500 likes 2.4.14-pa3
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
--------------F0E628938ADB2B3342B55372
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all,

	A short mail to tell you that I succeed to boot my A500-5X with
2.4.14-pa3 as you will see below!

Last login: Thu Nov 15 22:07:04 2001 on ttyS0
Linux mkhppa3 2.4.14-pa3 #3 Thu Nov 15 22:05:49 CET 2001 parisc64
unknown
demo@mkhppa3:~$ 

	Then, I try with the SMP support. But a function is not implemented for
parisc. cpu_online_map is in init/main.c and coming from the recent
merge, afaik. I commented it. It was compilable. So I give it a shot: 

Last login: Thu Nov 15 22:15:26 2001 on ttyS0
Linux mkhppa3 2.4.14-pa3 #4 SMP Thu Nov 15 22:25:49 CET 2001 parisc64
unknown
demo@mkhppa3:~$ 

That is great but (because there is a but) :

processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8600 (PCX-W+)
cpu MHz         : 550.000000
model           : 9000/800/A500-5X
model name      : Crescendo 550
hversion        : 0x00005d50
sversion        : 0x00000491
I-cache         : 512 KB
D-cache         : 1024 KB (WB)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 1097.72
software id     : 1555780568

processor       : 1
cpu family      : PA-RISC 2.0
cpu             : PA8600 (PCX-W+)
cpu MHz         : 550.000000
model           : 9000/800/A500-5X
model name      : Crescendo 550
hversion        : 0x00005d50
sversion        : 0x00000491
I-cache         : 512 KB
D-cache         : 1024 KB (WB)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 1097.72
software id     : 1555780568

Good joke! Everything is ok. I attached the dmesg.

The A500 rulez, Thomas.
ESIEE Team.
--------------F0E628938ADB2B3342B55372
Content-Type: text/plain; charset=us-ascii;
 name="a500-2.4.14-pa3.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="a500-2.4.14-pa3.log"

Linux version 2.4.14-pa3 (compil@spqr) (gcc version 3.0.2 20010829 (prerelease)) #4 SMP Thu Nov 15 22:25:49 CET 2001
FP[0] enabled: Rev 1 Model 16
The 64-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: 64 bit PAT.
model	00005d50 00000491 00000000 00000001 5cbb53d8 100000f0 00000008 000000b2 000000b2
vers	00000301
cpuid	0000024b
CPUID	vers 18 rev 11
model	9000/800/A500-5X
Total Memory: 1024 Mb
pagetable_init
On node 0 totalpages: 262144
zone(0): 262144 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102
Console: colour dummy device 160x64
Initialized PDC Console for debugging.
Calibrating delay loop... 1097.72 BogoMIPS
Memory: 1005604k available
Dentry-cache hash table entries: 131072 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 65536 (order: 8, 1048576 bytes)
Mount-cache hash table entries: 16384 (order: 6, 262144 bytes)
Buffer-cache hash table entries: 65536 (order: 7, 524288 bytes)
Page-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Searching for devices...
Found devices:
1. Crescendo 550 (0) at 0xfffffffffffa0000 [-96], versions 0x5d5, 0x0, 0x4
2. Crescendo 550 (0) at 0xfffffffffffa2000 [-94], versions 0x5d5, 0x0, 0x4
3. Astro BC Runway Port (12) at 0xfffffffffed00000 [0], versions 0x582, 0x0, 0xb
4. Elroy PCI Bridge (13) at 0xfffffffffed30000 [0/0], versions 0x782, 0x0, 0xa
5. Elroy PCI Bridge (13) at 0xfffffffffed34000 [0/2], versions 0x782, 0x0, 0xa
6. Elroy PCI Bridge (13) at 0xfffffffffed38000 [0/4], versions 0x782, 0x0, 0xa
7. Elroy PCI Bridge (13) at 0xfffffffffed3c000 [0/6], versions 0x782, 0x0, 0xa
8. Crescendo Memory (1) at 0xfffffffffed08000 [8], versions 0x9b, 0x0, 0x9
CPU(s): 2 x PA8600 (PCX-W+) at 550.000000 MHz
SBA found Astro 2.1 at 0xfffffffffed00000
lba version TR4.0 (0x5) found at 0xfffffffffed30000
lba range[2] : ignoring GMMIO (0xfffffff804000000)
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba range[2] : ignoring GMMIO (0xfffffff904000000)
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba range[2] : ignoring GMMIO (0xfffffffa04000000)
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
lba range[2] : ignoring GMMIO (0xfffffffb04000000)
POSIX conformance testing by UNIFIX
SMP: bootstrap CPU ID is 0
FP[1] enabled: Rev 1 Model 16
SMP: Total 2 of 2 processors activated (2195.46 BogoMIPS noticed).
Waiting on wait_init_idle (map = 0x0)
All processors have done init_idle
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Performance monitoring counters enabled for Crescendo 550
Starting kswapd
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Redundant entry in serial pci_table.  Please send the output of
lspci -vv, this message (103c,1048,103c,1049)
and the manufacturer and name of serial board or modem board
to serial-pci-info@lists.sourceforge.net.
ttyS00 at port 0x0040 (irq = 132) is a 16550A
Redundant entry in serial pci_table.  Please send the output of
lspci -vv, this message (103c,1048,103c,104a)
and the manufacturer and name of serial board or modem board
to serial-pci-info@lists.sourceforge.net.
ttyS01 at port 0x0500 (irq = 133) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre8 (Oct 11, 2001)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
eth0: Digital DS21143 Tulip rev 65 at 0x80, 00:30:6E:0C:8A:8F, IRQ 128.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 2, function 0
sym53c8xx32 BIT PCI BUS DMA ADDRESSING NOT SUPPORTED
sym53c8xx: at PCI bus 0, device 2, function 1
sym53c8xx32 BIT PCI BUS DMA ADDRESSING NOT SUPPORTED
sym53c8xx: at PCI bus 0, device 1, function 0
sym53c8xx: setting PCI_COMMAND_INVALIDATE (fix-up)
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 0, device 1, function 1
sym53c8xx: setting PCI_COMMAND_INVALIDATE (fix-up)
sym53c8xx: 53c896 detected 
sym53c896-0: rev 0x7 on pci bus 0 device 1 function 0 irq 129
sym53c896-0: ID 7, Fast-40, Parity Checking
sym53c896-0: handling phase mismatch from SCRIPTS.
sym53c896-1: rev 0x7 on pci bus 0 device 1 function 1 irq 130
sym53c896-1: ID 7, Fast-40, Parity Checking
sym53c896-1: handling phase mismatch from SCRIPTS.
scsi0 : sym53c8xx-1.7.3c-20010512
scsi1 : sym53c8xx-1.7.3c-20010512
  Vendor: SEAGATE   Model: ST39204LC         Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 03
Attached scsi disk sda at scsi1, channel 0, id 15, lun 0
sym53c896-1-<15,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 31)
SCSI device sda: 17783112 512-byte hdwr sectors (9105 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 48Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Adding Swap: 132072k swap-space (priority -1)
eth0: Setting half-duplex based on MII#1 link partner capability of 0021.

--------------F0E628938ADB2B3342B55372--
