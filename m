Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail2-ny2-R.bigfish.com (mail-ny2.bigfish.com [63.161.60.93])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF5BE4852
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Oct 2003 09:27:44 -0600 (MDT)
Received: from mail2-ny2.bigfish.com (localhost.localdomain [127.0.0.1])
	by mail2-ny2-R.bigfish.com (Postfix) with ESMTP id B8C762A1038
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Oct 2003 15:27:43 +0000 (UCT)
Received: from smtpgw6.it.sprintspectrum.com (smtpgw6.sprintspectrum.com [207.40.188.14])
	by mail2-ny2.bigfish.com (Postfix) with ESMTP id 3E5762A0F1E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Oct 2003 15:27:43 +0000 (UCT)
Received: from mailhost.sprintspectrum.com (smtpgw7.it.sprintspectrum.com [207.40.65.55])
	by smtpgw6.it.sprintspectrum.com (8.12.10/8.12.8) with ESMTP id h92FRhRZ001539
	for <parisc-linux@lists.parisc-linux.org>; Thu, 2 Oct 2003 10:27:43 -0500 (CDT)
Received: from PDAWG02A.corp.sprint.com (localhost [127.0.0.1])
	by mailhost.sprintspectrum.com (Switch-2.2.8/Switch-2.2.6) with ESMTP id h92FRhV15544
	for <parisc-linux@lists.parisc-linux.org>; Thu, 2 Oct 2003 10:27:43 -0500 (CDT)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Date: Thu, 2 Oct 2003 10:27:42 -0500
Message-ID: <1289146742B56546AE580DFC6B711A83134825@PKDWB07C.ad.sprint.com>
From: "Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] HP HSC J3516A (2 port) ethernet card  (supported??)
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

I am trying to configure two HP J3516A's that I have in an R390.  They
initially showed up while using the debian installation cd as eth0 and
eth1 (the internal lan was eth2).  However, after reboot it seems that
they are not being correctly initialized by the kernel (internal lan is
now eth0).

The following is the pertinent kernel output :

3. HP HSC-PCI Cards (4) at 0xf1008000 [8/8], versions 0x4, 0x0, 0x9d
4. HP HSC-PCI Cards (4) at 0xf100c000 [8/12], versions 0x4, 0x0, 0x9d
Enumerating EISA bus
EISA slot 1 a configured board was not detected ( expected ___FFFF)
Dino version 3.x (card mode) found at 0xf1008000
Dino: Failed to allocate memory region
Dino version 3.x (card mode) found at 0xf100c000
Dino: Failed to allocate memory region
Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
PCI: Unable to reserve I/O region #1:80@8050000 for device 01:01.0
Trying to free nonexistent resource <08050000-0805007f>
Trying to free nonexistent resource <41000000-4100007f>
PCI: Unable to reserve I/O region #1:80@dfd38800 for device 01:02.0
Trying to free nonexistent resource <dfd38800-dfd3887f>
Trying to free nonexistent resource <bfbe6680-bfbe66ff>
PCI: Unable to reserve I/O region #1:80@af335c00 for device 02:01.0
Trying to free nonexistent resource <af335c00-af335c7f>
Trying to free nonexistent resource <ff93e700-ff93e77f>
PCI: Unable to reserve I/O region #1:80@55b26500 for device 02:02.0
Trying to free nonexistent resource <55b26500-55b2657f>
Trying to free nonexistent resource <7e818a00-7e818a7f>

Are these cards currently supported?  If yes, then what could be causing
these problems?

Also, I am having some problems with the internal NIC.  It appears as if
the card is working properly, however I am seeing the following errors
and am unable to ping any machine on my network (still investigating ARP
and the speed settings on our switch).  Figured I would include this in
the case that it indicates problems with the other two network
cards(???).

Oct  1 19:52:15 mplekwb2 kernel: eth0: 82596 at 0xffd07000, 08 00 09 B8
77 A4 IRQ 87.
Oct  1 19:52:15 mplekwb2 kernel: eth0: Transceiver problem.
Oct  1 20:02:39 mplekwb2 kernel: eth0: Transceiver problem.
Oct  1 20:05:28 mplekwb2 kernel: eth0: command unit timed out, status
resetting.
Oct  1 20:11:39 mplekwb2 kernel: eth0: link ok.
Oct  1 20:14:05 mplekwb2 kernel: eth0: command unit timed out, status
resetting.

And here is the complete kernel boot output :

Linux version 2.4.17-32 (root@paer) (gcc version 3.0.4) #1 Sat Mar 16
17:09:00 MST 2002
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005ba0 00000491 00000000 00000002 77800b8b 100000f0 00000008
000000b2 000000b2
vers  00000501
CPUID vers 14 rev 23 (0x000001d7)
model 9000/800/R390
Total Memory: 1024 Mb
pagetable_init
On node 0 totalpages: 262144
zone(0): 262144 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=3D/dev/sda5 HOME=3D/ console=3DttyS0 =
TERM=3Dvt102
palo_kernel=3D2/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 478.41 BogoMIPS
Memory: 1029104k available
Dentry-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Inode-cache hash table entries: 65536 (order: 7, 524288 bytes)
Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 65536 (order: 6, 262144 bytes)
Page-cache hash table entries: 262144 (order: 8, 1048576 bytes)
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf,
0xb
2. Mombasa GS Add-on mass FC (A3591) (4) at 0xf1004000 [8/4], versions
0x18, 0x0, 0xa7
3. HP HSC-PCI Cards (4) at 0xf1008000 [8/8], versions 0x4, 0x0, 0x9d
4. HP HSC-PCI Cards (4) at 0xf100c000 [8/12], versions 0x4, 0x0, 0x9d
5. UL 550 Lasi Core BA (11) at 0xffd00000 [8/16], versions 0x2f, 0x0,
0x81,  additional addresses: 0xffd0c000 0xffc00000=20
6. UL 550 Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x2f,
0x0, 0x74,  additional addresses: 0xffd01000 0xffd03000=20
7. UL 550 Lasi Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x2f,
0x0, 0x8c8. UL 550 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x2f,
0x0, 0x82
9. UL 350 Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x2f,
0x0, 0x8a
10. UL 550 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x2f,
0x0, 0x84
11. UL 550 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x2f,
0x0, 0x84
12. UL 550 Core Wax BA (11) at 0xffe00000 [8/20], versions 0x31, 0x0,
0x8e
13. UL 550 Wax Core RS-232 (10) at 0xffe02000 [8/20/2], versions 0x31,
0x0, 0x8c
14. UL 550 Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x31, 0x0,
0x90,  additional addresses: 0xffc88000=20
15. U2-IOA BC GSC+ Port (7) at 0xf103f000 [8/63], versions 0x501, 0x1,
0xc
16. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf,
0xb
17. Mombasa GS Add-on mass FC (A3591) (4) at 0xf180c000 [10/12],
versions 0x18, 0x0, 0xa7
18. U2-IOA BC GSC+ Port (7) at 0xf183f000 [10/63], versions 0x501, 0x1,
0xc
19. UL 2w U+/240 (350/550) (0) at 0xfffa0000 [32], versions 0x5ba, 0x0,
0x4
20. UL 2w U+/240 (350/550) (0) at 0xfffa2000 [34], versions 0x5ba, 0x0,
0x4
21. Memory (1) at 0xfffb1000 [49], versions 0x7e, 0x0, 0x9
CONFIG_SMP=3Dn  ignoring additional CPUs
CPU(s): 1 x PA8200 (PCX-U+) at 240.000000 MHz
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
ccio-dma.c: failed to claim CCIO bus address space!
Lasi version 0 at 0xffd00000 found.
LED display at ffd0c000 registered
Wax at 0xffe00000 found.
Wax: HIL Keyboard-NMI registered.
Wax EISA Adapter found at 0xfc000000
EISA EEPROM at 0xffc88000
Enumerating EISA bus
EISA slot 1 a configured board was not detected ( expected ___FFFF)
Dino version 3.x (card mode) found at 0xf1008000
Dino: Failed to allocate memory region
Dino version 3.x (card mode) found at 0xf100c000
Dino: Failed to allocate memory region
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Enabled soft power switch (polling mode, io=3D0xf0140000).
Starting kswapd
Journalled Block Device driver loaded
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
ttyS00 at iomem 0xffd05800 (irq =3D 90) is a 16550A
ttyS01 at iomem 0xffe02800 (irq =3D 121) is a 16550A
PS/2 keyboard port at 0xffd08000 (irq 69) found, no device attached.
PS/2 psaux port at 0xffd08100 (irq 69) found, no device attached.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=3D32
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 33MHz system bus speed for PIO modes; override with
idebus=3Dxx
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
PCI: Unable to reserve I/O region #1:80@8050000 for device 01:01.0
Trying to free nonexistent resource <08050000-0805007f>
Trying to free nonexistent resource <41000000-4100007f>
PCI: Unable to reserve I/O region #1:80@dfd38800 for device 01:02.0
Trying to free nonexistent resource <dfd38800-dfd3887f>
Trying to free nonexistent resource <bfbe6680-bfbe66ff>
PCI: Unable to reserve I/O region #1:80@af335c00 for device 02:01.0
Trying to free nonexistent resource <af335c00-af335c7f>
Trying to free nonexistent resource <ff93e700-ff93e77f>
PCI: Unable to reserve I/O region #1:80@55b26500 for device 02:02.0
Trying to free nonexistent resource <55b26500-55b2657f>
Trying to free nonexistent resource <7e818a00-7e818a7f>
Found i82596 at 0xffd07000, IRQ 87
eth0: 82596 at 0xffd07000, 08 00 09 B8 77 A4 IRQ 87.
82596.c $Revision: 1.28 $
SCSI subsystem driver Revision: 1.00
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c710 rev 2=20
scsi0 : LASI SCSI 53c700
scsi0: (2:0) Synchronous at offset 8, period 100ns
  Vendor: HP        Model: DVD-ROM 6x/32x    Rev: 1.08
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi0: (5:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST39175LW         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
scsi0: (6:0) Synchronous at offset 8, period 100ns
  Vendor: SEAGATE   Model: ST39175LW         Rev: HP03
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
scsi0: (5:0) Enabling Tag Command Queuing
SCSI device sda: 17783112 512-byte hdwr sectors (9105 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4 < sda5 >
scsi0: (6:0) Enabling Tag Command Queuing
SCSI device sdb: 17783112 512-byte hdwr sectors (9105 MB)
 sdb: unknown partition table
Attached scsi CD-ROM sr0 at scsi0, channel 0, id 2, lun 0
sr0: scsi3-mmc drive: 0x/0x cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.12
sticonsole_init: searching for STI ROMs
BUG: Skipping previously registered driver: sti (native)
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :   526.400 MB/sec
   8regs_prefetch:   526.400 MB/sec
   32regs    :   408.800 MB/sec
   32regs_prefetch:   408.800 MB/sec
raid5: using function: 8regs_prefetch (526.400 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 8192 buckets, 64Kbytes
TCP: Hash tables configured (established 262144 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
NOT FREEING INITMEM (383k)

Thanks!

Pat Padgett
