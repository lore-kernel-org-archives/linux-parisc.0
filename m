Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA04163
	for <parisc-linux@puffin.external.hp.com>; Tue, 3 Oct 2000 19:27:49 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id 60A1EAA9
	for <parisc-linux@thepuffingroup.com>; Tue,  3 Oct 2000 18:28:44 -0700 (PDT)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id SAA02862
	for parisc-linux@thepuffingroup.com; Tue, 3 Oct 2000 18:32:52 -0700 (PDT)
Date: Tue, 3 Oct 2000 18:32:52 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200010040132.SAA02862@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] c3k output
List-ID: <linux-parisc.vger.kernel.org>

I just wanted to share the c3k console output that I get so far.
I'm still using NFS root w/Serial (add-on) console.
Tomorrow I will connect some SCSI disks and try to boot/copy
to/from them.

The output from this system is interesting in that it has an 896 SCSI
card installed and it seems to work...though I don't currently have any
disks connected.

I also wanted to note that "reboot" command doesn't work.
"gsc.c: cmd 1" is printed on the console but that's it.
Doesn't do anything else.

later,
grant



Firmware Version 4.0

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache 
  ---------  --------   ---------------------  -----------------  -------------
      0      400 MHz    Active                 Functional         512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:              536870912 bytes
  Good memory required:           10223616 bytes

  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  LAN.15.8.80.76.3.254
  Console path:         GRAPHICS(2)
  Keyboard path:        USB

CPU 0
WARNING:  Processor self-tests have been disabled because FASTBOOT is
          enabled.  To enable self-tests, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
WARNING:  Memory has been initialized but not tested because FASTBOOT is
          enabled.  To test memory, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


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
Main Menu: Enter command >       
Main Menu: Enter command > bo lan
Interact with IPL (Y, N, Q)?> n

Booting... 
Network Station Address 001083-360089

System IP Address 15.8.80.77
Server IP Address 15.8.81.247

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@hpisp747 Mon Oct  2 21:38:24 PDT 2000
0/vmlinux 2057017 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa '
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 00100120 first 00100000 n 3
Segment 0 load 00100000 size 1395192 mediaptr 0x1000
Segment 1 load 00256000 size 177736 mediaptr 0x156000
Segment 2 load 00284000 size 106496 mediaptr 0x182000
branching to kernel entry point 0x00100120
Set default PSW W bit to 0
PDC Console Initialized
The Kernel has started...
Enabled FP coprocessor
Free memory starts at: 0xc02cd000
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
Linux version 2.4.0-test6 (grundler@hpisp747) (gcc version 2.96 20000925 (experimental)) #7 Tue Oct 3 17:50:26 PDT 2000
free_bootmem(0x2d1000, 0x1fd2f000)
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 131072
zone(0): 65536 pages.
zone(1): 65536 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.81.247:/tftpboot/hppa 
trap_init
Calibrating delay loop... 799.54 BogoMIPS
Memory: 511652k available
Dentry-cache hash table entries: 65536 (order: 7, 524288 bytes)
Buffer-cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 32768 (order: 6, 262144 bytes)
POSIX conformance testing by UNIFIX
lba version TR2.1 (0x2) found at 0xfed30000
lba_fixup_bus(0xdffef760) bus 0 sysdata 0xdfffa220
lba version TR2.1 (0x2) found at 0xfed32000
lba_fixup_bus(0xdffef7e0) bus 1 sysdata 0xdfffa260
lba version TR2.1 (0x2) found at 0xfed38000
lba_fixup_bus(0xdffef860) bus 2 sysdata 0xdfffa2a0
lba version TR2.1 (0x2) found at 0xfed3c000
lba: iosapic_register says not used
Warning : device (13, 0x782, 0x0, 0xa, 0x0) NOT claimed by lba TR2.1
SBA found Astro 2.1 at 0xfed00000
() ibase 0x1 imask 0xe0000000
() base_addr fed38000
() base_addr fed32000
() base_addr fed30000
() done
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
sym53c875-0: NCR clock is 40218KHz
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-0: on-chip RAM at 0xf4901000
sym53c875-0: restart (scsi reset).
sym53c875-0: Downloading SCSI SCRIPTS.
sym53c896-1: rev 0x4 on pci bus 0 device 15 function 0 irq 513
sym53c896-1: NCR clock is 40218KHz
sym53c896-1: ID 7, Fast-40, Parity Checking
sym53c896-1: on-chip RAM at 0xf4002000
sym53c896-1: suspicious SCSI data while resetting the BUS.
sym53c896-1: dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,atn,msg,c/d,i/o = 0x4000100, expecting 0x100
sym53c896-1: FATAL ERROR: CHECK SCSI BUS - CABLES, TERMINATION, DEVICE POWER etc.!
sym53c896-1: giving up ...
kernel BUG at sym53c8xx.c:719!
sym53c896-1: rev 0x4 on pci bus 0 device 15 function 1 irq 513
sym53c896-1: NCR clock is 40218KHz
sym53c896-1: ID 7, Fast-40, Parity Checking
sym53c896-1: on-chip RAM at 0xf4000000
sym53c896-1: restart (scsi reset).
sym53c896-1: handling phase mismatch from SCRIPTS.
sym53c896-1: Downloading SCSI SCRIPTS.
scsi0 : sym53c8xx - version 1.6b
scsi1 : sym53c8xx - version 1.6b
scsi : 2 hosts.
  Vendor: SEAGATE   Model: ST39102LC         Rev: HP01
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi1, channel 0, id 6, lun 0
sym53c896-1-<6,0>: tagged command queue depth set to 8
scsi : detected 1 SCSI disk total.
sym53c896-1-<6,0>: wide msgout: 1-2-3-1.
sym53c896-1-<6,0>: wide msgin: 1-2-3-1.
sym53c896-1-<6,0>: wide: wide=1 chg=0.
sym53c896-1-<6,0>: wide msgout: 1-2-3-1.
sym53c896-1-<6,0>: wide msgin: 1-2-3-1.
sym53c896-1-<6,0>: wide: wide=1 chg=0.
sym53c896-1-<6,0>: sync msgout: 1-3-1-c-1f.
sym53c896-1-<6,0>: sync msg in: 1-3-1-c-f.
sym53c896-1-<6,0>: sync: per=12 scntl3=0xb0 scntl4=0x0 ofs=15 fak=0 chg=0.
sym53c896-1-<6,*>: FAST-20 WIDE SCSI 40.0 MB/s (50 ns, offset 15)
SCSI device sda: hdwr sector= 512 bytes. Sectors= 17773524 [8678 MB] [8.7 GB]
Partition check:
 sda: unknown partition table
Serial driver version 5.01 (2000-05-29) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
: Enabling device 01:04.0 (0043 -> 0143)
ttyS00 at port 0x12200 (irq = 770) is a 16550A
Linux Tulip driver version 0.9.8 (July 13, 2000)
: Enabling device 00:0c.0 (0057 -> 0157)
eth0: Digital DS21143 Tulip rev 48 at 0x1000, 00:10:83:36:00:89, IRQ 514.
eth0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 15.8.81.247, my address is 15.8.80.77
Switching from PDC console

[ and then output comes from the add-on serial card ]
kmem_create: Forcing size word alignment - nfs_fh
Looking up port of RPC 100003/2 on 15.8.81.247
Looking up port of RPC 100005/2 on 15.8.81.247
VFS: Mounted root (nfs filesystem) readonly.
INIT: version 2.78 booting
Activating swap...
mount: directory to mount not in host:dir format
/etc/init.d/rcS: /etc/mtab: Read-only file system
Checking all file systems...
Parallelizing fsck version 1.19-WIP (7-Jul-2000)
Mounting local filesystems...
not mounted anything
Starting portmap daemon: portmapstart-stop-daemon: nothing in /proc - not mounted?
