Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.istop.com (cpu1693.adsl.bellglobal.com [206.47.27.174])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4096A487D
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Mar 2002 10:52:57 -0700 (MST)
Message-Id: <5.1.0.14.0.20020307125054.026b3d40@mail.magma.ca>
Date: Thu, 07 Mar 2002 12:52:46 -0500
To: Grant Grundler <grundler@dsl2.external.hp.com>
From: Herb Radford <herbr@magma.ca>
Subject: Re: [parisc-linux] J3515 10/100 NIC 
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020307171602.A6EF9487B@dsl2.external.hp.com>
References: <Message from Herb Radford <herbr@magma.ca>
 <5.1.0.14.0.20020307110937.026af020@mail.magma.ca>
 <5.1.0.14.0.20020307110937.026af020@mail.magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 10:16 AM 3/7/02 -0700, Grant Grundler wrote:
>Herb Radford wrote:
> > However nothing else happens. Is this supported? Do I have to reconfigure
> > the kernel somehow?
>
>Can you post full boot output? and "ifconfig -a" output?

Well, Grant, that doesn't show much. But here it is:







Firmware Version  38.40



Duplex Console IO Dependent Code (IODC) revision 0



------------------------------------------------------------------------------

    (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved

------------------------------------------------------------------------------



   Processor   Speed            State           Coprocessor State  Cache Size

   ---------  --------   ---------------------  -----------------  ----------

       0       160 MHz   Active                 Functional          512 KB



   Central Bus Speed (in MHz)  :        120



   Model: D370/1



   Available memory (bytes)    :  536870912

   Good memory required (bytes):   43753472



   Primary boot path:    8/4.4   (dec)

   Alternate boot path:  8/16/5.0   (dec)

   Console path:         8/20/1.0   (dec)

   Keyboard path:        8/16/7.0   (dec)



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

Main Menu: Enter command > bo pri

Interact with IPL (Y, N, or Cancel)?> n



Booting...

Boot IO Dependent Code (IODC) revision 152





HARD Booted.

palo ipl 0.97 root@c3k Tue Nov 27 14:51:48 MST 2001



Partition Start(MB) End(MB) Id Type


1               1      23   f0 Palo


2              24     511   82 swap


3             512     999   83 ext2


4            1000    2032   83 ext2




PALO(F0) partition contains:

     0/vmlinux32 3122078 bytes @ 0x48000



Information: No console specified on kernel command line. This is normal.

PALO will choose the console currently  used by firmware (serial).

Command line for kernel: 'root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102'

Selected kernel: /boot/vmlinux from partition 3

ELF32 executable

Entry 00100168 first 00100000 n 6

Segment 0 load 00100000 size 1747032 mediaptr 0x1000

Segment 1 load 002ac000 size 283128 mediaptr 0x1ac000

Segment 2 load 002f4000 size 393476 mediaptr 0x1f2000

Segment 3 load 00358000 size 8192 mediaptr 0x253000

Segment 4 load 00360000 size 32768 mediaptr 0x255000

Segment 5 load 0039f014 size 91456 mediaptr 0x25d014

Branching to kernel entry point 0x00100168.  If this is the last

message you see, you may need to switch your console.  This is

a common symptom -- search the FAQ and mailing list at parisc-linux.org



Linux version 2.4.16-pa29 (bame@dsl2) (gcc version 3.0.2 (Debian)) #1 Sat 
Dec 29 11:32:07 MST 2001

FP[0] enabled: Rev 0 Model 14

The 32-bit Kernel has started...

Determining PDC firmware type: System Map.

model 00005a20 00000481 00000000 00000002 7817542d 100000f0 00000008 
000000b2 000000b2

vers  00000301

CPUID vers 14 rev 11 (0x000001cb)

model 9000/861/D370

Total Memory: 512 Mb

pagetable_init

On node 0 totalpages: 131072

zone(0): 131072 pages.

zone(1): 0 pages.

zone(2): 0 pages.

Kernel command line: root=/dev/sda3 HOME=/ console=ttyS0 TERM=vt102

Console: colour dummy device 160x64

Calibrating delay loop... 319.48 BogoMIPS

Memory: 513196k available

Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)

Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)

Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)

Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)

Page-cache hash table entries: 131072 (order: 7, 524288 bytes)

Searching for devices...

Found devices:

1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf, 0xb

2. Bluefish Add-on FW-SCSI (4) at 0xf1004000 [8/4], versions 0x13, 0x1, 0x89

3. HP HSC-PCI Cards (4) at 0xf1008000 [8/8], versions 0x4, 0x0, 0x9d

4. UL 550 Lasi Core BA (11) at 0xffd00000 [8/16], versions 0x2f, 0x0, 
0x81,  additional addresses: 0xffc00000

5. UL 550 Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x2f, 0x0, 
0x74,  additional addresses: 0xffd03000

6. UL 550 Lasi Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x2f, 0x0, 
0x8c

7. UL 550 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x2f, 0x0, 0x82

8. UL 350 Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions 0x2f, 0x0, 
0x8a

9. UL 550 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions 0x2f, 0x0, 0x84

10. UL 550 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions 0x2f, 0x0, 0x84

11. UL 550 Core Wax BA (11) at 0xffe00000 [8/20], versions 0x31, 0x0, 0x8e

12. UL 550 Wax Core RS-232 (10) at 0xffe02000 [8/20/2], versions 0x31, 0x0, 
0x8c

13. UL 550 Wax EISA BA (11) at 0xfc000000 [8/20/5], versions 0x31, 0x0, 0x90

14. U2-IOA BC GSC+ Port (7) at 0xf103f000 [8/63], versions 0x501, 0x1, 0xc

15. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf, 0xb

16. U2-IOA BC GSC+ Port (7) at 0xf183f000 [10/63], versions 0x501, 0x1, 0xc

17. UL 1w U160 512K/512K (861/D270,D370) (0) at 0xfffa0000 [32], versions 
0x5a2, 0x0, 0x4

18. UL 1 way U160 512K/512K memory (1) at 0xfffb1000 [49], versions 0x76, 
0x0, 0x9

CPU(s): 1 x PA8000 (PCX-U) at 160.000000 MHz

ccio found U2 at 0xfff88000

ccio found U2 at 0xfff8a000

ccio-dma.c: failed to claim CCIO bus address space!

Lasi version 0 at 0xffd00000 found.

LED display at ffd0c000 registered

Wax at 0xffe00000 found.

Wax: HIL Keyboard-NMI registered.

Wax EISA Adapter found at 0xfc000000

EISA: failed to claim EISA Bus address space!

Warning : device (11, 0x31, 0x0, 0x90) NOT claimed by EISA Bus Adapter

Dino version 3.x (card mode) found at 0xf1008000

Dino: Failed to allocate memory region

POSIX conformance testing by UNIFIX

Linux NET4.0 for Linux 2.4

Based upon Swansea University Computer Society NET3.039

Enabled soft power switch (polling mode, io=0xf0140000).

Starting kswapd

parport_init_chip: initialize bidirectional-mode.

parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]

pty: 256 Unix98 ptys configured

Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ 
SERIAL_PCI enabled

ttyS00 at iomem 0xffd05800 (irq = 90) is a 16550A

ttyS01 at iomem 0xffe02800 (irq = 121) is a 16550A

PS/2 keyboard port at 0xffd08000 (irq 69) found, no device attached.

PS/2 psaux port at 0xffd08100 (irq 69) found, no device attached.

lp0: using parport0 (interrupt-driven).

Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)

block: 128 slots per queue, batch=32

RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize

loop: loaded (max 8 devices)

Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)

PCI: Unable to reserve I/O region #1:80@f364d800 for device 00:01.0

Trying to free nonexistent resource <f364d800-f364d87f>

Trying to free nonexistent resource <43695000-4369507f>

Found i82596 at 0xffd07000, IRQ 87

eth0: 82596 at 0xffd07000, 08 00 09 D2 0C 1E IRQ 87.

82596.c $Revision: 1.27 $

SCSI subsystem driver Revision: 1.00

zalon_scsi_callback: Zalon vers field is 0x1, IRQ 35

ncr53c8xx: 53c720 detected

ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential

scsi0 : ncr53c8xx-3.4.3b-20010512

   Vendor: SEAGATE   Model: ST32171W          Rev: HPC1

   Type:   Direct-Access                      ANSI SCSI revision: 02

   Vendor: SEAGATE   Model: ST32171W          Rev: HPC1

   Type:   Direct-Access                      ANSI SCSI revision: 02

   Vendor: SEAGATE   Model: ST32171W          Rev: HPC1

   Type:   Direct-Access                      ANSI SCSI revision: 02

   Vendor: SEAGATE   Model: ST34572WC         Rev: HP03

   Type:   Direct-Access                      ANSI SCSI revision: 02

   Vendor: SEAGATE   Model: ST34572WC         Rev: HP03

   Type:   Direct-Access                      ANSI SCSI revision: 02

53c700: Version 2.6 By James.Bottomley@HansenPartnership.com

scsi1: 53c710 rev 2

scsi1 : LASI SCSI 53c700

scsi1: (2:0) Synchronous at offset 8, period 100ns

   Vendor: TOSHIBA   Model: CD-ROM XM-5701TA  Rev: 1557

   Type:   CD-ROM                             ANSI SCSI revision: 02

Attached scsi disk sda at scsi0, channel 0, id 4, lun 0

Attached scsi disk sdb at scsi0, channel 0, id 8, lun 0

Attached scsi disk sdc at scsi0, channel 0, id 9, lun 0

Attached scsi disk sdd at scsi0, channel 0, id 10, lun 0

Attached scsi disk sde at scsi0, channel 0, id 11, lun 0

ncr53c720-0-<4,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)

SCSI device sda: 4165272 512-byte hdwr sectors (2133 MB)

Partition check:

  sda: sda1 sda2 sda3 sda4

ncr53c720-0-<8,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)

SCSI device sdb: 4165272 512-byte hdwr sectors (2133 MB)

  sdb: sdb1

ncr53c720-0-<9,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)

SCSI device sdc: 4165272 512-byte hdwr sectors (2133 MB)

  sdc: unknown partition table

ncr53c720-0-<10,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)

SCSI device sdd: 8388314 512-byte hdwr sectors (4295 MB)

  sdd: unknown partition table

ncr53c720-0-<11,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)

SCSI device sde: 8388314 512-byte hdwr sectors (4295 MB)

  sde: unknown partition table

Attached scsi CD-ROM sr0 at scsi1, channel 0, id 2, lun 0

sr0: scsi-1 drive

Uniform CD-ROM driver Revision: 3.12

sticonsole_init: searching for STI ROMs

BUG: Skipping previously registered driver: sti (native)

md: linear personality registered as nr 1

md: raid0 personality registered as nr 2

md: raid1 personality registered as nr 3

md: raid5 personality registered as nr 4

raid5: measuring checksumming speed

    8regs     :   350.800 MB/sec

    8regs_prefetch:   350.800 MB/sec

    32regs    :   272.400 MB/sec

    32regs_prefetch:   272.400 MB/sec

raid5: using function: 8regs_prefetch (350.800 MB/sec)

md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27

md: Autodetecting RAID arrays.

md: autorun ...

md: ... autorun DONE.

NET4: Linux TCP/IP 1.0 for NET4.0

IP Protocols: ICMP, UDP, TCP, IGMP

IP: routing cache hash table of 4096 buckets, 32Kbytes

TCP: Hash tables configured (established 32768 bind 65536)

NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.

VFS: Mounted root (ext2 filesystem) readonly.

NOT FREEING INITMEM


INIT: version 2.84 booting


Activating swap.

Adding Swap: 499216k swap-space (priority -1)

Checking root file system...

fsck 1.25 (20-Sep-2001)

/dev/sda3: clean, 3091/124928 files, 71844/499224 blocks

System time was Thu Mar  7 17:51:14 UTC 2002.

Setting the System Clock using the Hardware Clock as reference...

System Clock set. System local time is now Thu Mar  7 17:51:09 UTC 2002.

Checking all file systems...

fsck 1.25 (20-Sep-2001)

/dev/sdb1: clean, 17/260096 files, 149034/520187 blocks

/dev/sda4: clean, 10119/132480 files, 33296/264445 blocks

Setting kernel variables.

Loading the saved-state of the serial devices...

Cannot set serial info: Address already in use

/dev/ttyS0 at 0x0000 (irq = 90) is a 16550A

Cannot set serial info: Address already in use

/dev/ttyS1 at 0x0000 (irq = 121) is a 16550A

Mounting local filesystems...

/dev/sda4 on /usr type ext2 (rw)

/dev/sdb1 on /users type ext2 (rw)

Running 0dns-down to make sure resolv.conf is ok...done.

Cleaning: /etc/network/ifstate.

Setting up IP spoofing protection: rp_filter.

Configuring network interfaces: eth0: Transceiver problem.

done.

Starting portmap daemon: portmap.



Setting the System Clock using the Hardware Clock as reference...

System Clock set. Local time: Thu Mar  7 12:51:19 EST 2002



Cleaning: /tmp /var/lock /var/run.

Initializing random number generator... done.

Recovering nvi editor sessions... done.


INIT: Entering runlevel: 2


Starting system log daemon: syslogd.

Starting kernel log daemon: klogd.

Starting NFS common utilities: statd lockd.

Starting mouse interface server: gpm.

Starting internet superserver: inetd.

Starting printer spooler: lpd.

Not starting NFS kernel daemon: No exports.

Starting Samba daemons: nmbd smbd.

Starting deferred execution scheduler: atd.

Starting periodic command scheduler: cron.



Debian GNU/Linux 3.0 HP-D370 ttyS0



HP-D370 login: root

Password:

Last login: Thu Mar  7 10:28:13 2002 on ttyS0

Linux HP-D370 2.4.16-pa29 #1 Sat Dec 29 11:32:07 MST 2001 parisc unknown



Most of the programs included with the Debian GNU/Linux system are

freely redistributable; the exact distribution terms for each program

are described in the individual files in /usr/share/doc/*/copyright



Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent

permitted by applicable law.

HP-D370:~# ifconfig -a

eth0      Link encap:Ethernet  HWaddr 08:00:09:D2:0C:1E

           inet addr:192.168.42.20  Bcast:192.168.42.255  Mask:255.255.255.0

           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1

           RX packets:0 errors:0 dropped:0 overruns:0 frame:0

           TX packets:21 errors:21 dropped:0 overruns:0 carrier:42

           collisions:0 txqueuelen:100

           RX bytes:0 (0.0 b)  TX bytes:2455 (2.3 KiB)

           Interrupt:87 Base address:0x7000 Memory:100c4000-0



lo        Link encap:Local Loopback

           inet addr:127.0.0.1  Mask:255.0.0.0

           UP LOOPBACK RUNNING  MTU:16436  Metric:1

           RX packets:8 errors:0 dropped:0 overruns:0 frame:0

           TX packets:8 errors:0 dropped:0 overruns:0 carrier:0

           collisions:0 txqueuelen:0

           RX bytes:560 (560.0 b)  TX bytes:560 (560.0 b)



HP-D370:~#
