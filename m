Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31943482A
	for <parisc-linux@parisc-linux.org>; Mon,  4 Jun 2001 13:15:24 -0600 (MDT)
Received: from localhost (djweis@localhost)
	by oliver.internal.sjdjweis.com (8.9.3/8.9.3) with ESMTP id OAA20922
	for <parisc-linux@parisc-linux.org>; Mon, 4 Jun 2001 14:16:49 -0500
Date: Mon, 4 Jun 2001 14:16:49 -0500 (CDT)
From: <djweis@sjdjweis.com>
To: parisc-linux@parisc-linux.org
Message-ID: <Pine.LNX.4.21.0106041410590.20217-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] D310 boot messages
List-ID: <linux-parisc.vger.kernel.org>

I looked through the kernel source for a while and found the pdc/iodc
console driver and changed my palo config to use ttyB and got a mostly
complete boot! Here are the boot messages:

Firmware Version  36.34

Duplex Console IO Dependent Code (IODC) revision 4

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

    Speed    Coprocessor State  Cache Size
  ---------  -----------------  ----------
   100 MHz   Functional          256 KB

  128 MB of memory configured and tested.

  Primary boot path:    4.5   (dec)   
  Alternate boot path:  16/5.2   (dec)   
  Console path:         0/0.0   (dec)   
  Keyboard path:        16/7.0   (dec)   

Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

Boot terminated.


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
Main Menu: Enter command > boot lan
Interact with IPL (Y or N)?> n

Booting... 
Network Station Address 080009-ae8800

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl 0.91 djweis@djweis.internal.sjdjweis.com Sun Jun  3 21:02:48 CDT 2001
0/vmlinux 2602334 bytes @ 0x7000
Kernel: partition 0 file /vmlinux
ELF32 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 1507276 mediaptr 0x1000
Segment 1 load 00270000 size 181552 mediaptr 0x171000
Segment 2 load 002a0000 size 221560 mediaptr 0x19e000
Segment 3 load 002d8000 size 8192 mediaptr 0x1d5000
Segment 4 load 00305e88 size 75552 mediaptr 0x1d7e88
branching to kernel entry point 0x00100000
Set default PSW W bit to 0
PDC Console Initialized
Linux version 2.4.0-pa10 (djweis@djweis.internal.sjdjweis.com) (gcc version 3.0 20010315 (prerelease)) #9 Mon Jun 4 12:50:30 CDT 2001
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: Newer Box
setup_cmdline(0x65328,0x65328,0x0,0x0)
PALO command line: 'HOME=/ TERM=linux root=/dev/nfs nfsroot=192.168.1.10 console=ttyB'
PALO initrd 0-0
model   00004840 00000481 00000000 00000000 77361cea 100000f0 00000004 00000072 00000072
vers    0000000c
CPUID   vers 0 rev 0
model   9000/811/D310
Total Memory: 128 Mb
initrd: 00000000-00000000
pagetable_init
On node 0 totalpages: 32768
zone(0): 32768 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Searching for devices...
Found devices:
1. UL 550 Lasi Core BA (11) at 0xf0100000, versions 0x2f, 0x0, 0x81, 0x0, 0x0,  additional addresses: 0xf010c000 0xf0100000 
2. UL 550 Core SCSI (10) at 0xf0106000, versions 0x2f, 0x0, 0x82, 0x0, 0x0
3. UL 350 Core LAN (802.3) (10) at 0xf0107000, versions 0x2f, 0x0, 0x8a, 0x0, 0x0
4. UL 550 Core Centronics (10) at 0xf0102000, versions 0x2f, 0x0, 0x74, 0x0, 0x0,  additional addresses: 0xf0101000 0xf0103000 
5. UL 550 Core PC Keyboard (10) at 0xf0108000, versions 0x2f, 0x0, 0x84, 0x0, 0x0
6. UL 550 Core PC Keyboard (10) at 0xf0108100, versions 0x2f, 0x0, 0x84, 0x0, 0x0
7. UL 550 Core Wax BA (11) at 0xffe00000, versions 0x31, 0x0, 0x8e, 0x0, 0x0
8. UL 550 Wax Core RS-232 (10) at 0xffe02000, versions 0x31, 0x0, 0x8c, 0x0, 0x0
9. UL 550 Wax EISA BA (11) at 0xfc000000, versions 0x31, 0x0, 0x90, 0x0, 0x0,  additional addresses: 0xf0088000 
10. Gecko BOA BC GSC+ Port (7) at 0xfff80000, versions 0x500, 0x0, 0xc, 0x0, 0x0
11. Bluefish Add-on FW-SCSI (4) at 0xfff84000, versions 0x13, 0x1, 0x89, 0x0, 0x80
12. Unknown device (0) at 0xfffbe000, versions 0x484, 0x0, 0x4, 0x0, 0x81
13. UL Proc L 100 (1) at 0xfffbf000, versions 0x57, 0x0, 0x9, 0x0, 0x0
That's a total of 13 devices.
CPU(s): 1 x PA7100LC (PCX-L) at 100.000000 MHz
Kernel command line: HOME=/ TERM=linux root=/dev/nfs nfsroot=192.168.1.10 console=ttyB
Calibrating delay loop... 99.73 BogoMIPS
Memory: 126668k available
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xf0100000 found.
LED display at f010c000 registered
Wax at 0xffe00000 found.
Wax: HIL Keyboard-NMI registered.
Wax EISA bus adapter version 0x5761 at 0xffe00000
Initializing Lasi PS/2-keyboard port at 0xf0108000...
Support for Lasi PS/2-psaux not yet available !
Found i82596 at 0xf0107000, IRQ 87
early initialization of device eth0 is deferred
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
pty: 256 U<4>Lasi PS/2 transmit buffer timeout
Lasi PS/2 transmit buffer timeout
/2 transmit buffer timlp: driver loaded but no devices found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
eth0: 82596 at 0xf0107000, 08 00 09 AE 88 00 IRQ 87.
82596.c $Revision: 1.18 $
Serial driver version 5.02 (2000-08-09) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled
Testing ttyS0 (0x0000, 0xffe02800)...
ttyS00 at iomem 0xffe02800 (irq = 121) is a 16550A
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xf0102800, irq 88 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c710 (SCSI-ID 7) at f0106100, IRQ 86, options 0
scsi0: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: Good, target data areas are dma coherent
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: HP        Model: C1537A            Rev: HP02
  Type:   Sequential-Access                  ANSI SCSI revision: 02
  Vendor: TOSHIBA   Model: CD-ROM XM-5401TA  Rev: 1036
  Type:   CD-ROM                             ANSI SCSI revision: 02
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
ncr53c720-0: restart (scsi reset).
scsi1 : ncr53c8xx - version 3.3b
  Vendor: SEAGATE   Model: ST32550W          Rev: HP10
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP11
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST32550W          Rev: HP10
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34371W          Rev: HPM2
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: SEAGATE   Model: ST34573WC         Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 02
ncr53c720-0-<5,0>: tagged command queue depth set to 8
ncr53c720-0-<8,0>: tagged command queue depth set to 8
ncr53c720-0-<9,0>: tagged command queue depth set to 8
ncr53c720-0-<10,0>: tagged command queue depth set to 8
ncr53c720-0-<11,0>: tagged command queue depth set to 8
Detected scsi tape st0 at scsi0, channel 0, id 0, lun 0
st: bufsize 32768, wrt 30720, max init. buffers 4, s/g segs 16.
Detected scsi disk sda at scsi1, channel 0, id 5, lun 0
Detected scsi disk sdb at scsi1, channel 0, id 8, lun 0
Detected scsi disk sdc at scsi1, channel 0, id 9, lun 0
Detected scsi disk sdd at scsi1, channel 0, id 10, lun 0
Detected scsi disk sde at scsi1, channel 0, id 11, lun 0
ncr53c720-0-<5,0>: wide msgout: 1-2-3-1.
ncr53c720-0-<5,0>: wide msgin: 1-2-3-1.
ncr53c720-0-<5,0>: wide: wide=1 chg=0.
ncr53c720-0-<5,0>: sync_msgout: 1-3-1-19-8.
ncr53c720-0-<5,0>: sync msgin: 1-3-1-19-8.
ncr53c720-0-<5,0>: sync: per=25 scntl3=0x10 ofs=8 fak=0 chg=0.
ncr53c720-0-<5,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sda: 4165272 512-byte hdwr sectors (2133 MB)
Partition check:
 sda: unknown partition table
ncr53c720-0-<8,0>: wide msgout: 1-2-3-1.
ncr53c720-0-<8,0>: wide msgin: 1-2-3-1.
ncr53c720-0-<8,0>: wide: wide=1 chg=0.
ncr53c720-0-<8,0>: sync_msgout: 1-3-1-19-8.
ncr53c720-0-<8,0>: sync msgin: 1-3-1-19-8.
ncr53c720-0-<8,0>: sync: per=25 scntl3=0x10 ofs=8 fak=0 chg=0.
ncr53c720-0-<8,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdb: 8388314 512-byte hdwr sectors (4295 MB)
 sdb: unknown partition table
ncr53c720-0-<9,0>: wide msgout: 1-2-3-1.
ncr53c720-0-<9,0>: wide msgin: 1-2-3-1.
ncr53c720-0-<9,0>: wide: wide=1 chg=0.
ncr53c720-0-<9,0>: sync_msgout: 1-3-1-19-8.
ncr53c720-0-<9,0>: sync msgin: 1-3-1-19-8.
ncr53c720-0-<9,0>: sync: per=25 scntl3=0x10 ofs=8 fak=0 chg=0.
ncr53c720-0-<9,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdc: 4165272 512-byte hdwr sectors (2133 MB)
 sdc: unknown partition table
ncr53c720-0-<10,0>: wide msgout: 1-2-3-1.
ncr53c720-0-<10,0>: wide msgin: 1-2-3-1.
ncr53c720-0-<10,0>: wide: wide=1 chg=0.
ncr53c720-0-<10,0>: sync_msgout: 1-3-1-19-8.
ncr53c720-0-<10,0>: sync msgin: 1-3-1-19-8.
ncr53c720-0-<10,0>: sync: per=25 scntl3=0x10 ofs=8 fak=0 chg=0.
ncr53c720-0-<10,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sdd: 8388314 512-byte hdwr sectors (4295 MB)
 sdd: unknown partition table
ncr53c720-0-<11,0>: wide msgout: 1-2-3-1.
ncr53c720-0-<11,0>: wide msgin: 1-2-3-1.
ncr53c720-0-<11,0>: wide: wide=1 chg=0.
ncr53c720-0-<11,0>: sync_msgout: 1-3-1-19-8.
ncr53c720-0-<11,0>: sync msgin: 1-3-1-19-8.
ncr53c720-0-<11,0>: sync: per=25 scntl3=0x10 ofs=8 fak=0 chg=0.
ncr53c720-0-<11,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
SCSI device sde: 8388314 512-byte hdwr sectors (4295 MB)
 sde: unknown partition table
Detected scsi CD-ROM sr0 at scsi0, channel 0, id 2, lun 0
Uniform CD-ROM driver Revision: 3.12
linear personality registered
raid0 personality registered
raid1 personality registered
raid5 personality registered
raid5: measuring checksumming speed
   8regs     :    75.819 MB/sec
   8regs_prefetch:    75.819 MB/sec
   32regs    :    88.392 MB/sec
   32regs_prefetch:    88.392 MB/sec
raid5: using function: 32regs_prefetch (88.392 MB/sec)
md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md.c: sizeof(mdp_super_t) = 4096
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
eth0: link ok.
Sending BOOTP requests.... OK
IP-Config: Got BOOTP answer from 192.168.1.10, my address is 192.168.1.25
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Looking up port of RPC 100003/2 on 192.168.1.10
Looking up port of RPC 100005/2 on 192.168.1.10
VFS: Mounted root (nfs filesystem) readonly.
Warning: unable to open an initial console.

So now, what major and minor should /dev/ttyB have to
function? /dev/console is 5 1 on my nfsroot.

Good job getting it to work this well, especially since it's listed as
untested! Also, the LCD on the front doesn't seem to do anything. What
needs to happen for that to work?

dave


-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison
