Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 556A54A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 27 Feb 2001 16:49:47 -0700 (MST)
Sender: marteaut@esiee.fr
Message-ID: <3A9C3D19.2128CB74@esiee.fr>
Date: Wed, 28 Feb 2001 00:49:45 +0100
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: 2-way A500
References: <200102272158.NAA25485@milano.cup.hp.com>
Content-Type: multipart/mixed;
 boundary="------------50C17CC21C9542984B162495"
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------50C17CC21C9542984B162495
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi Grant,

Grant Grundler wrote:
> 
> Thomas,
> 
> Please send full console output, lspci, and /proc/interrupt output.
> I can provide pciutils binaries if you can't otherwise find/build them.
The dmesg is attached!

> 
> Thomas Marteau wrote:
> > Hi Grant,
> >
> >       I noticed that if we put init=/bin/bash, we see this message:
> > IRQ No handler for IRQ 128!
> 
> 64-bit on A500?
Two processors 550 MHz 64 bits PA8600

> 
> If so, IRQ128 is IRQ0 in IRQ region 2 - ie first iosapic/PCI bus.
> A device may have that line asserted for some reason.
> I do expect that all drivers for boot devices have registered/claimed
> the devices they should *before* init (/bin/bash) is invoked.
Here is the official message
IRQ: CPU:0 No handler for IRQ 128 !

> 
> > It is true that in /proc/interrupts, no device is reported for this IRQ. The
> > problem is that you do not have this problem with /bin/sh, afaik.
> 
> Interesting. Perhaps bash RC scripts is doing something different?
> I don't see how bash or sh could otherwise generate IO interrupts.
I think that the bug could come from the bash and its capability with SMP

> 
> > Also, I will appreciate if you could explain how works this file when it is a
> > SMP kernel because I am a little lost :) (Everything is reported to CPU00 here!)
Here is /proc/interrupts but I need some help here
            IRQ count 
 64:      29818        160       PA-CPU-00  timer
 65:        488         30       PA-CPU-00  IPI
 66:        160        232       PA-CPU-00  IO-SAPIC00-L0
 67:         30         30       PA-CPU-00  IO-SAPIC00-L1
 68:          0        302       PA-CPU-00  IO-SAPIC00-L2
 69:        232          0       PA-CPU-00  IO-SAPIC00-L2
 70:         30          0       PA-CPU-00  IO-SAPIC00-L3
 71:        302          0       PA-CPU-00  IO-SAPIC00-L4
 72:          0          0       PA-CPU-00  IO-SAPIC00-L5
129:         30          0      IO-SAPIC00  sym53c8xx
130:        232          0      IO-SAPIC00  sym53c8xx
131:         30          0      IO-SAPIC00  sym53c8xx
132:        302          0      IO-SAPIC00  serial


As we see, everything is attached to PA-CPU-00!

> 
> All IO interrupts are routed to the "monarch" (CPU 0) at the moment.
> When things stabilize, I'll change the code so both processors share
> the IO IRQ load.
> 
> ciao!
> grant
> 
> Grant Grundler
> parisc-linux {PCI|IOMMU|SMP} hacker
> +1.408.447.7253
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
--------------50C17CC21C9542984B162495
Content-Type: text/plain; charset=us-ascii;
 name="dmes"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dmes"

The 64-bit Kernel has started...
FP[0] enabled: Rev 1 Model 16
Free memory starts at: 0x1040e000
start_parisc(0x504d70,0x504d70,0x0,0x0)
PALO command line: 'init=/bin/sh HOME=/ TERM=LINUX console=ttyS0 root=/dev/sda3'
PALO initrd 0-0
model   00005d50 00000491 00000000 00000001 5e936f38 100000f0 00000008 000000b2 000000b2
vers    00000301
cpuid   0000024b
CPUID   vers 18 rev 11
model   9000/800/A500-5X
Searching for devices in PDC firmware... processor hpa 0xfffffffffffa0000
Found devices:
1. Crescendo 550 (0) at 0xfffffffffffa0000, versions 0x5d5, 0x0, 0x4, 0x0, 0x91
2. Crescendo 550 (0) at 0xfffffffffffa2000, versions 0x5d5, 0x0, 0x4, 0x0, 0x91
3. Crescendo Memory (1) at 0xfffffffffed08000, versions 0x9b, 0x0, 0x9, 0x0, 0x0
4. Astro BC Runway Port (12) at 0xfffffffffed00000, versions 0x582, 0x0, 0xb, 0x0, 0x10
5. Elroy PCI Bridge (13) at 0xfffffffffed30000, versions 0x782, 0x0, 0xa, 0x0, 0x0
6. Elroy PCI Bridge (13) at 0xfffffffffed34000, versions 0x782, 0x0, 0xa, 0x0, 0x0
7. Elroy PCI Bridge (13) at 0xfffffffffed38000, versions 0x782, 0x0, 0xa, 0x0, 0x0
8. Elroy PCI Bridge (13) at 0xfffffffffed3c000, versions 0x782, 0x0, 0xa, 0x0, 0x0
That's a total of 8 devices.
CPU(s): 2 x PA8600 (PCX-W+) at 550.000000 MHz
Linux version 2.4.0 (a500@pc5158a) (gcc version 2.97 20010128 (experimental)) #4 SMP Mon Feb 26 12:22:43 CET
 2001
free_bootmem(0x412000, 0x1fbee000)
pagetable_init
On node 0 totalpages: 131072
zone(0): 65536 pages.
zone(1): 65536 pages.
zone(2): 0 pages.
Kernel command line: init=/bin/sh HOME=/ TERM=LINUX console=ttyS0 root=/dev/sda3
Calibrating delay loop... 1097.72 BogoMIPS
Memory: 500652k available
Dentry-cache hash table entries: 65536 (order: 8, 1048576 bytes)
Buffer-cache hash table entries: 32768 (order: 6, 262144 bytes)
Page-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 32768 (order: 7, 524288 bytes)
POSIX conformance testing by UNIFIX
SMP: bootstrap CPU ID is 0
FP[1] enabled: Rev 1 Model 16
SMP: Total 2 of 2 processors activated (2195.46 BogoMIPS noticed).
lba version TR4.0 (0x5) found at 0xfffffffffed30000
lba range[2] : ignoring GMMIO (0xfffffff804000000)
PCI: dev Symbios Logic Inc. (formerly NCR) 53c896 type 64-bit
PCI: dev Symbios Logic Inc. (formerly NCR) 53c896 (#2) type 64-bit
PCI: dev Symbios Logic Inc. (formerly NCR) 53c896 type 64-bit
PCI: dev Symbios Logic Inc. (formerly NCR) 53c896 (#2) type 64-bit
lba version TR4.0 (0x5) found at 0xfffffffffed34000
lba range[2] : ignoring GMMIO (0xfffffff904000000)
lba version TR4.0 (0x5) found at 0xfffffffffed38000
lba range[2] : ignoring GMMIO (0xfffffffa04000000)
lba version TR4.0 (0x5) found at 0xfffffffffed3c000
lba range[2] : ignoring GMMIO (0xfffffffb04000000)
SBA found Astro 2.1 at 0xfffffffffed00000
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 Unix98 ptys configured
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
PCIBIOS: Enabling device 00:04.0 (0146 -> 0147)
ttyS00 at port 0x0040 (irq = 132) is a 16550A
PCIBIOS: Enabling device 00:05.0 (0000 -> 0143)
ttyS01 at port 0x0500 (irq = 133) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
Linux Tulip driver version 0.9.13 (January 2, 2001)
PCIBIOS: Enabling device 00:00.0 (0140 -> 0143)
PCIBIOS: Setting latency timer of 00:00.0 to 128
eth0: Digital DS21143 Tulip rev 65 at 0x80, 00:30:6E:06:15:E3, IRQ 128.
eth0:  MII transceiver #1 config 1000 status 782d advertising 0061.
eth0:  Advertising 01e1 on PHY 1, previously advertising 0061.
eth0:  Advertising 01e1 (to advertise is 01e1).
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 2, function 0
sym53c8xx: setting PCI_COMMAND_IO...
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c876 detected 
sym53c8xx: at PCI bus 0, device 2, function 1
sym53c8xx: setting PCI_COMMAND_IO PCI_COMMAND_MEMORY...
sym53c8xx: setting PCI_COMMAND_MASTER PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c876 detected 
sym53c8xx: at PCI bus 0, device 1, function 0
sym53c8xx: setting PCI_COMMAND_IO PCI_COMMAND_MEMORY...
sym53c8xx: setting PCI_COMMAND_MASTER PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 0, device 1, function 1
sym53c8xx: setting PCI_COMMAND_IO PCI_COMMAND_MEMORY...
sym53c8xx: setting PCI_COMMAND_MASTER PCI_COMMAND_PARITY...(fix-up)
sym53c8xx: changing PCI_LATENCY_TIMER from 0 to 80.
sym53c8xx: 53c896 detected 
sym53c876-0: rev 0x14 on pci bus 0 device 2 function 0 irq 130
sym53c876-0: NCR clock is 40218KHz
sym53c876-0: ID 7, Fast-20, Parity Checking
sym53c876-0: on-chip RAM at 0xfffffffff8040000
sym53c876-0: restart (scsi reset).
sym53c876-0: Downloading SCSI SCRIPTS.
sym53c876-1: rev 0x14 on pci bus 0 device 2 function 1 irq 131
sym53c876-1: NCR clock is 40218KHz
sym53c876-1: ID 7, Fast-20, Parity Checking
sym53c876-1: on-chip RAM at 0xfffffffff8001000
sym53c876-1: restart (scsi reset).
sym53c876-1: Downloading SCSI SCRIPTS.
sym53c896-2: rev 0x7 on pci bus 0 device 1 function 0 irq 129
sym53c896-2: NCR clock is 40218KHz
sym53c896-2: ID 7, Fast-40, Parity Checking
sym53c896-2: on-chip RAM at 0xfffffffff8002000
sym53c896-2: restart (scsi reset).
sym53c896-2: handling phase mismatch from SCRIPTS.
sym53c896-2: Downloading SCSI SCRIPTS.
sym53c896-3: rev 0x7 on pci bus 0 device 1 function 1 irq 130
sym53c896-3: NCR clock is 40218KHz
sym53c896-3: ID 7, Fast-40, Parity Checking
sym53c896-3: on-chip RAM at 0xfffffffff8004000
sym53c896-3: restart (scsi reset).
sym53c896-3: handling phase mismatch from SCRIPTS.
sym53c896-3: Downloading SCSI SCRIPTS.
scsi0 : sym53c8xx - version 1.6b
scsi1 : sym53c8xx - version 1.6b
scsi2 : sym53c8xx - version 1.6b
scsi3 : sym53c8xx - version 1.6b
  Vendor: SEAGATE   Model: ST32151N          Rev: HP02
  Type:   Direct-Access                      ANSI SCSI revision: 02
sym53c876-0-<3,0>: tagged command queue depth set to 8
  Vendor: SEAGATE   Model: ST39204LC         Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 03
sym53c896-3-<15,0>: tagged command queue depth set to 8
Detected scsi disk sda at scsi0, channel 0, id 3, lun 0
Detected scsi disk sdb at scsi3, channel 0, id 15, lun 0
sym53c876-0-<3,0>: sync msgout: 1-3-1-c-10.
sym53c876-0-<3,0>: sync msg in: 1-3-1-19-f.
sym53c876-0-<3,0>: sync: per=25 scntl3=0x30 scntl4=0x0 ofs=15 fak=0 chg=0.
sym53c876-0-<3,*>: FAST-10 SCSI 10.0 MB/s (100 ns, offset 15)
sym53c876-0-<3,0>: sync msgout: 1-3-1-c-10.
sym53c876-0-<3,0>: sync msg in: 1-3-1-19-f.
sym53c876-0-<3,0>: sync: per=25 scntl3=0x30 scntl4=0x0 ofs=15 fak=0 chg=0.
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
Partition check:
 sda: sda1 sda2 sda3
sym53c896-3-<15,0>: wide msgout: 1-2-3-1.
sym53c896-3-<15,0>: wide msgin: 1-2-3-1.
sym53c896-3-<15,0>: wide: wide=1 chg=0.
sym53c896-3-<15,0>: wide msgout: 1-2-3-1.
sym53c896-3-<15,0>: wide msgin: 1-2-3-1.
sym53c896-3-<15,0>: wide: wide=1 chg=0.
sym53c896-3-<15,0>: sync msgout: 1-3-1-c-1f.
sym53c896-3-<15,0>: sync msg in: 1-3-1-c-1f.
sym53c896-3-<15,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=31 fak=0 chg=0.
sym53c896-3-<15,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 31)
SCSI device sdb: 17783112 512-byte hdwr sectors (9105 MB)
 sdb: unknown partition table
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 24Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
IP-Config: Incomplete network configuration information.
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended

--------------50C17CC21C9542984B162495--
