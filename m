Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA17091
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Sep 2000 15:27:15 -0600
Message-Id: <200009222131.OAA14722@milano.cup.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 and ccio-dma 
In-reply-to: Your message of "Thu, 21 Sep 2000 20:44:10 PDT."
             <39CAC77A.8761CD51@uswest.net>
Date: Fri, 22 Sep 2000 14:31:42 -0700
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich wrote:
> Erik,
> 
> I also have that problem on the C200+, but it isn't a ccio-dma.c problem
> (atleast I don't think it is) ... I believe it is a sym53cxx driver problem.

Ryan,
Here's the output from me (accidentally) booting a 32-bit kernel
on a c3k. It seems sym53c8xx passed a non-kernel address to get mapped...
or the ASSERT statement is bogus (checking too many bits).
Anyway, something to look at.

grant


Main Menu: Enter command > bo lan
Interact with IPL (Y, N, Q)?> n

Booting... 
Network Station Address 001083-360089

System IP Address 15.8.80.77
Server IP Address 15.8.81.247

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@hpisp747 Tue Sep 12 20:36:36 PDT 2000
0/vmlinux 2014327 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa '
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 001000e8 first 00100000 n 4
Segment 0 load 00100000 size 1395112 mediaptr 0x1000
Segment 1 load 00256000 size 177736 mediaptr 0x156000
Segment 2 load 00284000 size 98464 mediaptr 0x182000
Segment 3 load 002a0000 size 8192 mediaptr 0x19b000
branching to kernel entry point 0x001000e8
Set default PSW W bit to 0
PDC Console Initialized
The Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02d1000
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa '
PALO initrd 0-0
model   00005bb0 00000481 00000000 00000002 77cd9463 100000f0 00000008 000000b2 000000b2
vers    00000200
cpuid   00000224
CPUID vers 17 rev 4
CPU might be a PA8500 (PCX-W)
CPU(s): 1 x PA8500 (PCX-W) at 400.000000 MHz
Searching for devices in PDC firmware... processor hpa 0xfffa0000
a newer box...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000, versions 0x582, 0x0, 0xb, 0x0, 0x10
2. Elroy PCI Bridge (13) at 0xfed30000, versions 0x782, 0x0, 0xa, 0x0, 0x0
3. Elroy PCI Bridge (13) at 0xfed32000, versions 0x782, 0x0, 0xa, 0x0, 0x0
4. Elroy PCI Bridge (13) at 0xfed38000, versions 0x782, 0x0, 0xa, 0x0, 0x0
5. Elroy PCI Bridge (13) at 0xfed3c000, versions 0x782, 0x0, 0xa, 0x0, 0x0
6. AllegroHigh W  (0) at 0xfffa0000, versions 0x5bb, 0x0, 0x4, 0x0, 0x81
7. AllegroHigh Memory (1) at 0xfed10200, versions 0x86, 0x0, 0x9, 0x0, 0x0
That's a total of 7 devices.
Linux version 2.4.0-test6 (grundler@hpisp747) (gcc version 2.96 20000822 (experimental)) #20 Fri Sep 22 14:03:01 PDT 2000
free_bootmem(0x2d5000, 0x1fd2b000)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 131072
zone(0): 65536 pages.
zone(1): 65536 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa 
trap_init
Calibrating delay loop... 799.54 BogoMIPS
Memory: 511636k available
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
POSIX conformance testing by UNIFIX
lba version TR2.1 (0x2) found at 0xfed30000
lba_fixup_bus(0xdffef7e0) bus 0 sysdata 0xdfffa220
lba version TR2.1 (0x2) found at 0xfed32000
lba_fixup_bus(0xdffef860) bus 1 sysdata 0xdfffa260
lba version TR2.1 (0x2) found at 0xfed38000
lba_fixup_bus(0xdffef8e0) bus 2 sysdata 0xdfffa2a0
lba version TR2.1 (0x2) found at 0xfed3c000
lba: iosapic_register says not used
Warning : device (13, 0x782, 0x0, 0xa, 0x0) NOT claimed by lba TR2.1
SBA found Astro 2.1 at 0xfed00000
lba_init_iregs() ibase 0x1 imask 0xf0000000
lba_init_iregs() base_addr fed38000
lba_init_iregs() base_addr fed32000
lba_init_iregs() base_addr fed30000
lba_init_iregs() done
lba: lba_bios_init
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 32768)
Starting kswapd v1.7
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
sym53c8xx: at PCI bus 1, device 5, function 0
sym53c8xx: 53c875 detected 
sym53c8xx: at PCI bus 0, device 15, function 0
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 0, device 15, function 1
sym53c8xx: 53c896 detected 
sym53c875-0: rev 0x3 on pci bus 1 device 5 function 0 irq 769

sba_iommu.c:587: Assertion ((u_long) vba & 0xf0000000UL) == 0xc0000000UL failed!
Kernel panic: ((u_long) vba & 0xf0000000UL) == 0xc0000000UL
