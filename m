Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (gapserver.centraltx.com [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id B4EF14829
	for <parisc-linux@parisc-linux.org>; Sun, 12 Jan 2003 20:59:18 -0700 (MST)
From: "Marc Eisenbarth" <marc@centraltx.com>
To: "'Matthew Wilcox'" <willy@debian.org>
Cc: <parisc-linux@parisc-linux.org>
Subject: RE: [parisc-linux] Cannot boot after installing kernel!
Date: Sun, 12 Jan 2003 21:59:23 -0600
Message-ID: <001a01c2bab8$29127720$3e73a218@ko>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
In-Reply-To: <20030111213641.F26554@parcelfarce.linux.theplanet.co.uk>
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

Well, you were right about it taking a while to boot, but it still
bombed on me... see below. Is there a way I can boot my previous kernel
up again? 

Firmware Version  2.7

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------
------
    (c) Copyright 1995-1998, Hewlett-Packard Company, All rights
reserved
 
------------------------------------------------------------------------
------

   Processor   Speed            State           Coprocessor State  I/D
Cache 
   ---------  --------   ---------------------  -----------------
-------------
       0      180 MHz    Active                 Functional         1
MB/1 MB

   Central Bus Speed (in MHz) :        120

   Available memory (bytes)    : 805306368
   Good memory required (bytes):          0 (Not Set by OS)
   Primary boot path:    FWSCSI.5.0
   Alternate boot path:  SESCSI.6.0
   Console path:         GRAPHICS(3)
   Keyboard path:        PS2
 CPU 0
 WARNING:  Self tests have been disabled as a result of FASTBOOT
          being enabled.  To enable self tests, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
WARNING:  Memory has been initialized, but not tested as a result of
          FASTBOOT being enabled.  To test memory, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.

 Processor is booting from first available device.

 To discontinue, press any key within 10 seconds.

 10 seconds expired.
 Proceeding...
Searching for device(s) with bootable media...
This may take several minutes.

To discontinue search, press any key (termination may not be immediate).

 Attempting to boot Primary Path...

 BOOTABLE DEVICE FOUND:
    Path Number        Device Path              Device Type and
Utilities
   -----------        -----------------        -------------------------
   P0                 FWSCSI.5.0               SEAGATE ST34371W        
                                                IPL
Booting... 
Boot IO Dependent Code (IODC) revision 150


HARD Booted.
palo ipl 1.0 root@palinux Mon Apr  1 10:02:53 MST 2002

 Partition Start(MB) End(MB) Id Type
  1               1      16   f0 Palo
  2            3141    4094   82 swap
  5              17    3140   83 ext2
 PALO(F0) partition contains:
     0/vmlinux32 3687647 bytes @ 0x48000

 Information: No console specified on kernel command line. This is
normal.
 PALO will choose the console currently used by firmware (serial).
 Command line for kernel: 'root=/dev/sda5 HOME=/ console=ttyS0
TERM=vt102 palo_kernel=5/boot/vmlinux'
 Selected kernel: /boot/vmlinux from partition 5
 ELF32 executable
 Entry 00100000 first 00100000 n 5
 Segment 0 load 00100000 size 2503500 mediaptr 0x1000
 Segment 1 load 00364000 size 674056 mediaptr 0x265000
 Segment 2 load 0040c000 size 286720 mediaptr 0x30a000
 Segment 3 load 00458000 size 32768 mediaptr 0x350000
 Segment 4 load 0048efb8 size 110864 mediaptr 0x358fb8
 Branching to kernel entry point 0x00100000.  If this is the last
 message you see, you may need to switch your console.  This is
 a common symptom -- search the FAQ and mailing list at parisc-linux.org

 Linux version 2.4.19-32-smp (root@j5k) (gcc version 3.0.4) #1 SMP Fri
Nov 22 23:11:10 MST 2002
 FP[0] enabled: Rev 0 Model 14
 The 32-bit Kernel has started...
 Determining PDC firmware type: System Map.
 model 000059c0 00000481 00000000 00000002 77d14d81 100000f0 00000008
000000b2 000000b2
 vers  00000205
 CPUID vers 14 rev 9 (0x000001c9)
 model 9000/780/C180
 Total Memory: 768 Mb
 pagetable_init
 On node 0 totalpages: 196608
 zone(0): 196608 pages.
 zone(1): 0 pages.
 zone(2): 0 pages.
 LED display at f0190001 registered
 Kernel command line: root=/dev/sda5 HOME=/ console=ttyS0 TERM=vt102
palo_kernel=5/boot/vmlinux
 Console: colour dummy device 160x64
 Calibrating delay loop... 358.80 BogoMIPS
 Memory: 773296k available
 Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes)
 Inode cache hash table entries: 65536 (order: 7, 524288 bytes)
 Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
 Buffer-cache hash table entries: 65536 (order: 6, 262144 bytes)
 Page-cache hash table entries: 262144 (order: 8, 1048576 bytes)
 Searching for devices...
 Found devices:
 1. U2-IOA BC Runway Port (12) at 0xfff88000 [8], versions 0x580, 0xf,
0xb
 2. Dino PCI Bridge (13) at 0xf2000000 [8/0], versions 0x680, 0x1, 0xa
 3. Dino PS/2 Port (10) at 0xf2001000 [8/1], versions 0x7, 0x0, 0x96
 4. Raven Backplane RS-232 (10) at 0xf2003000 [8/3], versions 0x17, 0x0,
0x8c
 5. Raven U/L2 Core FW-SCSI (4) at 0xf200c000 [8/12], versions 0x3b,
0x0, 0x89
 6. Raven U/L2 Core BA (11) at 0xffd00000 [8/16], versions 0x3b, 0x0,
0x81,  additional addresses: 0xffd0c000 0xffc00000 
 7. UL 350 Core Centronics (10) at 0xffd02000 [8/16/0], versions 0x2e,
0x0, 0x74,  additional addresses: 0xffd01000 0xffd03000 
 8. Raven U/L2 Core Audio (10) at 0xffd04000 [8/16/1], versions 0x3b,
0x4, 0x7b
 9. Raven U/L2 Core RS-232 (10) at 0xffd05000 [8/16/4], versions 0x3b,
0x0, 0x8c
 10. Raven U/L2 Core SCSI (10) at 0xffd06000 [8/16/5], versions 0x3b,
0x0, 0x82
 11. Raven U/L2 Core LAN (802.3) (10) at 0xffd07000 [8/16/6], versions
0x3b, 0x0, 0x8a
 12. Raven U/L2 Core PS/2 Port (10) at 0xffd08000 [8/16/7], versions
0x3b, 0x0, 0x84
 13. Raven U/L2 Core PS/2 Port (10) at 0xffd08100 [8/16/8], versions
0x3b, 0x0, 0x84
 14. Raven Backplane Wax BA (11) at 0xffe00000 [8/20], versions 0x17,
0x0, 0x8e
 15. Raven Backplane Wax HIL (10) at 0xffe01000 [8/20/1], versions 0x17,
0x0, 0x73
 16. Raven Backplane RS-232 (10) at 0xffe02000 [8/20/2], versions 0x17,
0x0, 0x8c
 17. Raven Backplane Wax EISA BA (11) at 0xfc000000 [8/20/5], versions
0x17, 0x0, 0x90,  additional addresses: 0xffc88000 0xfc00000b 
 18. Gecko GSC Core Graphics (10) at 0xfa000000 [8/24], versions 0x16,
0x0, 0x85,  additional addresses: 0xf0084000 
 19. U2-IOA BC GSC+ Port (7) at 0xf203f000 [8/63], versions 0x501, 0x1,
0xc
 20. U2-IOA BC Runway Port (12) at 0xfff8a000 [10], versions 0x580, 0xf,
0xb
 21. Coral SGC Graphics (10) at 0xf8000000 [10/8], versions 0x4, 0x0,
0x77
 22. U2-IOA BC GSC+ Port (7) at 0xf103f000 [10/63], versions 0x501, 0x1,
0xc
 23. Raven U 180 (9000/780/C180) (0) at 0xfffa0000 [32], versions 0x59c,
0x0, 0x4
 24. Memory (1) at 0xfffb1000 [49], versions 0x72, 0x0, 0x9
 CPU(s): 1 x PA8000 (PCX-U) at 180.000000 MHz
 Found U2 at 0xfff88000
 Found U2 at 0xfff8a000
 Lasi version 0 at 0xffd00000 found.
 Wax at 0xffe00000 found.
 Wax EISA Adapter found at 0xfc000000
 EISA EEPROM at 0xffc88000
 Enumerating EISA bus
 EISA slot 1 id mis-match: got INP0500 expected ___FFFF 
 Dino version 2.1 found at 0xf2000000
 The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
 data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
 Systems shipped after Aug 20, 1997 will not exhibit this problem.
 Models affected: C180, C160, C160L, B160L, and B132L workstations.

 Dino: No PCI devices enabled.
 POSIX conformance testing by UNIFIX
 SMP: Bootstrap processor only.
 SMP: Total 1 of 1 processors activated (358.81 BogoMIPS noticed).
 Waiting on wait_init_idle (map = 0x0)
 All processors have done init_idle
 Linux NET4.0 for Linux 2.4
 Based upon Swansea University Computer Society NET3.039
 Initializing RT netlink socket
 Soft power switch enabled, polling @ 0xf0140000.
 Starting kswapd
 Journalled Block Device driver loaded
 Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
 parport_init_chip: initialize bidirectional-mode.
 parport0: PC-style at 0xffd02800, irq 88 [PCSPP,TRISTATE]
 STI GSC/PCI graphics driver version 0.9
 STI word mode ROM at f0084000, hpa at fa000000
 STI id 2d08c0a7-9a02587, conforms to spec rev. 8.07
 STI device: INTERNAL_EG_1280
 STI byte mode ROM at f8000000, hpa at f8000000
 STI id 2bcb015a-9a02587, conforms to spec rev. 8.04
 STI device: HPA4071B_LZ
 Console: switching to colour frame buffer device 160x64
 fb0: stifb 1280x1024-8 frame buffer device, id: 2d08c0a7, mmio:
0xfa100000
 fb1: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio:
0xf8100000
 pty: 256 Unix98 ptys configured
 Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
 ttyS00 at iomem 0xffd05800 (irq = 90) is a 16550A
 ttyS01 at iomem 0xffe02800 (irq = 121) is a 16550A
 PS/2 keyboard port at 0xffd08000 (irq 69) found, no device attached.
 PS/2 psaux port at 0xffd08100 (irq 69) found, no device attached.
 lp0: using parport0 (interrupt-driven).
 Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
 Uniform Multi-Platform E-IDE driver Revision: 6.31
 ide: Assuming 50MHz system bus speed for PIO modes; override with
idebus=xx
 RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
 loop: loaded (max 8 devices)
 Found i82596 at 0xffd07000, IRQ 87
 eth0: 82596 at 0xffd07000, 00 60 B0 18 9B B9 IRQ 87.
 82596.c $Revision: 1.29 $
 SCSI subsystem driver Revision: 1.00
 zalon_scsi_callback: Zalon vers field is 0x1, IRQ 36
 ncr53c8xx: 53c720 detected
 ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
 scsi0 : ncr53c8xx-3.4.3b-20010512
   Vendor: SEAGATE   Model: ST34371W          Rev: HP03
   Type:   Direct-Access                      ANSI SCSI revision: 02
   Vendor: SEAGATE   Model: ST32171W          Rev: HP03
   Type:   Direct-Access                      ANSI SCSI revision: 02
 53c700: Version 2.7 By James.Bottomley@HansenPartnership.com
 scsi1: 53c710 rev 2 
 scsi1 : LASI SCSI 53c700
 scsi1: (1:0) Synchronous at offset 8, period 100ns
   Vendor: SONY      Model: SDT-7000          Rev: 0150
   Type:   Sequential-Access                  ANSI SCSI revision: 02
 st: Version 20020205, bufsize 32768, wrt 30720, max init. bufs 4, s/g
segs 16
 Attached scsi tape st0 at scsi1, channel 0, id 1, lun 0
 Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
 Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
 ncr53c720-0-<5,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
 SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
 Partition check:
  sda: sda1 sda2 sda3 < sda5 >
 ncr53c720-0-<6,*>: FAST-10 WIDE SCSI 20.0 MB/s (100 ns, offset 8)
 SCSI device sdb: 4194685 512-byte hdwr sectors (2148 MB)
  sdb: sdb1
 Lasi Harmony Audio driver V0.9a, h/w id 20, rev. 2 at 0xffd04000, IRQ
82
 usb.c: registered new driver usbdevfs
 usb.c: registered new driver hub
 usb.c: registered new driver hid
 hid-core.c: v1.8.1 Andreas Gal, Vojtech Pavlik <vojtech@suse.cz>
 hid-core.c: USB HID support drivers
 mice: PS/2 mouse device common for all mice
 HP SDC: HP SDC at 0xffe01000, IRQ 126 (NMI IRQ 125)
 HP SDC: New style SDC
 HP SDC: Revision: 1820-4784
 HP SDC: TI SN76494 beeper present
 HP SDC: OKI MSM-58321 BBRTC present
 HP SDC: Spunking the self test register to force PUP on next firmware
reset.
 HP SDC MLC: Registering the System Domain Controller's HIL MLC.
 md: line








-Marc 


-----Original Message-----
From: willy@www.linux.org.uk [mailto:willy@www.linux.org.uk] On Behalf
Of Matthew Wilcox
Sent: Saturday, January 11, 2003 3:37 PM
To: Marc Eisenbarth
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Cannot boot after installing kernel!

On Sat, Jan 11, 2003 at 03:28:21PM -0600, Marc Eisenbarth wrote:
> Well, things were going great on my C180 until just a few minutes ago
> when I did:

i'd think this is not actually hung, it's just taking a very long time
to
boot.  can you leave it for 10 minutes or so and see if it comes to
life?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead
bodies.
Do you think I want to have an academic debate on this subject?" --
Robert Fisk
