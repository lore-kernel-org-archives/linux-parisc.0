Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id D21144838
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 May 2002 14:23:01 -0600 (MDT)
Received: from garibaldi.apptechsys.com (ats164.apptechsys.com [207.14.35.164])
	by mail.apptechsys.com (Postfix) with ESMTP id 4F3527BC47
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 May 2002 13:23:00 -0700 (PDT)
Date: Sun, 26 May 2002 13:23:00 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: <Pine.LNX.4.44.0205260013010.1491-100000@garibaldi.apptechsys.com>
Message-ID: <Pine.LNX.4.44.0205261307520.1491-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 26 May 2002, Jeremy Drake wrote:
> On Sun, 26 May 2002, Grant Grundler wrote:
> 
> > Robert Stanford wrote:
> > > Regarding the below post, have the SMP issues been worked out on 2.4.18
> > > yet? Im running 2.4.18-25 and the machine seems to lock whenever I try
> > > to use apt with an smp kernel.
> In my playing w/ a J5000, the SMP kernel locks up when loading samba.  

2.4.18-pa26 does it too. Here's the bootup sequence.  I put in the whole
thing in case anyone is interested.  If not, just skip to the bottom :)  
Next time I'll just include relevant pieces.  

What is causing that error, and why does it only happen on SMP?

Now I have to find some time to go and power-cycle that box before I can
do any more testing. :(




Firmware Version 5.0

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache 
  ---------  --------   ---------------------  -----------------  -------------
      0      440 MHz    Active                 Functional         512 kB/1 MB
      1      440 MHz    Idle                   Functional         512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:              536870912 bytes
  Good memory required:           46678016 bytes

  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  SCSI.6.0
  Console path:         GRAPHICS(7)
  Keyboard path:        USB

Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

Boot terminated.


----- Main Menu -------------------------------------------------------------

      Command                           Description
      -------                           -----------
      BOot [PRI|ALT|<path>]             Boot from specified path
      PAth [PRI|ALT|CON|KEY [<path>]]   Display or modify a path
      SEArch [DIsplay|[[IPL] [<path>]]] Search for boot devices

      COnfiguration [<command>]         Access Configuration menu/commands
      INformation [<command>]           Access Information menu/commands
      SERvice [<command>]               Access Service menu/commands

      DIsplay                           Redisplay the current menu
      HElp [<menu>|<command>]           Display help for menu or command
      RESET                             Restart the system
-----
Main Menu: Enter command > bo pri
Interact with IPL (Y, N, Q)?> y

Booting... 
Boot IO Dependent Code (IODC) revision 0


HARD Booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002
Bad DOS magic in extended partition

Partition Start(MB) End(MB) Id Type
1               1      15   f0 Palo
2              16      78   83 ext2
4              79   34514   83 ext2

PALO(F0) partition contains:
    0/vmlinux32 3366227 bytes @ 0x48000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).Current command line:
2/vmlinux root=/dev/sda4 HOME=/ console=ttyS0 TERM=vt102
 0: 2/vmlinux
 1: root=/dev/sda4
 2: HOME=/
 3: console=ttyS0
 4: TERM=vt102

Edit which field?
(or 'b' to boot with this command line)? b

Command line for kernel: 'root=/dev/sda4 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
ELF32 executable
Entry 00100298 first 00100000 n 5
Segment 0 load 00100000 size 2322260 mediaptr 0x1000
Segment 1 load 00338000 size 840924 mediaptr 0x238000
Segment 2 load 00408000 size 8192 mediaptr 0x306000
Segment 3 load 00410000 size 32768 mediaptr 0x308000
Segment 4 load 00446258 size 102480 mediaptr 0x310258
Branching to kernel entry point 0x00100298.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.18-pa26 (root@krakatoa) (gcc version 3.0.4) #1 SMP Sun May 26 00:35:59 PDT 2002
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005bd0 00000491 00000000 00000002 776c6453 100000f0 00000008 000000b2 000000b2
vers  00000201
CPUID vers 17 rev 5 (0x00000225)
capabilities 0x3
model 9000/785/J5000
Total Memory: 512 Mb
pagetable_init
On node 0 totalpages: 131072
zone(0): 131072 pages.
zone(1): 0 pages.
zone(2): 0 pages.
LCD display at f05d0008,f05d0000 registered
Kernel command line: root=/dev/sda4 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 878.18 BogoMIPS
Memory: 507900k available
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Searching for devices...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000 [10], versions 0x582, 0x0, 0xb
2. Elroy PCI Bridge (13) at 0xfed30000 [10/0], versions 0x782, 0x0, 0xa
3. Elroy PCI Bridge (13) at 0xfed32000 [10/1], versions 0x782, 0x0, 0xa
4. Elroy PCI Bridge (13) at 0xfed38000 [10/4], versions 0x782, 0x0, 0xa
5. Elroy PCI Bridge (13) at 0xfed3c000 [10/6], versions 0x782, 0x0, 0xa
6. Forte W 2-way (0) at 0xfffa0000 [32], versions 0x5bd, 0x0, 0x4
7. Forte W 2-way (0) at 0xfffa2000 [34], versions 0x5bd, 0x0, 0x4
8. Memory (1) at 0xfed10200 [49], versions 0x88, 0x0, 0x9
CPU(s): 2 x PA8500 (PCX-W) at 440.000000 MHz
SBA found Astro 2.1 at 0xfed00000
lba version TR2.1 (0x2) found at 0xfed30000
lba version TR2.1 (0x2) found at 0xfed32000
lba version TR2.1 (0x2) found at 0xfed38000
lba version TR2.1 (0x2) found at 0xfed3c000
POSIX conformance testing by UNIFIX
FP[1] enabled: Rev 1 Model 16
SMP: Total 2 of 2 processors activated (1756.36 BogoMIPS noticed).
Waiting on wait_init_idle (map = 0x2)
All processors have done init_idle
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch enabled, polling @ 0xf0400804.
SuperIO: Found NS87560 Legacy I/O device at 00:0e.1 (IRQ 64) 
SuperIO: Serial port 1 at 0x3f8
SuperIO: Serial port 2 at 0x2f8
SuperIO: Parallel port at 0x378
SuperIO: Floppy controller at 0x3f0
SuperIO: ACPI at 0x7e0
SuperIO: USB regulator enabled
parport0: PC-style at 0x378, irq 101 [PCSPP(,...)]
Starting kswapd
Journalled Block Device driver loaded
STI GSC/PCI graphics driver version 0.9
STI PCI graphic ROM found at f7000000 (128 kB), fb at fb000000 (16 MB)
STI word mode ROM at f7000044, hpa at fb000000
STI id 35acda16-9a02587, conforms to spec rev. 8.0c
STI device: HPA4982A
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
ttyS00 at port 0x03f8 (irq = 99) is a 16550A
ttyS01 at port 0x02f8 (irq = 100) is a 16550A
lp0: using parport0 (interrupt-driven).
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
NS87415: IDE controller on PCI bus 00 dev 70
NS87415: chipset revision 3
NS87415: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0x0a00-0x0a07, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0x0a08-0x0a0f, BIOS settings: hdc:pio, hdd:pio
hda: SONY CD-ROM CDU4821, ATAPI CD/DVD-ROM drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 103
hda: ATAPI 48X CD-ROM drive, 128kB Cache
Uniform CD-ROM driver Revision: 3.12
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 48 at 0x1000, 00:10:83:35:0D:63, IRQ 66.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 15, function 0
sym53c8xx: 53c896 detected 
sym53c8xx: at PCI bus 0, device 15, function 1
sym53c8xx: 53c896 detected 
sym53c896-0: rev 0x4 on pci bus 0 device 15 function 0 irq 65
sym53c896-0: ID 7, Fast-20, Parity Checking
sym53c896-0: handling phase mismatch from SCRIPTS.
sym53c896-1: rev 0x4 on pci bus 0 device 15 function 1 irq 65
sym53c896-1: ID 7, Fast-40, Parity Checking
sym53c896-1: handling phase mismatch from SCRIPTS.
scsi0 : sym53c8xx-1.7.3c-20010512
scsi1 : sym53c8xx-1.7.3c-20010512
  Vendor: SEAGATE   Model: ST336752LC        Rev: 0002
  Type:   Direct-Access                      ANSI SCSI revision: 03
Attached scsi disk sda at scsi1, channel 0, id 6, lun 0
sym53c896-1-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50.0 ns, offset 31)
SCSI device sda: 71687369 512-byte hdwr sectors (36704 MB)
Partition check:
 sda: sda1 sda2 sda3 < sda5 > sda4
sticonsole_init: searching for STI ROMs
Console: switching to colour STI console 160x64
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :  1060.000 MB/sec
   8regs_prefetch:  1060.000 MB/sec
   32regs    :   752.800 MB/sec
   32regs_prefetch:   752.800 MB/sec
raid5: using function: 8regs_prefetch (1060.000 MB/sec)
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 24Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 389k freed
INIT: version 2.84 booting
Activating swap.
Adding Swap: 497972k swap-space (priority -1)
Checking root file system...
fsck 1.27 (8-Mar-2002)
/dev/sda4: clean, 68142/4415040 files, 1437754/8815668 blocks
System time was Sun May 26 20:04:48 UTC 2002.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Sun May 26 20:04:50 UTC 2002.
Calculating module dependencies... done.
Loading modules: 
Checking all file systems...
fsck 1.27 (8-Mar-2002)
/dev/sda2: clean, 26/16064 files, 19944/64260 blocks
Setting kernel variables.
Loading the saved-state of the serial devices... 
/dev/ttyS0 at 0x03f8 (irq = 99) is a 16550A
/dev/ttyS1 at 0x02f8 (irq = 100) is a 16550A
Mounting local filesystems...
/dev/sda2 on /boot type ext2 (rw)
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: done.
Starting portmap daemon: portmap.
Starting portmapper... Mounting remote filesystems...

Setting the System Clock using the Hardware Clock as reference...
eth0: Setting full-duplex based on MII#1 link partner capability of 41e1.
System Clock set. Local time: Sun May 26 13:04:57 PDT 2002

Running ntpdate to synchronize clock.
Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting NFS common utilities: statd.
Starting mouse interface server: gpm.
Starting internet superserver: inetd.
Starting printer spooler: lpd.
Not starting NFS kernel daemon: No exports.
Starting mail transport agent: Postfix.
Starting Samba daemons: nmbd smbdsmbd(276): unaligned access to 0x4001a2b8 at ip=0x4012ea1f


-- 
He who is known as an early riser need not get up until noon.
