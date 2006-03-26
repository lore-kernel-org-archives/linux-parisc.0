From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: linux-2.6 deller (ioremap-changes)
Date: Sat, 25 Mar 2006 20:45:58 -0500 (EST)
Message-ID: <200603260145.k2Q1jwSr012419@hiauly1.hia.nrc.ca>
References: <200603230746.37433.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: deller@gmx.de (Helge Deller)
Return-Path: <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <200603230746.37433.deller@gmx.de> from "Helge Deller" at Mar 23, 2006 07:46:37 am
List-ID: <linux-parisc.vger.kernel.org>

> But I did booted yesterday the latest CVS 32bit Kernel on my c3k and it worked fine, so I assume you shouldn't see any problems either...

I tried the default 2.6.16-pa5 from www.parisc-linux.org this afternoon.
I still get a lot of ip_tables messages on the console which unfortunately
aren't captured in any log file.  I've attached the diff between 2.6.15-rc7-pa
and 2.6.16-pa5 dmesg files.  Is the eth0 difference significant?  There's
also a segv in dirmngr that occurs late in both boots.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--- dmesg	2006-03-25 18:14:38.000000000 -0500
+++ dmesg.0	2006-03-25 18:06:12.000000000 -0500
@@ -1,4 +1,4 @@
-Linux version 2.6.15-rc7-pa1 (bame@palinux) (gcc version 3.3.5 (Debian 1:3.3.5-13)) #1 Mon Jan 2 15:10:49 MST 2006
+Linux version 2.6.16-pa5 (bame@palinux) (gcc version 3.3.5 (Debian 1:3.3.5-13)) #1 Thu Mar 23 20:32:12 MST 2006
 FP[0] enabled: Rev 1 Model 19
 The 32-bit Kernel has started...
 Initialized PDC Console for debugging.
@@ -16,7 +16,7 @@
   HighMem zone: 0 pages, LIFO batch:0
 LCD display at f05d0008,f05d0000 registered
 Built 1 zonelists
-Kernel command line: HOME=/ TERM=linux root=/dev/sdb3 console=tty0 sti=10/4/3/0 sti_font=VGA8x16 panic=180 palo_kernel=3/boot/vmlinux
+Kernel command line: HOME=/ TERM=linux root=/dev/sdb3 console=tty0 sti=10/4/3/0 sti_font=VGA8x16 panic=180 palo_kernel=3/boot/vmlinux-2.6.16-pa5-c3000_defconfig
 PID hash table entries: 4096 (order: 12, 65536 bytes)
 Console: colour dummy device 160x64
 Dentry cache hash table entries: 262144 (order: 8, 1048576 bytes)
@@ -35,8 +35,8 @@
 6. Allegro W2 at 0xfffa0000 [32] { 0, 0x0, 0x5dc, 0x00004 }
 7. Memory at 0xfed10200 [49] { 1, 0x0, 0x09c, 0x00009 }
 CPU(s): 1 x PA8700 (PCX-W2) at 875.000000 MHz
-Whole cache flush 1029084 cycles, flushing 4478280 bytes 1046986 cycles
-Setting cache flush threshold to 40 (1 CPUs online)
+Whole cache flush 1257772 cycles, flushing 4495684 bytes 1053408 cycles
+Setting cache flush threshold to 900 (1 CPUs online)
 SBA found Astro 2.1 at 0xfed00000
 LBA version TR4.0 (0x5) found at 0xfed30000
 PCI: Enabled native mode for NS87415 (pif=0x8f)
@@ -48,11 +48,11 @@
 SCSI subsystem initialized
 usbcore: registered new driver usbfs
 usbcore: registered new driver hub
-unwind_init: start = 0x104064d0, end = 0x10434c00, entries = 11891
+unwind_init: start = 0x1040a400, end = 0x10439f10, entries = 12209
 Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
 Initializing Cryptographic API
 io scheduler noop registered
-io scheduler anticipatory registered
+io scheduler anticipatory registered (default)
 io scheduler deadline registered
 io scheduler cfq registered
 SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 19) 
@@ -62,7 +62,7 @@
 SuperIO: Floppy controller at 0x3f0
 SuperIO: ACPI at 0x7e0
 SuperIO: USB regulator enabled
-PDC Stable Storage facility v0.10
+PDC Stable Storage facility v0.22
 Soft power switch enabled, polling @ 0xf0400804.
 STI GSC/PCI core graphics driver Version 0.9a
 STI PCI graphic ROM found at f6000000 (64 kB), fb at f8000000 (32 MB)
@@ -77,21 +77,21 @@
 fb0: stifb 1280x1024-8 frame buffer device, PCI_GRAFFITIX1280, id: 2d08c0a7, mmio: 0xf8100000
 stifb: 'A1262A' (id: 0x35acda30) not supported.
 Generic RTC Driver v1.07
-Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
+Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
 serial8250: ttyS0 at I/O 0x3f8 (irq = 3) is a 16550A
 serial8250: ttyS1 at I/O 0x2f8 (irq = 4) is a 16550A
 loop: loaded (max 8 devices)
 Linux Tulip driver version 1.1.13 (December 15, 2004)
 tulip0: no phy info, aborting mtable build
 tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
-eth0: Digital DS21142/DS21143 Tulip rev 65 at f4008000, 00:30:6E:48:AC:EA, IRQ 17.
+eth0: Digital DS21142/DS21143 Tulip rev 65 at 0001e000, 00:30:6E:48:AC:EA, IRQ 17.
 tulip1:  EEPROM default media type Autosense.
 tulip1:  Index #0 - Media MII (#11) described by a 21142 MII PHY (3) block.
 tulip1:  Index #1 - Media 10base2 (#1) described by a 21142 Serial PHY (2) block.
 tulip1:  Index #2 - Media AUI (#2) described by a 21142 Serial PHY (2) block.
 tulip1:  MII transceiver #1 config 3100 status 7849 advertising 0101.
 tulip1:  Advertising 01e1 on PHY 1, previously advertising 0101.
-eth1: Digital DS21142/DS21143 Tulip rev 33 at f4800000, 00:60:B0:7A:02:FD, IRQ 21.
+eth1: Digital DS21142/DS21143 Tulip rev 33 at 00032000, 00:60:B0:7A:02:FD, IRQ 21.
 Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
 ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
 NS87415: IDE controller at PCI slot 0000:00:0e.0
@@ -117,8 +117,8 @@
   Type:   Direct-Access                      ANSI SCSI revision: 03
  target1:0:5: tagged command queuing enabled, command queue depth 16.
  target1:0:5: Beginning Domain Validation
- target1:0:5: asynchronous.
- target1:0:5: wide asynchronous.
+ target1:0:5: asynchronous
+ target1:0:5: wide asynchronous
  target1:0:5: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
  target1:0:5: Domain Validation skipping write tests
  target1:0:5: Ending Domain Validation
@@ -126,22 +126,30 @@
   Type:   Direct-Access                      ANSI SCSI revision: 02
  target1:0:6: tagged command queuing enabled, command queue depth 16.
  target1:0:6: Beginning Domain Validation
- target1:0:6: asynchronous.
- target1:0:6: wide asynchronous.
+ target1:0:6: asynchronous
+ target1:0:6: wide asynchronous
  target1:0:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)
  target1:0:6: Domain Validation skipping write tests
  target1:0:6: Ending Domain Validation
 st: Version 20050830, fixed bufsize 32768, s/g segs 256
 SCSI device sda: 71132960 512-byte hdwr sectors (36420 MB)
-SCSI device sda: drive cache: write through
+sda: Write Protect is off
+sda: Mode Sense: d3 00 10 08
+SCSI device sda: drive cache: write through w/ FUA
 SCSI device sda: 71132960 512-byte hdwr sectors (36420 MB)
-SCSI device sda: drive cache: write through
+sda: Write Protect is off
+sda: Mode Sense: d3 00 10 08
+SCSI device sda: drive cache: write through w/ FUA
  sda: sda1 sda2 sda3 sda4 < sda5 sda6 >
 sd 1:0:5:0: Attached scsi disk sda
 SCSI device sdb: 143374738 512-byte hdwr sectors (73408 MB)
-SCSI device sdb: drive cache: write through
+sdb: Write Protect is off
+sdb: Mode Sense: a3 00 10 08
+SCSI device sdb: drive cache: write through w/ FUA
 SCSI device sdb: 143374738 512-byte hdwr sectors (73408 MB)
-SCSI device sdb: drive cache: write through
+sdb: Write Protect is off
+sdb: Mode Sense: a3 00 10 08
+SCSI device sdb: drive cache: write through w/ FUA
  sdb: sdb1 sdb2 sdb3 sdb4 < sdb5 sdb6 >
 sd 1:0:6:0: Attached scsi disk sdb
 sd 1:0:5:0: Attached scsi generic sg0 type 0
@@ -172,11 +180,13 @@
 usb usb1: default language 0x0409
 usb usb1: new device strings: Mfr=3, Product=2, SerialNumber=1
 usb usb1: Product: OHCI Host Controller
-usb usb1: Manufacturer: Linux 2.6.15-rc7-pa1 ohci_hcd
+usb usb1: Manufacturer: Linux 2.6.16-pa5 ohci_hcd
 usb usb1: SerialNumber: 0000:00:0e.2
-usb usb1: hotplug
+usb usb1: uevent
+usb usb1: device is self-powered
+usb usb1: configuration #1 chosen from 1 choice
 usb usb1: adding 1-0:1.0 (config #1, interface 0)
-usb 1-0:1.0: hotplug
+usb 1-0:1.0: uevent
 hub 1-0:1.0: usb_probe_interface
 hub 1-0:1.0: usb_probe_interface - got id
 hub 1-0:1.0: USB hub found
@@ -187,7 +197,7 @@
 hub 1-0:1.0: power on to power good time: 0ms
 hub 1-0:1.0: local power source is good
 hub 1-0:1.0: enabling power on all ports
-hub 1-0:1.0: state 5 ports 3 chg 0000 evt 0000
+hub 1-0:1.0: state 7 ports 3 chg 0000 evt 0000
 drivers/usb/core/inode.c: creating file '001'
 ohci_hcd 0000:00:0e.2: GetStatus roothub.portstatus [0] = 0x00010301 CSC LSDA PPS CCS
 hub 1-0:1.0: port 1, status 0301, change 0001, 1.5 Mb/s
@@ -201,11 +211,13 @@
 usb 1-1: new device strings: Mfr=1, Product=2, SerialNumber=0
 usb 1-1: Product: USB Keyboard and Mouse
 usb 1-1: Manufacturer: SILITEK
-usb 1-1: hotplug
+usb 1-1: uevent
+usb 1-1: device is bus-powered
+usb 1-1: configuration #1 chosen from 1 choice
 usb 1-1: adding 1-1:1.0 (config #1, interface 0)
-usb 1-1:1.0: hotplug
+usb 1-1:1.0: uevent
 usb 1-1: adding 1-1:1.1 (config #1, interface 1)
-usb 1-1:1.1: hotplug
+usb 1-1:1.1: uevent
 drivers/usb/core/inode.c: creating file '002'
 ohci_hcd 0000:00:0e.2: GetStatus roothub.portstatus [1] = 0x00010301 CSC LSDA PPS CCS
 hub 1-0:1.0: port 2, status 0301, change 0001, 1.5 Mb/s
@@ -218,11 +230,13 @@
 usb 1-2: new device strings: Mfr=1, Product=2, SerialNumber=0
 usb 1-2: Product: N48
 usb 1-2: Manufacturer: Logitech
-usb 1-2: hotplug
+usb 1-2: uevent
+usb 1-2: device is bus-powered
+usb 1-2: configuration #1 chosen from 1 choice
 usb 1-2: adding 1-2:1.0 (config #1, interface 0)
-usb 1-2:1.0: hotplug
+usb 1-2:1.0: uevent
 drivers/usb/core/inode.c: creating file '003'
-hub 1-0:1.0: state 5 ports 3 chg 0000 evt 0004
+hub 1-0:1.0: state 7 ports 3 chg 0000 evt 0004
 usbcore: registered new driver hiddev
 usbhid 1-1:1.0: usb_probe_interface
 usbhid 1-1:1.0: usb_probe_interface - got id
@@ -239,12 +253,12 @@
 usbcore: registered new driver usbhid
 drivers/usb/input/hid-core.c: v2.6:USB HID core driver
 mice: PS/2 mouse device common for all mice
-md: linear personality registered as nr 1
-md: raid0 personality registered as nr 2
-md: raid1 personality registered as nr 3
+md: linear personality registered for level -1
+md: raid0 personality registered for level 0
+md: raid1 personality registered for level 1
 md: md driver 0.90.3 MAX_MD_DEVS=256, MD_SB_DISKS=27
 md: bitmap version 4.39
-Advanced Linux Sound Architecture Driver Version 1.0.10rc3 (Mon Nov 07 13:30:21 2005 UTC).
+Advanced Linux Sound Architecture Driver Version 1.0.11rc2 (Wed Jan 04 08:57:20 2006 UTC).
 ALSA device list:
   #0: Analog Devices AD1889 at 0xf400c000 irq 18
 NET: Registered protocol family 2
@@ -263,17 +277,17 @@
 EXT3-fs: mounted filesystem with ordered data mode.
 VFS: Mounted root (ext3 filesystem) readonly.
 Freeing unused kernel memory: 236k freed
-usb 1-0:1.0: hotplug
-usb 1-1: hotplug
-usb 1-1:1.0: hotplug
-usb 1-1:1.1: hotplug
-usb 1-2: hotplug
-usb 1-2:1.0: hotplug
-usb usb1: hotplug
+usb 1-0:1.0: uevent
+usb 1-1: uevent
+usb 1-1:1.0: uevent
+usb 1-1:1.1: uevent
+usb 1-2: uevent
+usb 1-2:1.0: uevent
+usb usb1: uevent
 Adding 265032k swap on /dev/sdb1.  Priority:-1 extents:1 across:265032k
 Adding 263144k swap on /dev/sda1.  Priority:-2 extents:1 across:263144k
 EXT3 FS on sdb3, internal journal
-ip_conntrack version 2.4 (8192 buckets, 65536 max) - 212 bytes per conntrack
+ip_conntrack version 2.4 (8192 buckets, 65536 max) - 172 bytes per conntrack
 kjournald starting.  Commit interval 5 seconds
 EXT3 FS on sdb5, internal journal
 EXT3-fs: mounted filesystem with ordered data mode.
@@ -289,4 +303,3 @@
 kjournald starting.  Commit interval 5 seconds
 EXT3 FS on sda6, internal journal
 EXT3-fs: mounted filesystem with ordered data mode.
-ip_tables: (C) 2000-2002 Netfilter core team
