Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA28487
	for <parisc-linux@puffin.external.hp.com>; Fri, 5 May 2000 17:13:28 -0600
Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by palrel3.hp.com (Postfix) with SMTP id 34CB1BEF9
	for <parisc-linux@puffin.external.hp.com>; Fri,  5 May 2000 16:13:13 -0700 (PDT)
Received: from l3107mxr.atl.hp.com (l3107mxr.atl.hp.com [15.19.254.19])
	by cosrel1.hp.com (Postfix) with ESMTP id 337781C53
	for <parisc-linux@thepuffingroup.com>; Fri,  5 May 2000 17:06:27 -0600 (MDT)
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by l3107mxr.atl.hp.com (Postfix) with ESMTP id 8D3764FD84
	for <parisc-linux@thepuffingroup.com>; Fri,  5 May 2000 19:05:59 -0400 (EDT)
To: parisc-linux@thepuffingroup.com
Date: Fri, 05 May 2000 17:05:59 -0600
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12nrAV-00040I-00@endor.fc.hp.com>
Subject: [parisc-linux] SCSI works on B180 and 712
List-ID: <linux-parisc.vger.kernel.org>


Many thanks to ggg, robert, and prumpf, for helping me get the SCSI
driver (sim710 specifically) working on B180 (should work on A180 too)
and 712!!!  Today I mounted an ext2 partition and executed sash from
there which was pretty exciting.  Sources are in CVS, just enable SCSI
in your .config, copy something reasonable (like the ramdisk or nfsroot)
to an ext2 partition on a normal Linux disk, move the disk to your HP
box, and remember to modify the linux command line to include "root=/dev/sda5"
or whatever.  Here's a console output sample:


------- Main Menu -------------------------------------------------------------

        Command                         Description
        -------                         -----------
        BOot [PRI|ALT|<path>]           Boot from specified path
        PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path
        SEArch [DIsplay|IPL] [<path>]   Search for boot devices

        COnfiguration [<command>]       Access Configuration menu/commands
        INformation [<command>]         Access Information menu/commands
        SERvice [<command>]             Access Service menu/commands

        DIsplay                         Redisplay the current menu
        HElp [<menu>|<command>]         Display help for menu or command
        RESET                           Restart the system
-------
Main Menu: Enter command > b
Interact with IPL (Y, N, Q)?> y
INIT C540

Booting... 
Network Station Address 0060b0-172441
System IP Address 15.1.49.181
Server IP Address 15.1.49.59

Boot IO Dependent Code (IODC) revision 2
INIT C580


SOFT Booted.
INIT C5FF
palo ipl bame@endor Fri May  5 12:22:50 MDT 2000
0/vmlinux 2308864 bytes @ 0x7800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/ram initrd=0/ramdisk'
0/ramdisk 358400 bytes @ 0x23b300
0/vmlinux HOME=/ TERM=LINUX root=/dev/sda5
Kernel: partition 0 file /vmlinux
ELF32 executable
prepare_loadable 00503688 2

Entry 0010192c first 00100000 n 3
Segment 0 load 00100000 size 1303732 mediaptr 0x1000
Segment 1 load 00240000 size 175884 mediaptr 0x140000
Segment 2 load 0026c000 size 8192 mediaptr 0x16b000
branching to kernel entry point 0x0010192c
The Kernel has started...
Free memory starts at: 0xc02d8000
PALO command line: 'HOME=/ TERM=LINUX root=/dev/sda5'
PALO initrd 0-0
FP CCR was 0x0, will be set to 0xc0
model   00005030 00000481 00000000 02020202 7749d671 100000f0 00000004 000000ba 000000ba
vers    00000010
cpuid   000001f0
CPUID vers 15 rev 16
CPU(s): 1 x PA7300LC at 180.000000 MHz
Searching for devices in PDC firmware... a newer box...
Found devices:
1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0, 0x0, 0x0, 0x0
2. Merlin L2+ 180 (9000/778/B180L) (0) at 0xfffbe000, versions 0x504, 0x0, 0x4, 0x0, 0x81
3. Merlin+ L2 180 (1) at 0xfffbf000, versions 0x5a, 0x0, 0x9, 0x0, 0x0
4. Merlin+ 180 Core BA (11) at 0xffd00000, versions 0x3f, 0x0, 0x81, 0x0, 0x0
5. Merlin+ 180 Core RS-232 (10) at 0xffd05000, versions 0x3f, 0x0, 0x8c, 0x0, 0x0
6. Merlin+ 180 Core SCSI (10) at 0xffd06000, versions 0x3f, 0x0, 0x82, 0x0, 0x0
7. Merlin+ 180 Core Centronics (10) at 0xffd02000, versions 0x3f, 0x0, 0x74, 0x0, 0x0
8. Merlin+ 180 Core Audio (10) at 0xffd04000, versions 0x3f, 0x4, 0x7b, 0x0, 0x0
9. Merlin+ 180 Core PC Keyboard (10) at 0xffd08000, versions 0x3f, 0x0, 0x84, 0x0, 0x0
10. Merlin+ 180 Core PC Keyboard (10) at 0xffd08100, versions 0x3f, 0x0, 0x84, 0x0, 0x0
11. Merlin+ 180 Core PC Floopy (10) at 0xffd0a000, versions 0x3f, 0x0, 0x83, 0x0, 0x0
12. Merlin 132/160 Wax BA (11) at 0xffe00000, versions 0x43, 0x0, 0x8e, 0x0, 0x0
13. Merlin 132/160 Wax EISA BA (11) at 0xfc000000, versions 0x43, 0x0, 0x90, 0x0, 0x0
14. Merlin 132/160 Wax HIL (10) at 0xffe01000, versions 0x43, 0x0, 0x73, 0x0, 0x0
15. Merlin 132/160 Wax RS-232 (10) at 0xffe02000, versions 0x43, 0x0, 0x8c, 0x0, 0x0
16. Gecko GSC Core Graphics (10) at 0xf8000000, versions 0x16, 0x0, 0x85, 0x0, 0x0
17. Dino PCI Bridge (13) at 0xfff80000, versions 0x680, 0x1, 0xa, 0x0, 0x0
That's a total of 17 devices.
Linux version 2.3.99-pre1 (bame@endor) (gcc version 2.9-hppa-991112) #93 Fri May 5 12:22:47 MDT 2000
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
trap_init
Calibrating delay loop... 116.74 BogoMIPS
Memory: 125716k available
kmem_test() - start
kmem_free: Bad front redzone (objp=c7ffe004, name=test-cachep)
kmem_free: Bad rear redzone (objp=c7ffe004, name=test-cachep)
kmem_test() - finished
c7ff0000 c7ff8000 c7fee000 c7ffc000
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
request_irq(258, c01eb470, 0x0, lasi, c7fea080)
Lasi IRQ 258 EIM 0xfffe0002
Wax at 0xffe00000 found.
request_irq(263, c01eb470, 0x0, wax, c7fea140)
Wax IRQ 263 EIM 0xfffe0007
busdevice_alloc_irq(0xffd05000) on Lasi 0x200 + 26 = 538
Found serial #0 at 0xffd05000, IRQ 538
ttyS00 at iomem 0xffd05800 (irq = 538) is a 16550A
busdevice_alloc_irq(0xffe02000) on Wax 0x300 + 25 = 793
Found serial #1 at 0xffe02000, IRQ 793
ttyS00 at iomem 0xffe02800 (irq = 793) is a 16550A
Dino version 2.1 (bridge mode) found at 0xfff80000


The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
Systems shipped after Aug 20, 1997 will not exhibit this problem.
Models affected: C180, C160, C160L, B160L, and B132L workstations.

request_irq(259, c01eae24, 0x0, dino, c7fea2c0)
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
Starting kswapd v1.6
Serial driver version 4.92 (2000-1-27) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
SCSI clock: 40000000
busdevice_alloc_irq(0xffd06000) on Lasi 0x200 + 22 = 534
Lasi Scsi (53c710) found at 0xffd06100
sim710: Configuring Sim710 (SCSI-ID 7) at ffd06100, IRQ 534
scsi0: Revision 0x2
sim710: WARNING IRQ probe failed, (returned 0)
scsi0: test 1 completed ok.
request_irq(534, c01da830, 0x20000000, sim710, c7fb7260)
busdev_enable_irq(c7fea080, 22) Lasi: IMR 0x200
lasi7xx_detect is called again
scsi0 : LASI/Simple 53c710
scsi : 1 host.
  Vendor: TOSHIBA   Model: CD-ROM XM-3401TA  Rev: 1094
  Type:   CD-ROM                             ANSI SCSI revision: 02
Detected scsi CD-ROM sr0 at scsi0, channel 0, id 2, lun 0
  Vendor: SEAGATE   Model: ST31051N          Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 3, lun 0
scsi : detected 1 SCSI cdrom 1 SCSI disk total.
Uniform CD-ROM driver Revision: 3.07
SCSI device sda: hdwr sector= 512 bytes. Sectors= 2051460 [1001 MB] [1.0 GB]
Partition check:
 sda: sda1 sda2 < sda5 sda6 sda7 sda8 sda9 >
Linux Tulip driver version 0.9.4.2 (Mar 21, 2000)
eth0: Digital DS21143 Tulip rev 33 at 0x1ff00, 00:60:B0:17:24:41, IRQ 1055.
eth0:  MII transceiver #1 config 1000 status 786d advertising 01e1.
request_irq(1055, c01b0b74, 0x4000000, eth0, c7f86800)
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 15.1.49.59, my address is 15.1.49.181
VFS: Mounted root (ext2 filesystem) readonly.
tty_open
searching for 4/64
found 136/[0,256]
found 128/[0,256]
found 3/[0,256]
found 2/[0,256]
found 5/[64,64]
found 4/[64,64]
driver: -1070829704
retval 0
request_irq(538, c01a4470, 0x4000000, serial, c02c795c)
busdev_enable_irq(c7fea080, 26) Lasi: IMR 0x220
driver.open 0
do_execve
trying c01649e8
trying c0164480
load_som_binary
It seems to be a valid SOM executable
Stand-alone shell (version 3.4)
500 5 cbd 8a3b
> foo 1073767600, 20020620
