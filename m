Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id AA5EF482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 May 2002 11:10:35 -0600 (MDT)
To: James S <smithjames@comcast.net>
Message-ID: <1021396202.3ce144ea30690@webmail.tiscalinet.be>
Date: Tue, 14 May 2002 19:10:02 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <002501c1fb5b$48459540$02c1a8c0@james.co.uk>
In-Reply-To: <002501c1fb5b$48459540$02c1a8c0@james.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Re: tftp boot
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

Hey James,

Quoting James S <smithjames@comcast.net>:

> heres how i did it - hope this helps:-
> 
> make sure you have tftpd & bootpd installed properly
> 

Should be Ok (apt-get install bootp tftp) (Yesterday)

> make sure youre isolated from any dhcp servers there may be on your
> network

Afaik there is no other bootp server on this segment

> 
> get the mac address of the machine you want to netboot & replace the
> FFFFFFFFFF's with the address in the following
> 
> on the 712/60 the command to get the mac address was 'lana' - it may be
> different for yours

on b2000 it is in to step first info then la (Ok)

> 
> replace the ip address with the address you want the new machine to
> netboot
> with & replace the hp-ux between the brackets with the machine name
> 
> create a directory /tftpboot on your boot server & copy the relevant
> lifimage file for your machine into it - you can get this from the
> debian
> ftp site

There should be also the problem: on ftp.parisc-linux.org i do not find a
relevent lifimage (too old for a b2000) so I build it from last palo cvs sources
with default parameters for an NFSROOT = 172.16.248.169 (my bootp-tftp server)
and CMDLINE = 0/vmlinux HOME=/ TERM=linux root=/dev/nfs nfsroot=172.16.248.169
ip=bootp

But I do not find /dev/nfs  (and no way to build with MAKEDEV) on the bootp-tftp
server?

> 
> create a /usr/src/parisc directory on your boot server too

What should I have to put in this dir?

> 
> the file /etc/bootptab on your bootserver should contain
> 
> [hp-ux]
> :hd=/tftpboot:\
> :rp=/usr/src/parisc/:\
> :ht=ethernet:\
> :ha=FFFFFFFFFFFF:\
> :ip=192.168.193.83:\
> :bf=lifimage:\
> :sm=255.255.255.0:\
> :to=7200:
> 
> 
> dunno what the boot command is on your machine, but on the 712/60 from
> the
> boot console i use 'boot lan'
> 

same for b2000 afaik

> your machine should now netboot
> 

It seems start to netboot well but the failed when try to mount its nfs root fs.
Here is the full messages:

Firmware Version 4.9

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache 
  ---------  --------   ---------------------  -----------------  -------------
      0      400 MHz    Active                 Functional         512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:              268435456 bytes
  Good memory required:           23027712 bytes

  Primary boot path:    SCSI.6.0
  Alternate boot path:  SCSI.5.0
  Console path:         GRAPHICS(0)
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
Main Menu: Enter command >   bo lan 
Interact with IPL (Y, N, Q)?> y   n

Booting... 
Network Station Address 0030d3-015a3b

System IP Address 172.16.248.45
Server IP Address 172.16.248.169

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl 1.0 root@palinux Wed Apr 17 10:24:11 CEST 2002

Boot image contains:
    0/vmlinux32 4062608 bytes @ 0x8000

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).
Command line for kernel: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=172.16.248.169
ip=bootp   console=ttyS0 palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... 
This box can boot either 32 or 64-bit kernels...Only see a 32-bit kernel, using
thatELF32 executable
Entry 001001d8 first 00100000 n 4
Segment 0 load 00100000 size 2322068 mediaptr 0x1000
Segment 1 load 00338000 size 712704 mediaptr 0x238000
Segment 2 load 003e8000 size 32768 mediaptr 0x2e6000
Segment 3 load 004153a8 size 111408 mediaptr 0x2ee3a8
Branching to kernel entry point 0x001001d8.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.18-pa12-lvm-1.0.3-evms-1.0.0-jfs-1.0.17 (root@palinux) (gcc
version 3.0.4) #13 Tue May 14 15:42:21 CEST 2002
FP[0] enabled: Rev 1 Model 16
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00005d00 00000481 00000000 00000002 77e93910 100000f0 00000008 000000b2
000000b2
vers  00000301
CPUID vers 17 rev 11 (0x0000022b)
model 9000/785/B2000
Total Memory: 256 Mb
pagetable_init
On node 0 totalpages: 65536
zone(0): 65536 pages.
zone(1): 0 pages.
zone(2): 0 pages.
LCD display at f05d0008,f05d0000 registered
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=172.16.248.169
ip=bootp   console=ttyS0 palo_kernel=0/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 799.53 BogoMIPS
Memory: 254656k available
Dentry-cache hash table entries: 32768 (order: 6, 262144 bytes)
Inode-cache hash table entries: 16384 (order: 5, 131072 bytes)
Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 65536 (order: 6, 262144 bytes)
Searching for devices...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000 [10], versions 0x582, 0x0, 0xb
2. Elroy PCI Bridge (13) at 0xfed30000 [10/0], versions 0x782, 0x0, 0xa
3. Elroy PCI Bridge (13) at 0xfed32000 [10/1], versions 0x782, 0x0, 0xa
4. Kazoo W+ (0) at 0xfffa0000 [32], versions 0x5d0, 0x0, 0x4
5. Memory (1) at 0xfed10200 [49], versions 0x9d, 0x0, 0x9
CPU(s): 1 x PA8600 (PCX-W+) at 400.000000 MHz
SBA found Astro 2.1 at 0xfed00000
lba version TR4.0 (0x5) found at 0xfed30000
lba version TR4.0 (0x5) found at 0xfed32000
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Enabled soft power switch (polling mode, io=0xf0400804).
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
JFS development version: $Name: v1_0_17 $
PCI graphic ROM found at f4940000 (128 kB), fb @ fb000000 (16 MB)
STI word mode ROM at f4940044, hpa=fb000000
STI word mode ROM, id 35acda16-9a02587, conforms to spec rev. 8.0c
STI device: HPA4982A
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI
enabled
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
    ide0: BM-DMA at 0x0900-0x0907, BIOS settings: hda:pio, hdb:pio
    ide1: BM-DMA at 0x0908-0x090f, BIOS settings: hdc:pio, hdd:pio
hda: LTN485S, ATAPI CD/DVD-ROM drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 103
hda: ATAPI 48X CD-ROM drive, 120kB Cache
Uniform CD-ROM driver Revision: 3.12
loop: loaded (max 8 devices)
Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
tulip0: no phy info, aborting mtable build
tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
eth0: Digital DS21143 Tulip rev 65 at 0xf00, 00:30:D3:01:5A:3B, IRQ 66.
tulip1:  EEPROM default media type Autosense.
tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
tulip1: ***WARNING***: No MII transceiver found!
eth1: Digital DS21143 Tulip rev 65 at 0x12100, 00:30:6E:06:23:D0, IRQ 130.
SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 1, device 3, function 0
sym53c8xx: 53c875 detected 
sym53c8xx: at PCI bus 0, device 15, function 0
sym53c8xx: 53c895a detected 
sym53c875-0: rev 0x26 on pci bus 1 device 3 function 0 irq 131
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c895a-1: rev 0x1 on pci bus 0 device 15 function 0 irq 65
sym53c895a-1: ID 7, Fast-40, Parity Checking
sym53c895a-1: handling phase mismatch from SCRIPTS.
scsi0 : sym53c8xx-1.7.3c-20010512
scsi1 : sym53c8xx-1.7.3c-20010512
  Vendor: QUANTUM   Model: ATLAS5-9LVD       Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 03
  Vendor: QUANTUM   Model: ATLAS5-9LVD       Rev: HP04
  Type:   Direct-Access                      ANSI SCSI revision: 03
Attached scsi disk sda at scsi1, channel 0, id 5, lun 0
Attached scsi disk sdb at scsi1, channel 0, id 6, lun 0
sym53c895a-1-<5,*>: FAST-40 WIDE SCSI 80.0 MB/s (25.0 ns, offset 31)
SCSI device sda: 17773524 512-byte hdwr sectors (9100 MB)
Partition check:
 sda: unknown partition table
sym53c895a-1-<6,*>: FAST-40 WIDE SCSI 80.0 MB/s (25.0 ns, offset 31)
SCSI device sdb: 17773524 512-byte hdwr sectors (9100 MB)
 sdb: unknown partition table
sticonsole_init: searching for STI ROMs
Console: switching to colour STI console 160x64
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
LVM version 1.0.3(19/02/2002)
evms: md raid5: measuring checksumming speed
evms: md raid5:    8regs     :   964.400 MB/sec
evms: md raid5:    8regs_prefetch:   964.400 MB/sec
evms: md raid5:    32regs    :   684.800 MB/sec
evms: md raid5:    32regs_prefetch:   684.800 MB/sec
evms: md raid5: using function: 8regs_prefetch (964.400 MB/sec)
evms: EVMS v1.0.0 initializing .... info level(5).
evms: Exporting EVMS Volume(63,1) from "/dev/evms/sda".
evms: Exporting EVMS Volume(63,2) from "/dev/evms/sdb".
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 32768)
IP-Config: Incomplete network configuration information.
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Looking up port of RPC 100003/2 on 172.16.248.169
RPC: sendmsg returned error 229
portmap: RPC call returned error 229
Root-NFS: Unable to get nfsd port number from server, using default
Looking up port of RPC 100005/1 on 172.16.248.169
RPC: sendmsg returned error 229
portmap: RPC call returned error 229
Root-NFS: Unable to get mountd port number from server, using default
RPC: sendmsg returned error 229
mount: RPC call returned error 229
Root-NFS: Server returned error -229 while mounting /tftpboot/(none)
VFS: Unable to mount root fs via NFS, trying floppy.
request_module[block-major-2]: Root fs not mounted
VFS: Cannot open root device "nfs" or 02:00
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 02:00
 

any more idea?

thanks a lot for attention,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
