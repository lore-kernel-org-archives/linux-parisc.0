Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail1 (unknown [217.116.164.102])
	by dsl2.external.hp.com (Postfix) with ESMTP id B08EF4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 12 Sep 2002 03:11:42 -0600 (MDT)
Date: Thu, 12 Sep 2002 12:10:18 +0300
From: Arto Jantunen <viiru@debian.org>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP problems (hardware gurus, please read)
Message-ID: <20020912091018.GA16372@dt-link.fi>
References: <20020912054834.GA32209@www1.dt-link.fi> <Pine.LNX.4.44.0209112338570.1464-100000@garibaldi.apptechsys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="LZvS9be/3tNcYl/X"
In-Reply-To: <Pine.LNX.4.44.0209112338570.1464-100000@garibaldi.apptechsys.com>
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

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 11, 2002 at 11:52:28PM -0700, Jeremy Drake wrote:
> I have the exact same problem on my J5000.  apt-get update and samba are 
> the two things that tend to crash it immediately.  It can run fairly well 
> SMP w/o doing either of these.  Also, X is now also crashing SMP (not sure 
> if/when things changed, as I wasn't running graphics for a while, and 
> can't clearly remember running X on smp).
> 
> The HPMC had an odd thing in the IO stuff -
> 
> > > '9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:
> > > 
> > >  Rope     Word1        Word2            Word3
> > > ------ ------------ ------------
> > >    0    0x00000000   0x0e0cc009   0x00000000fed30048
> > >    1    0x00000000   0x1e0cc009   0x00000000fed32048
> > >    2    ----------   0x2e0cc229   ------------------
> > >    3    ----------   0x3e0cc009   ------------------
> > >    4    0x00000000   0x4e0cc009   0x00000000fed38048
> > >    5    ----------   0x5e0cc009   ------------------
> > >    6    0x00000000   0x6e0cc009   0x00000000fed3c048
> > >    7    ----------   0x7e0cc009   ------------------
> 
> And here is one from another time:
> 
> '9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:
> 
>  Rope     Word1        Word2            Word3
> ------ ------------ ------------
>    0    0x00000000   0x0e0cc009   0x00000000fed30048
>    1    0x00000000   0x1e0cc009   0x00000000fed32048
>    2    ----------   0x2e0cc229   ------------------
>    3    ----------   0x3f4fd808   ------------------
>    4    0x00000000   0x40000008   0xffffffffffffffff
>    5    ----------   0x50000008   ------------------
>    6    0x00000000   0x60000008   0xffffffffffffffff
>    7    ----------   0x70100008   ------------------
> 
> possibly, could you send the output of ser pim after such a crash.  Here's 
> the general idea:
> 
> interrupt the boot process, and at the BOOT_ADMIN prompt type "ser 
> clearpim".  then bo pri.  Crash the box, reboot it, interrupt it again, 
> and type ser pim.  I am particularly interested in the io part (should be 
> at the end)...
> 
> Also, are there any HP hardware gurus out there that can explain these odd 
> io numbers?  Could they be relevant?

I did this, but the stuff I got from ser pim is almost all zeroes.
I'm attaching it anyway, but I don't think it is correct. I rebooted
by shutting it down from the power switch, is there a "softer" way
to do it (I only have a serial console)?
--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: attachment; filename="minicom.cap"
Content-Transfer-Encoding: quoted-printable




Firmware Version  38.39

Duplex Console IO Dependent Code (IODC) revision 0

---------------------------------------------------------------------------=
---
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
---------------------------------------------------------------------------=
---

  Processor   Speed            State           Coprocessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------
      0       240 MHz   Active                 Functional            2 MB
      1       240 MHz   Stopped:Deconfigured   Unknown               2 MB

  Central Bus Speed (in MHz)  :        120=20

  Model: R390/2

  Available memory (bytes)    : 1073733632=20
  Good memory required (bytes):   86876160=20

  Primary boot path:    8/4.1   (dec)  =20
  Alternate boot path:  8/4.6   (dec)  =20
  Console path:         8/16/4.0   (dec)  =20
  Keyboard path:        8/16/7.0   (dec)  =20

CPU 0
WARNING:  Memory has been initialized, but not tested as a result of
          FASTBOOT being enabled.  To test memory, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


Processor is starting autoboot process.

To discontinue, press any key within 10 seconds.

10 seconds expired.
Proceeding...

Trying Primary Boot Path
------------------------

Booting...=20
Boot IO Dependent Code (IODC) revision 152


HARD Booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

Partition Start(MB) End(MB) Id Type
1               1      16   f0 Palo
2              49    1002   82 swap
3            1003    4094   83 ext2
4              17      48   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 3687647 bytes @ 0x48000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=3D/dev/sda3 HOME=3D/ console=3DttyS0 TERM=3D=
vt102 palo_kernel=3D4/vmlinux'
Selected kernel: /vmlinux from partition 4
ELF32 executable
Entry 00100000 first 00100000 n 6
Segment 0 load 00100000 size 1893508 mediaptr 0x1000
Segment 1 load 002d0000 size 596888 mediaptr 0x1d0000
Segment 2 load 00364000 size 221560 mediaptr 0x262000
Segment 3 load 0039c000 size 8192 mediaptr 0x299000
Segment 4 load 003a0000 size 32768 mediaptr 0x29b000
Segment 5 load 003e38a4 size 82000 mediaptr 0x2a38a4
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.19-pa14 (root@elli) (gcc version 3.0.4) #1 SMP Wed Sep 11=
 12:54:30 EEST 2002
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005ba0 00000491 00000000 00000002 7777173a 100000f0 00000008 000000=
b2 000000b2
vers  00000501
CPUID vers 14 rev 23 (0x000001d7)
capabilities 0x3
model 9000/800/R390
Total Memory: 1024 Mb
pagetable_init
On node 0 totalpages: 262144
zone(0): 262144 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=3D/dev/sda3 HOME=3D/ console=3DttyS0 TERM=3Dvt102=
 palo_kernel=3D4/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 478.41 BogoMIPS
Memory: 1033080k available
Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
Inode cache hash table entries: 65536 (order: 7, 524288 bytes)
Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 65536 (order: 6, 262144 bytes)
Page-cache hash table entries: 262144 (order: 8, 1048576 bytes)
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb
2. Bluefish Add-on FW-SCSI (4) at 0xf1004000 [8/4], versions 0x13, 0x1, 0x89
3. HP HSC-PCI Cards (4) at 0xf1008000 [8/8], versions 0x4, 0x0, 0x9d
4. UL 550 Lasi Core BA (11) at 0xffd00000 [8/16], versions 0x2f, 0x0, 0x81,=
  additional addresses: 0xffd0c000 0xffc00000=20
5. UL 550 Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x2f, 0x0, =
0x74,  additional addresses: 0xffd01000 0xffd03000=20
6. UL 550 Lasi Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x2f, 0x0,=
 0x8c
7. UL 550 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x2f, 0x0, 0x82
8. UL 350 Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x2f, 0x0,=
 0x8a
9. UL 550 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x2f, 0x0, 0=
x84
10. UL 550 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x2f, 0x0, =
0x84
11. UL 550 Core Wax BA (11) at 0xffe00000 [8/20], versions 0x31, 0x0, 0x8e
12. UL 550 Wax Core RS-232 (10) at 0xffe02000 [8/20/2], versions 0x31, 0x0,=
 0x8c
13. UL 550 Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x31, 0x0, 0x9=
0,  additional addresses: 0xffc88000=20
14. U2-IOA BC GSC+ Port (7) at 0xf103f000 [8/63], versions 0x501, 0x1, 0xc
15. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, 0xb
16. Bluefish Add-on FW-SCSI (4) at 0xf180c000 [10/12], versions 0x13, 0x1, =
0x89
17. U2-IOA BC GSC+ Port (7) at 0xf183f000 [10/63], versions 0x501, 0x1, 0xc
18. UL 2w U+/240 (350/550) (0) at 0xfffa0000 [32], versions 0x5ba, 0x0, 0x4
19. Memory (1) at 0xfffb1000 [49], versions 0x7e, 0x0, 0x9
CPU(s): 1 x PA8200 (PCX-U+) at 240.000000 MHz
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
LED display at ffd0c000 registered
Wax at 0xffe00000 found.
Wax EISA Adapter found at 0xfc000000
EISA EEPROM at 0xffc88000
Enumerating EISA bus
EISA slot 1 a configured board was not detected ( expected ___FFFF)
Dino version 3.x (card mode) found at 0xf1008000
Dino: Failed to allocate memory region
POSIX conformance testing by UNIFIX
SMP: Bootstrap processor only.
SMP: Total 1 of 1 processors activated (478.41 BogoMIPS noticed).
Waiting on wait_init_idle (map =3D 0x0)
All processors have done init_idle
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch enabled, polling @ 0xf0140000.
Starting kswapd
VFS: Diskquotas version dquot_6.4.0 initialized
Journalled Block Device driver loaded
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_P=
CI enabled
ttyS00 at iomem 0xffd05800 (irq =3D 90) is a 16550A
ttyS01 at iomem 0xffe02800 (irq =3D 121) is a 16550A
PS/2 keyboard port at 0xffd08000 (irq 69) found, no device attached.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Found i82596 at 0xffd07000, IRQ 87
eth0: 82596 at 0xffd07000, 08 00 09 A3 38 14 IRQ 87.
82596.c $Revision: 1.29 $
SCSI subsystem driver Revision: 1.00
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 36
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 37
ncr53c8xx: 53c720 detected
ncr53c720-1: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3b-20010512
scsi1 : ncr53c8xx-3.4.3b-20010512
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP15
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP15
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
53c700: Version 2.7 By James.Bottomley@HansenPartnership.com
scsi2: 53c710 rev 2=20
scsi2 : LASI SCSI 53c700
scsi2: (2:0) Synchronous at offset 8, period 100ns
  Vendor: HP        Model: DVD-ROM 6x/32x    Rev: 1.08
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi2: (3:0) Synchronous at offset 8, period 100ns
  Vendor: HP        Model: C1537A            Rev: HP02
  Type:   Sequential-Access                  ANSI SCSI revision: 02
st: Version 20020205, bufsize 32768, wrt 30720, max init. bufs 4, s/g segs =
16
Attached scsi tape st0 at scsi2, channel 0, id 3, lun 0
Attached scsi disk sda at scsi0, channel 0, id 1, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 2, lun 0
Attached scsi disk sdc at scsi0, channel 0, id 3, lun 0
Attached scsi disk sdd at scsi0, channel 0, id 4, lun 0
Attached scsi disk sde at scsi0, channel 0, id 5, lun 0
Attached scsi disk sdf at scsi0, channel 0, id 6, lun 0
Attached scsi disk sdg at scsi1, channel 0, id 1, lun 0
Attached scsi disk sdh at scsi1, channel 0, id 2, lun 0
Attached scsi disk sdi at scsi1, channel 0, id 3, lun 0
Attached scsi disk sdj at scsi1, channel 0, id 4, lun 0
Attached scsi disk sdk at scsi1, channel 0, id 5, lun 0
Attached scsi disk sdl at scsi1, channel 0, id 6, lun 0
ncr53c720-0-<1,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
ncr53c720-0-<2,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdb: 8388314 512-byte hdwr sectors (4295 MB)
 sdb: unknown partition table
ncr53c720-0-<3,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdc: 8388314 512-byte hdwr sectors (4295 MB)
 sdc: unknown partition table
ncr53c720-0-<4,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdd: 8388314 512-byte hdwr sectors (4295 MB)
 sdd: unknown partition table
ncr53c720-0-<5,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sde: 8388314 512-byte hdwr sectors (4295 MB)
 sde: unknown partition table
ncr53c720-0-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdf: 8388314 512-byte hdwr sectors (4295 MB)
 sdf: unknown partition table
ncr53c720-1-<1,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdg: 8388314 512-byte hdwr sectors (4295 MB)
 sdg: unknown partition table
ncr53c720-1-<2,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdh: 8388314 512-byte hdwr sectors (4295 MB)
 sdh: unknown partition table
ncr53c720-1-<3,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdi: 8388314 512-byte hdwr sectors (4295 MB)
 sdi: unknown partition table
ncr53c720-1-<4,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdj: 8388314 512-byte hdwr sectors (4295 MB)
 sdj: unknown partition table
ncr53c720-1-<5,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdk: 8388314 512-byte hdwr sectors (4295 MB)
 sdk: unknown partition table
ncr53c720-1-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdl: 8388314 512-byte hdwr sectors (4295 MB)
 sdl: unknown partition table
Attached scsi CD-ROM sr0 at scsi2, channel 0, id 2, lun 0
sr0: scsi3-mmc drive: 0x/0x cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.12
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :   504.400 MB/sec
   8regs_prefetch:   443.600 MB/sec
   32regs    :   459.600 MB/sec
   32regs_prefetch:   432.400 MB/sec
raid5: using function: 8regs (504.400 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 1024 buckets, 48Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 216k freed
INIT: version 2.84 booting
Activating swap.
Adding Swap: 977140k swap-space (priority -1)
Checking root file system...
fsck 1.28 (31-Aug-2002)
/dev/sda3: clean, 30096/396000 files, 160528/791616 blocks
System time was Thu Sep 12 05:23:22 UTC 2002.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Thu Sep 12 05:23:20 UTC 2002.
Calculating module dependencies... done.
Loading modules:=20
Starting RAID devices:  [events: 00000012]
 [events: 00000012]
 [events: 00000012]
 [events: 00000012]
 [events: 00000012]
 [events: 00000012]
md: autorun ...
md: considering sdg ...
md:  adding sdg ...
md:  adding sdf ...
md:  adding sde ...
md:  adding sdd ...
md:  adding sdc ...
md:  adding sdb ...
md: created md0
md: bind<sdb,1>
md: bind<sdc,2>
md: bind<sdd,3>
md: bind<sde,4>
md: bind<sdf,5>
md: bind<sdg,6>
md: running: <sdg><sdf><sde><sdd><sdc><sdb>
md: sdg's event counter: 00000012
md: sdf's event counter: 00000012
md: sde's event counter: 00000012
md: sdd's event counter: 00000012
md: sdc's event counter: 00000012
md: sdb's event counter: 00000012
md0: max total readahead window set to 992k
md0: 4 data-disks, max readahead per data-disk: 248k
raid5: spare disk sdg
raid5: device sdf operational as raid disk 4
raid5: device sde operational as raid disk 3
raid5: device sdd operational as raid disk 2
raid5: device sdc operational as raid disk 1
raid5: device sdb operational as raid disk 0
raid5: allocated 5436kB for md0
raid5: raid level 5 set md0 active with 5 out of 5 devices, algorithm 2
RAID5 conf printout:
 --- rd:5 wd:5 fd:0
 disk 0, s:0, o:1, n:0 rd:0 us:1 dev:sdb
 disk 1, s:0, o:1, n:1 rd:1 us:1 dev:sdc
 disk 2, s:0, o:1, n:2 rd:2 us:1 dev:sdd
 disk 3, s:0, o:1, n:3 rd:3 us:1 dev:sde
 disk 4, s:0, o:1, n:4 rd:4 us:1 dev:sdf
RAID5 conf printout:
 --- rd:5 wd:5 fd:0
 disk 0, s:0, o:1, n:0 rd:0 us:1 dev:sdb
 disk 1, s:0, o:1, n:1 rd:1 us:1 dev:sdc
 disk 2, s:0, o:1, n:2 rd:2 us:1 dev:sdd
 disk 3, s:0, o:1, n:3 rd:3 us:1 dev:sde
 disk 4, s:0, o:1, n:4 rd:4 us:1 dev:sdf
md: updating md0 RAID superblock on device
md: sdg [events: 00000013]<6>(write) sdg's sb offset: 4194048
md: sdf [events: 00000013]<6>(write) sdf's sb offset: 4194048
md: sde [events: 00000013]<6>(write) sde's sb offset: 4194048
md: sdd [events: 00000013]<6>(write) sdd's sb offset: 4194048
md: sdc [events: 00000013]<6>(write) sdc's sb offset: 4194048
md: sdb [events: 00000013]<6>(write) sdb's sb offset: 4194048
md: ... autorun DONE.
/dev/md0 done.
Checking all file systems...
fsck 1.28 (31-Aug-2002)
/dev/sda4: clean, 25/8256 files, 18237/32769 blocks
Setting kernel variables.
Mounting local filesystems...
/dev/sda4 on /boot type ext2 (rw)
Running 0dns-down to make sure resolv.conf is ok...done.
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: eth0: link ok.
done.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Thu Sep 12 08:23:37 EEST 2002

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting OpenLDAP: slapd.
Starting internet superserver: inetd.
Starting mail transport agent: Postfix.
Starting OpenBSD Secure Shell server: sshd.
Starting teapop: teapop.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.

Debian GNU/Linux testing/unstable elli ttyS0

elli login: root
Password:=20
Last login: Wed Sep 11 15:47:34 2002 on ttyS0
Linux elli 2.4.19-pa14 #1 SMP Wed Sep 11 12:54:30 EEST 2002 parisc unknown =
unknown GNU/Linux

Most of the programs included with the Debian GNU/Linux system are
freely redistributable; the exact distribution terms for each program
are described in the individual files in /usr/share/doc/*/copyright

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
elli:~# uname -=08 =08=08 =08=08 =08=08 =08=08 =08=08 =08=08 =08=07=07=07=
=07cat /proc/pcu=08 =08=08 =08=08 =08cpuinfo
processor	: 0
cpu family	: PA-RISC 2.0
cpu		: PA8200 (PCX-U+)
cpu MHz		: 240.000000
model		: 9000/800/R390
model name	: UL 2w U+/240 (350/550)
hversion	: 0x00005ba0
sversion	: 0x00000491
I-cache		: 2048 KB
D-cache		: 2048 KB (WB)
ITLB entries	: 120
DTLB entries	: 120 - shared with ITLB
bogomips	: 478.41
software id	: 2004293434

elli:~# sync && apt-get update
0% [Working]            Hit http://security.debian.org stable/updates/main =
Packages
            Hit http://security.debian.org stable/updates/main Release
            Hit http://security.debian.org stable/updates/contrib Packages
            Hit http://security.debian.org stable/updates/contrib Release
            Hit http://security.debian.org stable/updates/non-free Packages
            Hit http://security.debian.org stable/updates/non-free Release
            19% [Connecting to ftp.fi.debian.org] [Waiting for file]       =
                                                 Get:1 http://non-us.debian=
.org unstable/non-US/main Packages [34.2kB]
                                                        3% [Connecting to f=
tp.fi.debian.org (130.230.54.99)] [1 Packages 1106/34.2kB 3%]              =
                                                                  Get:2 htt=
p://ftp.fi.debian.org unstable/main Packages [1945kB]
                                                                           =
     0% [2 Packages 1093/1945kB 0%] [1 Packages 8346/34.2kB 24%]           =
                                                7% [2 Packages 115485/1945k=
B 5%] [Waiting for file]                                                   =
Get:3 http://non-us.debian.org unstable/non-US/main Release [89B]
                                                   Hit http://non-us.debian=
.org unstable/non-US/contrib Packages
                                                   Get:4 http://non-us.debi=
an.org unstable/non-US/contrib Release [92B]
                                                   Hit http://non-us.debian=
.org unstable/non-US/non-free Packages
                                                   Get:5 http://non-us.debi=
an.org unstable/non-US/non-free Release [93B]
                                                   Hit http://non-us.debian=
.org stable/non-US/main Sources
                                                   Hit http://non-us.debian=
.org stable/non-US/main Release
                                                   Hit http://non-us.debian=
.org stable/non-US/contrib Sources
7% [2 Packages 115485/1945kB 5%] [Waiting for file]                        =
                           Hit http://non-us.debian.org stable/non-US/contr=
ib Release
7% [2 Packages 115485/1945kB 5%] [Waiting for file]                        =
                           7% [1 Packages gzip 0] [2 Packages 115485/1945kB=
 5%] [Waiting for file]                                                    =
                   Hit http://non-us.debian.org stable/non-US/non-free Sour=
ces
                                                                       Hit =
http://non-us.debian.org stable/non-US/non-free Release
                                                                       10% =
[1 Packages gzip 0] [2 Packages 174853/1945kB 8%]                          =
                           11% [2 Packages 190781/1945kB 9%]               =
                  15% [2 Packages 280557/1945kB 14%]20% [2 Packages 376125/=
1945kB 19%]25% [2 Packages 465901/1945kB 23%]30% [2 Packages 564365/1945kB =
29%]34% [2 Packages 649797/1945kB 33%]37% [2 Packages 712061/1945kB 36%]41%=
 [2 Packages 783013/1945kB 40%]45% [2 Packages 856861/1945kB 44%]          =
                        48% [2 Packages 924917/1945kB 47%]                 =
                   153kB/s 6s51% [2 Packages 992973/1945kB 51%]            =
                        153kB/s 6s55% [2 Packages 1072613/1945kB 55%]      =
                             153kB/s 5s59% [2 Packages 1152253/1945kB 59%] =
                                  153kB/s 5s62% [2 Packages 1198589/1945kB =
61%]                                   153kB/s 4s67% [2 Packages 1292709/19=
45kB 66%]                                   153kB/s 4s70% [2 Packages 13607=
65/1945kB 69%]                                   153kB/s 3s74% [2 Packages =
1431717/1945kB 73%]                                   153kB/s 3s78% [2 Pack=
ages 1509909/1945kB 77%]                                   153kB/s 2s81% [2=
 Packages 1585205/1945kB 81%]                                   153kB/s 2s8=
5% [2 Packages 1661949/1945kB 85%]                                   153kB/=
s 1s90% [2 Packages 1750277/1945kB 89%]                                   1=
53kB/s 1s93% [2 Packages 1813989/1945kB 93%]                               =
    153kB/s 0s97% [2 Packages 1897973/1945kB 97%]                          =
         150kB/s 0s                                                        =
                        Get:6 http://ftp.fi.debian.org unstable/main Releas=
e [82B]
                                                                           =
     Hit http://ftp.fi.debian.org unstable/non-free Packages
                                                                           =
     Get:7 http://ftp.fi.debian.org unstable/non-free Release [86B]
                                                                           =
     Get:8 http://ftp.fi.debian.org unstable/contrib Packages [47.8kB]
97% [8 Packages 2308/47.8kB 4%]                                       150kB=
/s 0s97% [2 Packages gzip 0] [8 Packages 2308/47.8kB 4%]                   =
150kB/s 0s                                                                 =
               Get:9 http://ftp.fi.debian.org unstable/contrib Release [85B]
                                                                           =
     Hit http://ftp.fi.debian.org stable/main Sources
                                                                           =
     Hit http://ftp.fi.debian.org stable/main Release
                                                                           =
     Hit http://ftp.fi.debian.org stable/non-free Sources
                                                                           =
     Hit http://ftp.fi.debian.org stable/non-free Release
                                                                           =
     Hit http://ftp.fi.debian.org stable/contrib Sources
                                                                           =
     Hit http://ftp.fi.debian.org stable/contrib Release
99% [2 Packages gzip 212992]                                          150kB=
/s 0s99% [2 Packages gzip 2093056]                                         =
150kB/s 0s99% [2 Packages gzip 4059136]                                    =
     150kB/s 0s99% [2 Packages gzip 5926912]                               =
          150kB/s 0s99% [Working]                                          =
               150kB/s 0s99% [8 Packages gzip 0]                           =
                    150kB/s 0s100% [Working]                               =
                         150kB/s 0s                                        =
                                        Fetched 2027kB in 15s (131kB/s)
Reading Package Lists... 0%apt-get(285): unaligned access to 0x403cf08c at =
ip=3D0x4005e4f7
Reading Package=20

Lists... 0%
High Priority Machine Check (HPMC): Code=3D1 regs=3D102ea080 (Addr=3D000000=
00)

Interact with IPL (Y, N, or Cancel)?> n

Booting...=20
Boot IO Dependent Code (IODC) revision 152


HARD Booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

Partition Start(MB) End(MB) Id Type
1               1      16   f0 Palo
2              49    1002   82 swap
3            1003    4094   83 ext2
4              17      48   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 3687647 bytes @ 0x48000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'root=3D/dev/sda3 HOME=3D/ console=3DttyS0 TERM=3D=
vt102 palo_kernel=3D4/vmlinux'
Selected kernel: /vmlinux from partition 4
ELF32 executable
Entry 00100000 first 00100000 n 6
Segment 0 load 00100000 size 1893508 mediaptr 0x1000
Segment 1 load 002d0000 size 596888 mediaptr 0x1d0000
Segment 2 load 00364000 size 221560 mediaptr 0x262000
Segment 3 load 0039c000 size 8192 mediaptr 0x299000
Segment 4 load 003a0000 size 32768 mediaptr 0x29b000
Segment 5 load 003e38a4 size 82000 mediaptr 0x2a38a4
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.19-pa14 (root@elli) (gcc version 3.0.4) #1 SMP Wed Sep 11=
 12:54:30 EEST 2002
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005ba0 00000491 00000000 00000002 7777173a 100000f0 00000008 000000=
b2 000000b2
vers  00000501
CPUID vers 14 rev 23 (0x000001d7)
capabilities 0x3
model 9000/800/R390
Total Memory: 1024 Mb
pagetable_init
On node 0 totalpages: 262144
zone(0): 262144 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=3D/dev/sda3 HOME=3D/ console=3DttyS0 TERM=3Dvt102=
 palo_kernel=3D4/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 478.41 BogoMIPS
Memory: 1033080k available
Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
Inode cache hash table entries: 65536 (order: 7, 524288 bytes)
Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 65536 (order: 6, 262144 bytes)
Page-cache hash table entries: 262144 (order: 8, 1048576 bytes)
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb
2. Bluefish Add-on FW-SCSI (4) at 0xf1004000 [8/4], versions 0x13, 0x1, 0x89
3. HP HSC-PCI Cards (4) at 0xf1008000 [8/8], versions 0x4, 0x0, 0x9d
4. UL 550 Lasi Core BA (11) at 0xffd00000 [8/16], versions 0x2f, 0x0, 0x81,=
  additional addresses: 0xffd0c000 0xffc00000=20
5. UL 550 Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x2f, 0x0, =
0x74,  additional addresses: 0xffd01000 0xffd03000=20
6. UL 550 Lasi Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x2f, 0x0,=
 0x8c
7. UL 550 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x2f, 0x0, 0x82
8. UL 350 Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x2f, 0x0,=
 0x8a
9. UL 550 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x2f, 0x0, 0=
x84
10. UL 550 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x2f, 0x0, =
0x84
11. UL 550 Core Wax BA (11) at 0xffe00000 [8/20], versions 0x31, 0x0, 0x8e
12. UL 550 Wax Core RS-232 (10) at 0xffe02000 [8/20/2], versions 0x31, 0x0,=
 0x8c
13. UL 550 Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x31, 0x0, 0x9=
0,  additional addresses: 0xffc88000=20
14. U2-IOA BC GSC+ Port (7) at 0xf103f000 [8/63], versions 0x501, 0x1, 0xc
15. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, 0xb
16. Bluefish Add-on FW-SCSI (4) at 0xf180c000 [10/12], versions 0x13, 0x1, =
0x89
17. U2-IOA BC GSC+ Port (7) at 0xf183f000 [10/63], versions 0x501, 0x1, 0xc
18. UL 2w U+/240 (350/550) (0) at 0xfffa0000 [32], versions 0x5ba, 0x0, 0x4
19. Memory (1) at 0xfffb1000 [49], versions 0x7e, 0x0, 0x9
CPU(s): 1 x PA8200 (PCX-U+) at 240.000000 MHz
Found U2 at 0xfff88000
Found U2 at 0xfff8a000
Lasi version 0 at 0xffd00000 found.
LED display at ffd0c000 registered
Wax at 0xffe00000 found.
Wax EISA Adapter found at 0xfc000000
EISA EEPROM at 0xffc88000
Enumerating EISA bus
EISA slot 1 a configured board was not detected ( expected ___FFFF)
Dino version 3.x (card mode) found at 0xf1008000
Dino: Failed to allocate memory region
POSIX conformance testing by UNIFIX
SMP: Bootstrap processor only.
SMP: Total 1 of 1 processors activated (478.41 BogoMIPS noticed).
Waiting on wait_init_idle (map =3D 0x0)
All processors have done init_idle
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch enabled, polling @ 0xf0140000.
Starting kswapd
VFS: Diskquotas version dquot_6.4.0 initialized
Journalled Block Device driver loaded
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_P=
CI enabled
ttyS00 at iomem 0xffd05800 (irq =3D 90) is a 16550A
ttyS01 at iomem 0xffe02800 (irq =3D 121) is a 16550A
PS/2 keyboard port at 0xffd08000 (irq 69) found, no device attached.
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
Found i82596 at 0xffd07000, IRQ 87
eth0: 82596 at 0xffd07000, 08 00 09 A3 38 14 IRQ 87.
82596.c $Revision: 1.29 $
SCSI subsystem driver Revision: 1.00
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 36
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 37
ncr53c8xx: 53c720 detected
ncr53c720-1: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3b-20010512
scsi1 : ncr53c8xx-3.4.3b-20010512
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP15
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP15
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
53c700: Version 2.7 By James.Bottomley@HansenPartnership.com
scsi2: 53c710 rev 2=20
scsi2 : LASI SCSI 53c700
scsi2: (2:0) Synchronous at offset 8, period 100ns
  Vendor: HP        Model: DVD-ROM 6x/32x    Rev: 1.08
  Type:   CD-ROM                             ANSI SCSI revision: 02
scsi2: (3:0) Synchronous at offset 8, period 100ns
  Vendor: HP        Model: C1537A            Rev: HP02
  Type:   Sequential-Access                  ANSI SCSI revision: 02
st: Version 20020205, bufsize 32768, wrt 30720, max init. bufs 4, s/g segs =
16
Attached scsi tape st0 at scsi2, channel 0, id 3, lun 0
Attached scsi disk sda at scsi0, channel 0, id 1, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 2, lun 0
Attached scsi disk sdc at scsi0, channel 0, id 3, lun 0
Attached scsi disk sdd at scsi0, channel 0, id 4, lun 0
Attached scsi disk sde at scsi0, channel 0, id 5, lun 0
Attached scsi disk sdf at scsi0, channel 0, id 6, lun 0
Attached scsi disk sdg at scsi1, channel 0, id 1, lun 0
Attached scsi disk sdh at scsi1, channel 0, id 2, lun 0
Attached scsi disk sdi at scsi1, channel 0, id 3, lun 0
Attached scsi disk sdj at scsi1, channel 0, id 4, lun 0
Attached scsi disk sdk at scsi1, channel 0, id 5, lun 0
Attached scsi disk sdl at scsi1, channel 0, id 6, lun 0
ncr53c720-0-<1,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
ncr53c720-0-<2,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdb: 8388314 512-byte hdwr sectors (4295 MB)
 sdb: unknown partition table
ncr53c720-0-<3,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdc: 8388314 512-byte hdwr sectors (4295 MB)
 sdc: unknown partition table
ncr53c720-0-<4,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdd: 8388314 512-byte hdwr sectors (4295 MB)
 sdd: unknown partition table
ncr53c720-0-<5,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sde: 8388314 512-byte hdwr sectors (4295 MB)
 sde: unknown partition table
ncr53c720-0-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdf: 8388314 512-byte hdwr sectors (4295 MB)
 sdf: unknown partition table
ncr53c720-1-<1,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdg: 8388314 512-byte hdwr sectors (4295 MB)
 sdg: unknown partition table
ncr53c720-1-<2,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdh: 8388314 512-byte hdwr sectors (4295 MB)
 sdh: unknown partition table
ncr53c720-1-<3,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdi: 8388314 512-byte hdwr sectors (4295 MB)
 sdi: unknown partition table
ncr53c720-1-<4,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdj: 8388314 512-byte hdwr sectors (4295 MB)
 sdj: unknown partition table
ncr53c720-1-<5,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdk: 8388314 512-byte hdwr sectors (4295 MB)
 sdk: unknown partition table
ncr53c720-1-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdl: 8388314 512-byte hdwr sectors (4295 MB)
 sdl: unknown partition table
Attached scsi CD-ROM sr0 at scsi2, channel 0, id 2, lun 0
sr0: scsi3-mmc drive: 0x/0x cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.12
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :   504.000 MB/sec
   8regs_prefetch:   443.600 MB/sec
   32regs    :   459.200 MB/sec
   32regs_prefetch:   432.400 MB/sec
raid5: using function: 8regs (504.000 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=3D256, MD_SB_DISKS=3D27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 1024 buckets, 48Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 216k freed
INIT: version 2.84 booting
Activating swap.
Adding Swap: 977140k swap-space (priority -1)
Checking root file system...
fsck 1.28 (31-Aug-2002)
/dev/sda3 was not cleanly unmounted, check forced.
/dev/sda3: |=3D=3D                                                      |  =
2.8%   /dev/sda3: |=3D=3D=3D                                               =
      /  5.6%   /dev/sda3: |=3D=3D=3D=3D=3D                                =
                   -  8.4%   /dev/sda3: |=3D=3D=3D=3D=3D=3D                =
                                  \ 11.2%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=
=3D=3D                                                | 14.0%   /dev/sda3: =
|=3D=3D=3D=3D=3D=3D=3D=3D=3D                                               =
/ 16.8%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                    =
                         - 19.6%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D                                           \ 22.4%   /dev/sda3:=
 |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                               =
           | 25.2%   /dev/sda3:                                            =
                                    Inode 142595, i_blocks is 80, should be=
 56.  FIXED.
/dev/sda3: Inode 142873, i_blocks is 320, should be 296.  FIXED.
/dev/sda3: Inode 142775, i_blocks is 336, should be 312.  FIXED.
/dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D               =
                         / 28.0%   /dev/sda3:                              =
                                                  Inode 158469, i_blocks is=
 64, should be 8.  FIXED.
/dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D            =
                           - 30.8%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                                     \ 33.=
6%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D                                    | 36.4%   /dev/sda3: |=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                     =
             / 39.2%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                                - 42.0%   =
/dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D                               \ 44.8%   /dev/sda3: |=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
                          | 47.6%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                  =
          / 50.4%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                          -=
 53.2%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                         \ 56.0%   /=
dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                       | 58.8%   /dev/s=
da3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                      / 61.6%   /dev/sda3:=
                                                                           =
     Inode 348490, i_blocks is 88, should be 48.  FIXED.
/dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                    - 64.4%   =
/dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                  \ 67.2=
%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D               =
  | 70.0%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D         =
        / 70.2%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
              - 70.4%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D                \ 70.7%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D                | 70.9%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D                / 71.2%   /dev/sda3: |=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                - 71.5%   /dev/sda3: |=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                \ 71.8%   /dev/sd=
a3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                | 72.1% =
  /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D            =
   / 72.5%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
               - 72.8%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D               \ 73.1%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D               | 73.4%   /dev/sda3: |=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D               / 73.7%   /dev/sda3: |=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D              - 74.1%   =
/dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D            =
  \ 74.5%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
              | 74.8%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D              / 75.0%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D              - 75.2%   /dev/sda3: |=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D              \ 75.5%   /dev/sda3: |=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D              | 75.7%   /de=
v/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D            =
 / 75.9%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D             - 76.2%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D             \ 76.6%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D             | 77.0%   /dev/sda3: |=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D             / 77.2%   /dev=
/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D            =
 - 77.5%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D            \ 77.9%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D            | 78.1%   /dev/sda3: |=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D            / 78.4%   /dev/sda3: =
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D            - 7=
8.7%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D            \ 79.0%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D            | 79.2%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D           / 79.7%   /dev/sda3: |=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D           - 80=
.0%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D           \ 80.2%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D           | 80.6%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D           / 80.8%   /dev/sda3: |=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D           - 81.0%=
   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D          \ 81.3%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D          | 81.6%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D          / 81.8%   /dev/sda3:=
 |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D         =
 - 82.1%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D          \ 82.3%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D          | 82.5%   /dev/sda3: |=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D          / 82.8%   /=
dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
          - 83.0%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D         \ 83.3%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D         | 83.4%   /dev/sda=
3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
      / 83.6%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D         - 83.9%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D         \ 84.2%   /dev/sda3: =
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =
   | 84.4%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D         / 84.6%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D        - 84.9%   /dev/sda3: |=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      =
  \ 85.2%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D        | 85.4%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D        / 85.9%   /dev/sda3: |=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D        -=
 86.1%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D        \ 86.3%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D        | 86.6%   /dev/sda3: |=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D       / =
86.8%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D       - 87.0%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D       \ 87.2%   /dev/sda3: |=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
    | 87.6%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D       / 87.8%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D       - 88.0%   /dev/sd=
a3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D       \ 88.2%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      | 89.3%   /dev/sda3: |=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D      / 90.0=
%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D    - 92.0%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    \ 92.7%   /dev=
/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D   | 93.9%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   / 95.0%   /dev/sda=
3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D   - 95.1%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  \ 96.0%   /dev/sda3=
: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  | 96.8%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D / 98.1%   /dev/sda3:=
 |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D- 99.6%   /dev/sda3: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D| 100.0%    =
                                                                           =
   /dev/sda3: 30103/396000 files (0.8% non-contiguous), 160550/791616 blocks
System time was Thu Sep 12 08:42:44 UTC 2002.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Thu Sep 12 08:42:53 UTC 2002.
Calculating module dependencies... done.
Loading modules:=20
Starting RAID devices:  [events: 00000013]
 [events: 00000013]
 [events: 00000013]
 [events: 00000013]
 [events: 00000013]
 [events: 00000013]
md: autorun ...
md: considering sdg ...
md:  adding sdg ...
md:  adding sdf ...
md:  adding sde ...
md:  adding sdd ...
md:  adding sdc ...
md:  adding sdb ...
md: created md0
md: bind<sdb,1>
md: bind<sdc,2>
md: bind<sdd,3>
md: bind<sde,4>
md: bind<sdf,5>
md: bind<sdg,6>
md: running: <sdg><sdf><sde><sdd><sdc><sdb>
md: sdg's event counter: 00000013
md: sdf's event counter: 00000013
md: sde's event counter: 00000013
md: sdd's event counter: 00000013
md: sdc's event counter: 00000013
md: sdb's event counter: 00000013
md: md0: raid array is not clean -- starting background reconstruction
md0: max total readahead window set to 992k
md0: 4 data-disks, max readahead per data-disk: 248k
raid5: spare disk sdg
raid5: device sdf operational as raid disk 4
raid5: device sde operational as raid disk 3
raid5: device sdd operational as raid disk 2
raid5: device sdc operational as raid disk 1
raid5: device sdb operational as raid disk 0
raid5: allocated 5436kB for md0
raid5: raid level 5 set md0 active with 5 out of 5 devices, algorithm 2
raid5: raid set md0 not clean; reconstructing parity
RAID5 conf printout:
 --- rd:5 wd:5 fd:0
 disk 0, s:0, o:1, n:0 rd:0 us:1 dev:sdb
 disk 1, s:0, o:1, n:1 rd:1 us:1 dev:sdc
 disk 2, s:0, o:1, n:2 rd:2 us:1 dev:sdd
 disk 3, s:0, o:1, n:3 rd:3 us:1 dev:sde
 disk 4, s:0, o:1, n:4 rd:4 us:1 dev:sdf
RAID5 conf printout:
 --- rd:5 wd:5 fd:0
 disk 0, s:0, o:1, n:0 rd:0 us:1 dev:sdb
 disk 1, s:0, o:1, n:1 rd:1 us:1 dev:sdc
 disk 2, s:0, o:1, n:2 rd:2 us:1 dev:sdd
 disk 3, s:0, o:1, n:3 rd:3 us:1 dev:sde
 disk 4, s:0, o:1, n:4 rd:4 us:1 dev:sdf
md: updating md0 RAID superblock on device
md: sdg [events: 00000014]<6>(write) sdg's sb offset: 4194048
md: syncing RAID array md0
md: minimum _guaranteed_ reconstruction speed: 100 KB/sec/disc.
md: using maximum available idle IO bandwith (but not more than 100000 KB/s=
ec) for reconstruction.
md: using 124k window, over a total of 4194048 blocks.
md: sdf [events: 00000014]<6>(write) sdf's sb offset: 4194048
md: sde [events: 00000014]<6>(write) sde's sb offset: 4194048
md: sdd [events: 00000014]<6>(write) sdd's sb offset: 4194048
md: sdc [events: 00000014]<6>(write) sdc's sb offset: 4194048
md: sdb [events: 00000014]<6>(write) sdb's sb offset: 4194048
md: ... autorun DONE.
/dev/md0 done.
Checking all file systems...
fsck 1.28 (31-Aug-2002)
/dev/sda4 was not cleanly unmounted, check forced.
/dev/sda4: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                                 =
             | 17.5%   /dev/sda4: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D                                    / 35.0%   /dev/sda=
4: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D                           - 52.5%   /dev/sda4: |=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                 \ 70.0%   /dev/sda4: |=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
      | 90.0%   /dev/sda4: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D    / 92.0%   /dev/sda4: |=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D   =
- 95.0%   /dev/sda4: |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  \ 95.6%   /dev/sda4: |=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D| 100.0%                                                                =
                  /dev/sda4: 25/8256 files (8.0% non-contiguous), 18237/327=
69 blocks
Setting kernel variables.
Mounting local filesystems...
/dev/sda4 on /boot type ext2 (rw)
Running 0dns-down to make sure resolv.conf is ok...done.
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: eth0: link ok.
done.

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Thu Sep 12 11:43:41 EEST 2002

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting OpenLDAP: slapd.
Starting internet superserver: inetd.
Starting mail transport agent: Postfix
=2E
Starting OpenBSD Secure Shell server: sshd.
Starting teapop: teapop.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.

Debian GNU/Linux testing/unstable elli ttyS0

elli login: root
Password:=20
Last login: Thu Sep 12 08:24:40 2002 on ttyS0
Linux elli 2.4.19-pa14 #1 SMP Wed Sep 11 12:54:30 EEST 2002 parisc unknown =
unknown GNU/Linux

Most of the programs included with the Debian GNU/Linux system are
freely redistributable; the exact distribution terms for each program
are described in the individual files in /usr/share/doc/*/copyright

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
elli:~# ap-=08 =08t-get update
0% [Working]            0% [Connecting to ftp.fi.debian.org (130.230.54.99)=
] [Connecting to non-us.debia                                              =
                                  Hit http://security.debian.org stable/upd=
ates/main Packages
                                                                           =
     Hit http://security.debian.org stable/updates/main Release
                                                                           =
     Hit http://security.debian.org stable/updates/contrib Packages
                                                                           =
     Hit http://security.debian.org stable/updates/contrib Release
                                                                           =
     Hit http://security.debian.org stable/updates/non-free Packages
                                                                           =
     Hit http://security.debian.org stable/updates/non-free Release
                                                                           =
     19% [Waiting for file] [Connecting to non-us.debian.org]              =
                                          Get:1 http://ftp.fi.debian.org un=
stable/main Packages [1945kB]
                                                        0% [1 Packages 2541=
/1945kB 0%] [Connecting to non-us.debian.org]                              =
                                  1% [1 Packages 28605/1945kB 1%] [Waiting =
for file]                                                  Get:2 http://non=
-us.debian.org unstable/non-US/main Packages [34.2kB]
                                                  1% [1 Packages 28605/1945=
kB 1%] [2 Packages 1106/34.2kB 3%]                                         =
                  Get:3 http://non-us.debian.org unstable/non-US/main Relea=
se [89B]
                                                           Hit http://non-u=
s.debian.org unstable/non-US/contrib Packages
                                                           Get:4 http://non=
-us.debian.org unstable/non-US/contrib Release [92B]
                                                           Hit http://non-u=
s.debian.org unstable/non-US/non-free Packages
                                                           Get:5 http://non=
-us.debian.org unstable/non-US/non-free Release [93B]
                                                           Hit http://non-u=
s.debian.org stable/non-US/main Sources
                                                           Hit http://non-u=
s.debian.org stable/non-US/main Release
                                                           10% [1 Packages =
177749/1945kB 9%]                                 Hit http://non-us.debian.=
org stable/non-US/contrib Sources
                                 Hit http://non-us.debian.org stable/non-US=
/contrib Release
10% [1 Packages 177749/1945kB 9%]                                 11% [2 Pa=
ckages gzip 0] [1 Packages 192229/1945kB 9%] [Waiting for file]            =
                                                            Hit http://non-=
us.debian.org stable/non-US/non-free Sources
                                                                        Hit=
 http://non-us.debian.org stable/non-US/non-free Release
                                                                        12%=
 [2 Packages gzip 0] [1 Packages 205261/1945kB 10%]14% [2 Packages gzip 0] =
[1 Packages 258837/1945kB 13%]                                             =
         16% [1 Packages 296485/1945kB 15%]18% [1 Packages 337029/1945kB 17=
%]20% [1 Packages 376125/1945kB 19%]21% [1 Packages 393501/1945kB 20%]23% [=
1 Packages 434045/1945kB 22%]                                  26% [1 Packa=
ges 497757/1945kB 25%]                                  82.9kB/s 17s30% [1 =
Packages 561469/1945kB 28%]                                  82.9kB/s 16s32=
% [1 Packages 612149/1945kB 31%]                                  82.9kB/s =
16s34% [1 Packages 655589/1945kB 33%]                                  82.9=
kB/s 15s36% [1 Packages 694685/1945kB 35%]                                 =
 82.9kB/s 15s39% [1 Packages 754053/1945kB 38%]                            =
      82.9kB/s 14s42% [1 Packages 807629/1945kB 41%]                       =
           82.9kB/s 13s45% [1 Packages 872789/1945kB 44%]                  =
                82.9kB/s 12s49% [1 Packages 945189/1945kB 48%]             =
                     82.9kB/s 12s52% [1 Packages 1008901/1945kB 51%]       =
                          82.9kB/s 11s55% [1 Packages 1056685/1945kB 54%]  =
                               82.9kB/s 10s56% [1 Packages 1078405/1945kB 5=
5%]                                 82.9kB/s 10s58% [1 Packages 1123293/194=
5kB 57%]                                   104kB/s 7s60% [1 Packages 116383=
7/1945kB 59%]                                   104kB/s 7s62% [1 Packages 1=
200037/1945kB 61%]                                   104kB/s 7s64% [1 Packa=
ges 1236237/1945kB 63%]                                   104kB/s 6s67% [1 =
Packages 1295605/1945kB 66%]                                   104kB/s 6s69=
% [1 Packages 1346285/1945kB 69%]                                   104kB/s=
 5s72% [1 Packages 1394069/1945kB 71%]                                   10=
4kB/s 5s75% [1 Packages 1450541/1945kB 74%]                                =
   104kB/s 4s77% [1 Packages 1498325/1945kB 77%]                           =
        104kB/s 4s80% [1 Packages 1553349/1945kB 79%]                      =
             104kB/s 3s83% [1 Packages 1612717/1945kB 82%]                 =
                  104kB/s 3s86% [1 Packages 1670637/1945kB 85%]            =
                       104kB/s 2s88% [1 Packages 1719869/1945kB 88%]       =
                            104kB/s 2s91% [1 Packages 1769101/1945kB 90%]  =
                                99.4kB/s 1s95% [1 Packages 1853085/1945kB 9=
5%]                                  99.4kB/s 0s98% [1 Packages 1921141/194=
5kB 98%]                                  99.4kB/s 0s                      =
                                                          Get:6 http://ftp.=
fi.debian.org unstable/main Release [82B]
                                                                           =
     Hit http://ftp.fi.debian.org unstable/non-free Packages
99% [Waiting for file]                                               99.4kB=
/s 0s                                                                      =
          Get:7 http://ftp.fi.debian.org unstable/non-free Release [86B]
                                                                           =
     Get:8 http://ftp.fi.debian.org unstable/contrib Packages [47.8kB]
97% [1 Packages gzip 0] [8 Packages 5204/47.8kB 10%]                 99.4kB=
/s 0s                                                                      =
          Get:9 http://ftp.fi.debian.org unstable/contrib Release [85B]
                                                                           =
     Hit http://ftp.fi.debian.org stable/main Sources
                                                                           =
     Hit http://ftp.fi.debian.org stable/main Release
                                                                           =
     Hit http://ftp.fi.debian.org stable/non-free Sources
                                                                           =
     Hit http://ftp.fi.debian.org stable/non-free Release
                                                                           =
     Hit http://ftp.fi.debian.org stable/contrib Sources
                                                                           =
     Hit http://ftp.fi.debian.org stable/contrib Release
99% [1 Packages gzip 323584]                                         99.4kB=
/s 0s99% [1 Packages gzip 1437696]                                        9=
9.4kB/s 0s99% [1 Packages gzip 2555904]                                    =
    99.4kB/s 0s99% [1 Packages gzip 3665920]                               =
         99.4kB/s 0s99% [1 Packages gzip 4780032]                          =
              99.4kB/s 0s99% [1 Packages gzip 5861376]                     =
                   99.4kB/s 0s99% [1 Packages gzip 6918144]                =
                        99.4kB/s 0s99% [Working]                           =
                             99.4kB/s 0s99% [8 Packages gzip 0]            =
                                  99.4kB/s 0s100% [Working]                =
                                       99.4kB/s 0s                         =
                                                       Fetched 2027kB in 24=
s (83.5kB/s)
Reading Package Lists... 0%apt-get(289): unaligned access to 0x403cf08c at =
ip=3D0x4005e4f7
Reading Package=20

apt-get(289): unaligned access to 0x403cf08c at ip=3D0x4005e4f7

High Priority Machine Check (HPMC): Code=3D1 regs=3D102ea080 (Addr=3D000000=
00)
=FF


Firmware Version  38.39

Duplex Console IO Dependent Code (IODC) revision 0

---------------------------------------------------------------------------=
---
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
---------------------------------------------------------------------------=
---

  Processor   Speed            State           Coprocessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------
      0       240 MHz   Active                 Functional            2 MB
      1       240 MHz   Stopped:Deconfigured   Unknown               2 MB

  Central Bus Speed (in MHz)  :        120=20

  Model: R390/2

  Available memory (bytes)    : 1073733632=20
  Good memory required (bytes):   86876160=20

  Primary boot path:    8/4.1   (dec)  =20
  Alternate boot path:  8/4.6   (dec)  =20
  Console path:         8/16/4.0   (dec)  =20
  Keyboard path:        8/16/7.0   (dec)  =20

CPU 0
WARNING:  Memory has been initialized, but not tested as a result of
          FASTBOOT being enabled.  To test memory, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


Processor is starting autoboot process.

To discontinue, press any key within 10 seconds.

=07Boot terminated.


------- Main Menu ---------------------------------------------------------=
----

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
Main Menu: Enter command > ser pim

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp =3D   Thu Sep  12 08:48:47 GMT 2002    (20:02:09:12:08:48:47)

HPMC Chassis Codes =3D 0xcbf0  0x5002  0x7d03  0x5408  0x5508  0xcbfb =20
                    =20

General Registers 0 - 31
00-03  0000000000000000  0000000000044a20  0000000040098df3  00000000403cf0=
8c
04-07  0000000000000038  0000000040111868  00000000faf00b88  00000000faf00d=
d8
08-11  0000000000050b00  00000000faf00de0  00000000faf00dd8  00000000faf00d=
e8
12-15  0000000000050b00  00000000faf00ab0  00000000faf00948  00000000faf00a=
8c
16-19  00000000faf008c0  000000000000000f  000000000009e800  00000000401118=
68
20-23  00000000403cf098  0000000000000007  00000000403cf08c  00000000403cf0=
44
24-27  00000000faf00dd8  0000000000000038  0000000000051990  00000000000402=
20
28-31  0000000000051990  0000000000000007  00000000faf01400  00000000000282=
a3

<Press any key to continue (q to quit)>=20

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
04-07  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
08-11  000000000000022a  0000000000000000  00000000000000c0  00000000000000=
08
12-15  0000000000000000  0000000000000000  0000000000108000  00000000fd0000=
00
16-19  00000021d83d8324  0000000000000115  000000004005e4fb  0000000043ffff=
80
20-23  00000000102400db  400000004912452c  0000000000000000  00000000000000=
00
24-27  0000000000305000  0000000036d23000  00000000aaaaaaaa  00000000000003=
d0
28-31  00000000aaaaaaaa  0000000011111111  0000000046d24000  00000000103a00=
00

Space Registers 0 - 7
00-03  00000000          00000115          00000000          00000115
04-07  00000115          00000115          00000115          00000115

<Press any key to continue (q to quit)>=20

IIA Space                    =3D 0x0000000000000115
IIA Offset                   =3D 0x000000004005e4ff
Check Type                   =3D 0x20000000
CPU State                    =3D 0x9e000004
Cache Check                  =3D 0x00000000
TLB Check                    =3D 0x00000000
Bus Check                    =3D 0x00105004
Assists Check                =3D 0x00000000
Assist State                 =3D 0x00000000
Path Info                    =3D 0x00000000
System Responder Address     =3D 0x0000000000000000
System Requestor Address     =3D 0xfffffffffffa0000
Check Summary                =3D 0x80000000102846c0
Available Memory             =3D 0x0000000040000000
CPU Diagnose Register 2      =3D 0x0501000004000004
CPU Status Register 0        =3D 0x1420820000000000
CPU Status Register 1        =3D 0x8000000000000000
SADD LOG                     =3D 0x3e11b4fff1b4a0b9
Read Short LOG               =3D 0xc10200ffffd05802

<Press any key to continue (q to quit)>=20

-----------------  Processor 0 LPMC Information ------------------

Check Type                   =3D 0x00000000
IC Parity Info               =3D 0x00000000
Cache Check                  =3D 0x00000000
TLB Check                    =3D 0x00000000
Bus Check                    =3D 0x00000000
Assists Check                =3D 0x00000000
Assist State                 =3D 0x00000000
Path Info                    =3D 0x00000000
System Responder Address     =3D 0x0000000000000000
System Requestor Address     =3D 0x0000000000000000

-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
04-07  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
08-11  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
12-15  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
16-19  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
20-23  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
24-27  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
28-31  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00

<Press any key to continue (q to quit)>=20

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
04-07  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
08-11  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
12-15  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
16-19  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
20-23  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
24-27  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
28-31  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space                    =3D 0x0000000000000000
IIA Offset                   =3D 0x0000000000000000
CPU State                    =3D 0x00000000

<Press any key to continue (q to quit)>=20

-----------------  Processor 1 HPMC Information ------------------

   No valid timestamp

HPMC Chassis Codes =3D No chassis codes logged

General Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
04-07  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
08-11  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
12-15  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
16-19  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
20-23  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
24-27  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
28-31  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00

<Press any key to continue (q to quit)>=20

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
04-07  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
08-11  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
12-15  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
16-19  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
20-23  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
24-27  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
28-31  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

<Press any key to continue (q to quit)>=20

IIA Space                    =3D 0x0000000000000000
IIA Offset                   =3D 0x0000000000000000
Check Type                   =3D 0x00000000
CPU State                    =3D 0x00000000
Cache Check                  =3D 0x00000000
TLB Check                    =3D 0x00000000
Bus Check                    =3D 0x00000000
Assists Check                =3D 0x00000000
Assist State                 =3D 0x00000000
Path Info                    =3D 0x00000000
System Responder Address     =3D 0x0000000000000000
System Requestor Address     =3D 0x0000000000000000
Check Summary                =3D 0x0000000000000000
Available Memory             =3D 0x0000000000000000
CPU Diagnose Register 2      =3D 0x0000000000000000
CPU Status Register 0        =3D 0x0000000000000000
CPU Status Register 1        =3D 0x0000000000000000
SADD LOG                     =3D 0x0000000000000000
Read Short LOG               =3D 0x0000000000000000

<Press any key to continue (q to quit)>=20

-----------------  Processor 1 LPMC Information ------------------

Check Type                   =3D 0x00000000
IC Parity Info               =3D 0x00000000
Cache Check                  =3D 0x00000000
TLB Check                    =3D 0x00000000
Bus Check                    =3D 0x00000000
Assists Check                =3D 0x00000000
Assist State                 =3D 0x00000000
Path Info                    =3D 0x00000000
System Responder Address     =3D 0x0000000000000000
System Requestor Address     =3D 0x0000000000000000

-----------------  Processor 1 TOC Information -------------------

General Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
04-07  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
08-11  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
12-15  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
16-19  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
20-23  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
24-27  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
28-31  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00

<Press any key to continue (q to quit)>=20

Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
04-07  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
08-11  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
12-15  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
16-19  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
20-23  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
24-27  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00
28-31  0000000000000000  0000000000000000  0000000000000000  00000000000000=
00

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000

IIA Space                    =3D 0x0000000000000000
IIA Offset                   =3D 0x0000000000000000
CPU State                    =3D 0x00000000

<Press any key to continue (q to quit)>=20

Memory Error Log Information:

Timestamp =3D   Thu Sep  12 08:48:47 GMT 2002    (20:02:09:12:08:48:47)

                    Trans  Addr                   Central Bus
Status  Requestor     id    par  CP  AD  DV       Address/Data
------  ----------  -----  ----  --  --  --  ---------------------

 0x14   0xfffa0000   0x00   0x0   0   0   0  0x00000000 0x00000000

                                                    Memory
                                  ECC Reg     Address      Data
                                 ----------  ---------- ----------

                                 0x00000000  0x00000000 0x00000000
                                                        0x00000000
                                                        0x00000000
                                                        0x00000000
                                                        0x00000000

<Press any key to continue (q to quit)>=20

I/O Module Error Log Information:

Timestamp =3D   Thu Sep  12 08:48:49 GMT 2002    (20:02:09:12:08:48:49)

Bus    HPA       Module Type      Path  Slt Md Sev  Estat Requestor  Respon=
der
--- ---------- ---------------- -------- -- -- ---- ----- ---------- ------=
----
 0  0xfff88000 I/O Adapter      8         2  0  he   0x0d 0x00000000 0x0000=
0000
 0  0xfff8a000 I/O Adapter      10        2  2  he   0x0d 0x00000000 0x0000=
0000

<Press any key to continue (q to quit)>=20

IO Bus Converter Log
--------------------

IOA0 HPA            =3D 0xfff88000
IOA0 UBC_IO_CONTROL =3D 0x00020080
GSC1 HPA            =3D 0xf1000001
IOA0 IO_IO_LO       =3D 0xf1000000
IOA0 IO_IO_HI       =3D 0xf1800000
IOA0 IO_IO_LO_HV    =3D 0xfc000000
IOA0 IO_IO_HI_HV    =3D 0xfff80000

IOA1 HPA            =3D 0xfff8a000
IOA1 UBC_IO_CONTROL =3D 0x00020080
GSC2 HPA            =3D 0xf1800001
IOA1 IO_IO_LO       =3D 0xf1800000
IOA1 IO_IO_HI       =3D 0xf2000000
IOA1 IO_IO_LO_HV    =3D 0x00000000
IOA1 IO_IO_HI_HV    =3D 0x00000000

  NIO bus converter register data is not available.


Main Menu: Enter command >=20
Main Menu: Enter command >=20
--LZvS9be/3tNcYl/X--
