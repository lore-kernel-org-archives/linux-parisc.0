Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA07214
	for <parisc-linux@puffin.external.hp.com>; Tue, 29 Aug 2000 13:14:58 -0600
Received: from ottawa.linuxcare.com (HELO fuzzynavel.thepuffingroup.com) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 29 Aug 2000 19:15:01 -0000
Received: from linuxcare.com (IDENT:cloud@localhost.localdomain [127.0.0.1])
	by fuzzynavel.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id PAA13324
	for <parisc-linux@thepuffingroup.com>; Tue, 29 Aug 2000 15:08:24 -0400
Sender: cloud@fuzzynavel.thepuffingroup.com
Message-ID: <39AC0A27.3C31F633@linuxcare.com>
Date: Tue, 29 Aug 2000 15:08:23 -0400
From: Claudiu Carter <ccarter@linuxcare.com>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Content-Type: multipart/mixed;
 boundary="------------DD6064467AE735BB0ECF5742"
Subject: [parisc-linux] HP D270 boots ok, log inside
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------DD6064467AE735BB0ECF5742
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Tara and I have managed to boot both an R390 and D270 here's the log for
the D270.

Claudiu Carter.

--------------DD6064467AE735BB0ECF5742
Content-Type: text/plain; charset=us-ascii;
 name="D270-log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="D270-log"

Firmware Version  37.28

Duplex Console IO Dependent Code (IODC) revision 0

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------
      0       160 MHz   Active                 Functional          512 KB
      1       160 MHz   Idle                   Functional          512 KB

  Central Bus Speed (in MHz)  :        120

  Model: D270/2

  Available memory (bytes)    : 1073741824
  Good memory required (bytes):   85504000

  Primary boot path:    8/12.5   (dec)
  Alternate boot path:  8/16/5.0   (dec)
  Console path:         8/12/0.0   (dec)
  Keyboard path:        8/16/7.0   (dec)

CPU 0
WARNING:  Memory has been initialized, but not tested as a result of
          FASTBOOT being enabled.  To test memory, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


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
Main Menu: Enter command > Search

Searching for potential boot device(s)...
This may take several minutes.

To discontinue search, press any key (termination may not be immediate).


   Path Number        Device Path (dec)        Device Type
   -----------        -----------------        -----------
   P0                 8/12.5                   Random access media
   P1                 8/12.8                   Random access media
   P2                 8/16/5.2                 Random access media
   P3                 8/16/6.0                 LAN Module


Main Menu: Enter command > bo P2
Interact with IPL (Y, N, or Cancel)?> N

Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.
palo ipl bame@noam Fri Aug  4 18:36:35 MDT 2000
0/vmlinux 2349352 bytes @ 0x6f6000
0/palo-cmdline '0/vmlinux TERM=linux HOME=/ root=/dev/scd0'
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100000 first 00100000 n 4
Segment 0 load 00100000 size 1511580 mediaptr 0x1000
Segment 1 load 00272000 size 132368 mediaptr 0x173000
Segment 2 load 00294000 size 86880 mediaptr 0x194000
Segment 3 load 002ac000 size 8192 mediaptr 0x1aa000
branching to kernel entry point 0x00100000
pdc_cons registered !
The Kernel has started...
Free memory starts at: 0xc02dc000
PALO command line: 'TERM=linux HOME=/ root=/dev/scd0'
PALO initrd 0-0
FP CCR was 0x0, will be set to 0xc0
model   00005a30 00000491 00000000 00000002 775c3955 100000f0 00000008 000000b22vers    00000205
cpuid   000001c9
CPUID vers 14 rev 9
CPU(s): 1 x PA8000 at 160.000000 MHz
Searching for devices in PDC firmware... a newer box...
Found devices:
1. UL 350 Lasi Core BA (11) at 0xffd00000, versions 0x2e, 0x0, 0x81, 0x0, 0x0
2. UL 350 Lasi Core RS-232 (10) at 0xffd05000, versions 0x2e, 0x0, 0x8c, 0x0, 003. UL 350 Core SCSI (10) at 0xffd06000, versions 0x2e, 0x0, 0x82, 0x0, 0x80
4. UL 350 Core LAN (802.3) (10) at 0xffd07000, versions 0x2e, 0x0, 0x8a, 0x0, 005. UL 350 Core Centronics (10) at 0xffd02000, versions 0x2e, 0x0, 0x74, 0x0, 0x06. UL 350 Core PC Keyboard (10) at 0xffd08000, versions 0x2e, 0x0, 0x84, 0x0, 007. UL 350 Core PC Keyboard (10) at 0xffd08100, versions 0x2e, 0x0, 0x84, 0x0, 008. UL 350 Core Wax BA (11) at 0xffe00000, versions 0x30, 0x0, 0x8e, 0x0, 0x0
9. UL 350 Wax EISA BA (11) at 0xfc000000, versions 0x30, 0x0, 0x90, 0x0, 0x0
10. UL 350 Wax Core RS-232 (10) at 0xffe02000, versions 0x30, 0x0, 0x8c, 0x0, 00That's a total of 10 devices.
Linux version 2.3.99-pre8 (bame@noam) (gcc version 2.96 20000707 (experimental)0initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 32768
zone(0): 16384 pages.
zone(1): 16384 pages.
zone(2): 0 pages.
trap_init
Calibrating delay loop... 292.45 BogoMIPS
Memory: 125696k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 8192 (order: 3, 32768 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
kmem_create: Poisoning requested, but con given - bdev_cache
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
kmem_create: Poisoning requested, but con given - inode_cache
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
request_irq(258, c01ec76c, 0x0, lasi, c7ff9080)
Wax at 0xffe00000 found.
request_irq(263, c01ec76c, 0x0, wax, c7ff9140)
request_irq(797, c01ec994, 0x0, wax_hil_nmi, 00000000)
Wax: HIL Keyboard-NMI registered.
parport0: PC-style at 0xffd02800, irq 536 [PCSPP,TRISTATE]
request_irq(536, c01ecac8, 0x0, parport0, c7ffcc00)
Found i82596 at 0xffd07000, IRQ 535
early initialization of device eth0 is deferred
Initializing lasi keyboard port at 0xffd08000...
request_irq(517, c01ae2fc, 0x0, GSC PS/2, ffd08000)
Initializing lasi mouse port at 0xffd08100...
Linux NET4.0 for Linux 2.3
Based upon Swansea University Computer Society NET3.039
kmem_create: Poisoning requested, but con given - skbuff_head_cache
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 1024 buckets, 8Kbytes
TCP: Hash tables configured (established 8192 bind 8192)
Starting kswapd v1.6
pty: 256 Unix98 ptys configured
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
sim700: Couldn't get consistent shared memory
sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 534
scsi0: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: WARNING: target data areas are not dma coherent!
scsi0: test 1 completed ok.
request_irq(534, c01da868, 0x20000000, sim700, c7f8d260)
scsi0: sim700_intr_handle() called with no interrupt
scsi0 : LASI/Simple 53c700
scsi : 1 host.
  Vendor: TOSHIBA   Model: CD-ROM XM-5701TA  Rev: 1347
  Type:   CD-ROM                             ANSI SCSI revision: 02
Detected scsi CD-ROM sr0 at scsi0, channel 0, id 2, lun 0
scsi : detected 1 SCSI cdrom total.
Uniform CD-ROM driver Revision: 3.08
82596: 6 0 0 at c028cc10
82596: 6 ffd07000 217 at c7ffca00
eth0: 82596 at 0xffd07000, 08 00 09 55 5A 62 IRQ 535.
82596.c $Revision: 1.9 $
Serial driver version 4.93 (2000-03-20) with MANY_PORTS SHARE_IRQ SERIAL_PCI endFound serial #0 at 0xffd05000, IRQ 538
ttyS00 at iomem 0xffd05800 (irq = 538) is a 16550A
Found serial #1 at 0xffe02000, IRQ 793
ttyS01 at iomem 0xffe02800 (irq = 793) is a 16550A
pdc_cons die !!
kmem_create: Forcing size word alignment - nfs_fh
VFS: Disk change detected on device sr(11,0)
ISO 9660 Extensions: RRIP_1991A
VFS: Mounted root (iso9660 filesystem) readonly.
request_irq(538, c019e908, 0x4000000, serial, c02c976c)
execve /sbin/init c0272008 c0272030
Fri Aug  4 01:33:00 /home/bame/xc/hppa 2000
dd: /dev/zero: Bad address
0+0 records in
0+0 records out
mke2fs 1.19-WIP, 7-Jul-2000 for EXT2 FS 0.5b, 95/08/09
ext2fs_check_if_mount: No such file or directory while determining whether /dev.Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
1024 inodes, 4096 blocks
0 blocks (0.00%) reserved for the super user
First data block=1
1 block group
8192 blocks per group, 8192 fragments per group
1024 inodes per group

Writing inode tables: done
Writing superblocks and filesystem accounting information: done

                Welcome to PA/Linux release 0.1
            (release 0.1 means don't expect much from it!)

In addition to the bootable image, this CD contains cross compilers,
source code, and documentation.  You can initialize a bootable PA-RISC
hard disk from this CD too.  Read /README to find out more.

Since progress never stops, by the time you boot this it'll be out of
date, so check out http://www.thepuffingroup.com/parisc/ for the latest.

Login as a superuser     login: root password: root
   or as a normal user   login: demo password: demo



(none) login: root
Password:


Most of the programs included with the Debian GNU/Linux system are
freely redistributable; the exact distribution terms for each program
are described in the individual files in /usr/doc/*/copyright

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
sh: can't access tty; job control turned off
# pwd
/root
# cd /
# ls -al
total 213
dr-xr-xr-x   18 root     root         4096 Aug  4  2000 .
dr-xr-xr-x   18 root     root         4096 Aug  4  2000 ..
-r--r--r--    1 root     root         1962 Aug  4  2000 README
-r--r--r--    1 root     root         3678 Aug  4  2000 README.INSTALL
dr-xr-xr-x    2 root     root         4096 Aug  4 00:35 bin
dr-xr-xr-x    2 root     root         2048 Aug  3 19:19 boot
dr-xr-xr-x    2 root     root       163840 Aug  4  2000 dev
dr-xr-xr-x    5 root     root         4096 Aug  4  2000 etc
dr-xr-xr-x    2 root     root         2048 Jun 15 00:10 home
dr-xr-xr-x    2 root     root         2048 Aug  3 16:50 include
dr-xr-xr-x    2 root     root         2048 Jun 15 00:10 lib
dr-xr-xr-x    9 root     root         2048 Aug  5  2000 mirror
dr-xr-xr-x    2 root     root         2048 Jun 15 00:10 mnt
dr-xr-xr-x   17 root     root            0 Aug 30  2000 proc
dr-xr-xr-x    2 root     root         2048 Jun 15 00:10 root
dr-xr-xr-x    2 root     root         8192 Aug  3 23:04 sbin
dr-xr-xr-x    4 root     root         2048 Jul 31 16:27 share
drwxrwxrwx    3 root     root         1024 Aug  4 01:33 tmp
dr-xr-xr-x   15 root     root         2048 Aug  3 23:04 usr
dr-xr-xr-x   10 root     root         2048 Aug  4  2000 var
# cat /proc/cpuinfo
processor       : 0
cpu family      : PA-RISC <NULL>
cpu             : PA8000
cpu MHz         : 160.000000
model           :
model name      : UL 2w U160 512K/512K (871/D270,D370)
hversion        : 0x00005a30
sversion        : 0x00000491
I-cache         : 512 KB
D-cache         : 512 KB (WB)
ITLB entries    : 96
DTLB entries    : 96 - shared with ITLB
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (16 combined)
BTLB var-entr.  : 0 instruction, 0 data (0 combined)
bogomips        : 292.45
# shutdown now -h
Why? why not?
shutdown: halted by ghost: why not?
Couldn't umount pipe: on none: No such file or directory
Unmounting any remaining filesystems...
shutdown: Cannot open /etc/mtab.

Now you can turnSystem halted.
 off the power..gsc.c:gsc_mach cmd 2
.

--------------DD6064467AE735BB0ECF5742--
