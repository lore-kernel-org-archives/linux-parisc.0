From: Keven Tipping <bytelogix@shaw.ca>
Subject: [parisc-linux] Gentoo & PARisc Kernel broken?
Date: Thu, 15 Dec 2005 22:58:42 -0700
Message-ID: <912523912e0e.912e0e912523@shaw.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Greetings to all!

I have a K370 here, all reasonable attempts to boot it have failed miserably.
The only thing that boots is the Gentoo 2005 Live CD and I have no clue why :(.

Here is the bootup log.

Main Menu: Enter command or menu > ls

---- Main Menu ---------------------------------------------------------------

     Command                           Description
     -------                           -----------
     BOot [PRI|ALT|<path>]             Boot from specified path
     PAth [PRI|ALT] [<path>]           Display or modify a path
     SEArch [DIsplay|IPL] [<path>]     Search for boot devices

     COnfiguration menu                Displays or sets boot values
     INformation menu                  Displays hardware information
     SERvice menu                      Displays service commands

     DIsplay                           Redisplay the current menu
     HElp [<menu>|<command>]           Display help for menu or command
     RESET                             Restart the system
----
Main Menu: Enter command or menu > bo fwscsi.3
Interact with IPL (Y, N, or Cancel)?> Y

Booting...
Boot IO Dependent Code (IODC) revision 152


HARD Booted.
palo ipl 1.8 root@livecd Wed Dec 14 17:02:54 MST 2005

Partition Start(MB) End(MB) Id Type
1               1      39   f0 Palo
2              40     133   83 ext2
3             134    8707   83 ext2

PALO(F0) partition contains:

Information: No console specified on kernel command line. This is normal.
PALO will choose the console currently used by firmware (serial).Current command line:
2/vmlinux root=/dev/sda3 console=ttyB0
 0: 2/vmlinux
 1: root=/dev/sda3
 2: console=ttyB0

<#>    edit the numbered field
'b'    boot with this command line
'r'    restore command line
'l'    list dir
? b

Command line for kernel: 'root=/dev/sda3 console=ttyB0 single palo_kernel=2/vmlinux'
Selected kernel: /vmlinux from partition 2
ELF32 executable
Entry 00100100 first 00100000 n 3
Segment 0 load 00100000 size 3580800 mediaptr 0x1000
Segment 1 load 0046b000 size 1334164 mediaptr 0x36c000
Segment 2 load 00000000 size 0 mediaptr 0x0
Branching to kernel entry point 0x00100100.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.6.15-rc5-pa5 (root@livecd) (gcc version 3.3.5 (Gentoo 3.3.5-r1, pie-8.7.7.1)) #1 SMP Thu Dec 15 14:49:24 MST 2005
FP[0] enabled: Rev 0 Model 14
The 32-bit Kernel has started...
Initialized PDC Console for debugging.
Determining PDC firmware type: System Map.
model 00005b10 00000491 00000000 00000000 291a830d 100000f1 00000008 000000b2 000000b2
vers  00000501
CPUID vers 14 rev 23 (0x000001d7)
capabilities 0x3
model 9000/898/K370
Total Memory: 2175 MB
SMP: bootstrap CPU ID is 0
Built 1 zonelists
Kernel command line: root=/dev/sda3 console=ttyB0 single palo_kernel=2/vmlinux
PID hash table entries: 4096 (order: 12, 65536 bytes)
Console: colour dummy device 160x64
Dentry cache hash table entries: 524288 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 262144 (order: 8, 1048576 bytes)
Memory: 2228200k available
Mount-cache hash table entries: 512
Brought up 1 CPUs
NET: Registered protocol family 16
EISA bus registered
Searching for devices...
Found devices:
1. U2-IOA BC Runway Port at 0xfff8a000 [10] { 12, 0xf, 0x580, 0x0000b }
2. Mohawk Core BA at 0xffd00000 [10/12] { 11, 0x0, 0x044, 0x00081 },  additional addresses: 0xffd0c000 0xffc00000
3. Mohawk Core SCSI at 0xffd06000 [10/12/5] { 10, 0x0, 0x044, 0x00082 }
4. Mohawk Core LAN (802.3) at 0xffd07000 [10/12/6] { 10, 0x0, 0x044, 0x0008a }
5. Mohawk Core Centronics at 0xffd02000 [10/12/0] { 10, 0x0, 0x044, 0x00074 },  additional addresses: 0xffd01000 0xffd03000
6. Mohawk Core PS/2 Port at 0xffd08000 [10/12/7] { 10, 0x0, 0x044, 0x00084 }
7. Mohawk Core PS/2 Port at 0xffd08100 [10/12/8] { 10, 0x0, 0x044, 0x00084 }
8. Mohawk Core FW-SCSI at 0xf1800000 [10/0] { 4, 0x0, 0x044, 0x00089 }
9. Gecko BOA BC GSC+ Port at 0xf1804000 [10/4] { 7, 0x0, 0x500, 0x0000c }
10. Sahp Baat Kiuh AP/MUX at 0xf1900000 [10/4/0] { 5, 0x0, 0x044, 0x0000d }
11. Gecko BOA BC HP-PB Port at 0xf193c000 [10/4/60] { 7, 0x0, 0x103, 0x0000c }
12. HP HSC-PCI Cards at 0xf1808000 [10/8] { 4, 0x0, 0x004, 0x0009d }
13. Gecko BOA BC GSC+ Port at 0xf1810000 [10/16] { 7, 0x0, 0x500, 0x0000c }
14. Gecko BOA BC HP-PB Port at 0xf1a3c000 [10/16/60] { 7, 0x0, 0x103, 0x0000c }
15. U2-IOA BC GSC+ Port at 0xf183f000 [10/63] { 7, 0x1, 0x501, 0x0000c }
16. U2-IOA BC Runway Port at 0xfff88000 [8] { 12, 0xf, 0x580, 0x0000b }
17. Shrike Add-on FW-SCSI at 0xf1008000 [8/8] { 4, 0x1, 0x014, 0x00089 }
18. HP HSC-PCI Cards at 0xf100c000 [8/12] { 4, 0x0, 0x004, 0x0009d }
19. U2-IOA BC GSC+ Port at 0xf103f000 [8/63] { 7, 0x1, 0x501, 0x0000c }
20. BraveHawk 200MHz DC3 (899/K570) at 0xfffa0000 [32] { 0, 0x0, 0x5b1, 0x00004 }
21. BraveHawk 200MHz DC3 (899/K570) at 0xfffa2000 [34] { 0, 0x0, 0x5b1, 0x00004 }
22. BraveHawk 200MHz DC3 (899/K570) at 0xfffa4000 [36] { 0, 0x0, 0x5b1, 0x00004 }
23. BraveHawk 200MHz DC3 (899/K570) at 0xfffa6000 [38] { 0, 0x0, 0x5b1, 0x00004 }
24. BraveHawk 200MHz DC3 (899/K570) at 0xfffac000 [44] { 0, 0x0, 0x5b1, 0x00004 }
25. BraveHawk 200MHz DC3 (899/K570) at 0xfffae000 [46] { 0, 0x0, 0x5b1, 0x00004 }
26. Memory at 0xfffb1000 [49] { 1, 0x0, 0x032, 0x00009 }
Releasing cpu 1 now, hpa=fffa2000
FP[1] enabled: Rev 0 Model 14
Releasing cpu 2 now, hpa=fffa4000
FP[2] enabled: Rev 0 Model 14
Releasing cpu 3 now, hpa=fffa6000
FP[3] enabled: Rev 0 Model 14
Releasing cpu 4 now, hpa=fffac000
FP[4] enabled: Rev 0 Model 14
Releasing cpu 5 now, hpa=fffae000
FP[5] enabled: Rev 0 Model 14
CPU(s): 6 x PA8200 (PCX-U+) at 200.000000 MHz
Setting cache flush threshold to 140 (6 CPUs online)
Found U2 at 0xfff8a000
Found U2 at 0xfff88000
Lasi version 0 at 0xffd00000 found.
LED display at ffd0c000 registered
Found GeckoBoa at 0xf1804000
Found GeckoBoa at 0xf1810000
Dino version 3.x (card mode) found at 0xf100c000
Dino version 3.x (card mode) found at 0xf1808000
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
unwind_init: start = 0x1046cfe0, end = 0x1049a3b0, entries = 11581
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered
PDC Stable Storage facility v0.10
Soft power switch support not available.
STI GSC/PCI core graphics driver Version 0.9a
lp: driver loaded but no devices found
Generic RTC Driver v1.07
serio: GSC PS/2 keyboard port at 0xffd08000 irq 19 @ 10:12:7
serio: GSC PS/2 mouse port at 0xffd08100 irq 19 @ 10:12:8
HP SDC: No SDC found.
HP SDC MLC: Registering the System Domain Controller's HIL MLC.
HP SDC MLC: Request for raw HIL ISR hook denied
Serial: 8250/16550 driver $Revision: 1.90 $ 13 ports, IRQ sharing enabled
Serial mux driver (8 ports) Revision: 0.3
ttyB0 at MMIO 0xf1900800 (polled) is a Mux
ttyB1 at MMIO 0xf1900880 (polled) is a Mux
ttyB2 at MMIO 0xf1900900 (polled) is a Mux
ttyB3 at MMIO 0xf1900980 (polled) is a Mux
ttyB4 at MMIO 0xf1900a00 (polled) is a Mux
ttyB5 at MMIO 0xf1900a80 (polled) is a Mux
ttyB6 at MMIO 0xf1900b00 (polled) is a Mux
ttyB7 at MMIO 0xf1900b80 (polled) is a Mux
parport_init_chip: initialize bidirectional-mode.
parport0: PC-style at 0xffd02800, irq 18 [PCSPP,TRISTATE]
lp0: using parport0 (interrupt-driven).
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
zalon_probe: Zalon version 1, IRQ 69
ncr53c720-0: rev 0xf irq 69
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
scsi0 : ncr53c8xx-3.4.3g
zalon_probe: Zalon version 1, IRQ 70
ncr53c720-1: rev 0xf irq 70
ncr53c720-1: ID 7, Fast-10, Parity Checking, Differential
scsi1 : ncr53c8xx-3.4.3g
  Vendor: QUANTUM   Model: VIKING II 9.1WLS  Rev: 3506
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target1:0:3: Beginning Domain Validation
 target1:0:3: asynchronous.
 target1:0:3: wide asynchronous.
 target1:0:3: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
 target1:0:3: Domain Validation skipping write tests
 target1:0:3: Ending Domain Validation
  Vendor: QUANTUM   Model: VIKING II 9.1WLS  Rev: 3506
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target1:0:4: Beginning Domain Validation
 target1:0:4: asynchronous.
 target1:0:4: wide asynchronous.
 target1:0:4: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
 target1:0:4: Domain Validation skipping write tests
 target1:0:4: Ending Domain Validation
  Vendor: QUANTUM   Model: VIKING II 9.1WLS  Rev: 3506
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target1:0:5: Beginning Domain Validation
 target1:0:5: asynchronous.
 target1:0:5: wide asynchronous.
 target1:0:5: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
 target1:0:5: Domain Validation skipping write tests
 target1:0:5: Ending Domain Validation
  Vendor: QUANTUM   Model: VIKING II 9.1WLS  Rev: 3506
  Type:   Direct-Access                      ANSI SCSI revision: 02
 target1:0:6: Beginning Domain Validation
 target1:0:6: asynchronous.
 target1:0:6: wide asynchronous.
 target1:0:6: FAST-10 WIDE SCSI 20.0 MB/s ST (100 ns, offset 8)
 target1:0:6: Domain Validation skipping write tests
 target1:0:6: Ending Domain Validation
53c700: Version 2.8 By James.Bottomley@HansenPartnership.com
scsi2: 53c710 rev 2
scsi2 : LASI SCSI 53c700
  Vendor: PIONEER   Model: DVD-ROM DVD-303   Rev: 1.06
  Type:   CD-ROM                             ANSI SCSI revision: 02
 target2:0:2: Beginning Domain Validation
 target2:0:2: asynchronous.
 target2:0:2: FAST-10 SCSI 10.0 MB/s ST (100 ns, offset 8)
 target2:0:2: Domain Validation skipping write tests
 target2:0:2: Ending Domain Validation
  Vendor: TOSHIBA   Model: CD-ROM XM-5401TA  Rev: 3115
  Type:   CD-ROM                             ANSI SCSI revision: 02
 target2:0:3: Beginning Domain Validation
 target2:0:3: asynchronous.
 target2:0:3: FAST-5 SCSI 4.2 MB/s ST (236 ns, offset 8)
 target2:0:3: Domain Validation skipping write tests
 target2:0:3: Ending Domain Validation
st: Version 20050830, fixed bufsize 32768, s/g segs 256
SCSI device sda: 17836668 512-byte hdwr sectors (9132 MB)
SCSI device sda: drive cache: write back
SCSI device sda: 17836668 512-byte hdwr sectors (9132 MB)
SCSI device sda: drive cache: write back
 sda: sda1 sda2 sda3
sd 1:0:3:0: Attached scsi disk sda
SCSI device sdb: 17836668 512-byte hdwr sectors (9132 MB)
SCSI device sdb: drive cache: write back
SCSI device sdb: 17836668 512-byte hdwr sectors (9132 MB)
SCSI device sdb: drive cache: write back
 sdb: sdb1 sdb2
sd 1:0:4:0: Attached scsi disk sdb
SCSI device sdc: 17836668 512-byte hdwr sectors (9132 MB)
SCSI device sdc: drive cache: write back
SCSI device sdc: 17836668 512-byte hdwr sectors (9132 MB)
SCSI device sdc: drive cache: write back
 sdc: sdc1
sd 1:0:5:0: Attached scsi disk sdc
SCSI device sdd: 17836668 512-byte hdwr sectors (9132 MB)
SCSI device sdd: drive cache: write back
SCSI device sdd: 17836668 512-byte hdwr sectors (9132 MB)
SCSI device sdd: drive cache: write back
 sdd: sdd1
sd 1:0:6:0: Attached scsi disk sdd
sr0: scsi3-mmc drive: 0x/0x cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.20
sr1: scsi-1 drive
sd 1:0:3:0: Attached scsi generic sg0 type 0
sd 1:0:4:0: Attached scsi generic sg1 type 0
sd 1:0:5:0: Attached scsi generic sg2 type 0
sd 1:0:6:0: Attached scsi generic sg3 type 0
sr 2:0:2:0: Attached scsi generic sg4 type 5
sr 2:0:3:0: Attached scsi generic sg5 type 5
usbmon: debugfs is not available
mice: PS/2 mouse device common for all mice
md: linear personality registered as nr 1
md: raid0 personality registered as nr 2
md: raid1 personality registered as nr 3
md: raid5 personality registered as nr 4
raid5: measuring checksumming speed
   8regs     :   428.000 MB/sec
   8regs_prefetch:   364.000 MB/sec
   32regs    :   432.000 MB/sec
   32regs_prefetch:   388.000 MB/sec
raid5: using function: 32regs (432.000 MB/sec)
md: md driver 0.90.3 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: bitmap version 4.39
oprofile: using timer interrupt.
NET: Registered protocol family 2
IP route cache hash table entries: 131072 (order: 7, 524288 bytes)
TCP established hash table entries: 262144 (order: 9, 3145728 bytes)
TCP bind hash table entries: 65536 (order: 7, 524288 bytes)
TCP: Hash tables configured (established 262144 bind 65536)
TCP reno registered
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 10
IPv6 over IPv4 tunneling driver
NET: Registered protocol family 17
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access will be enabled during recovery.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: recovery complete.
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: Badness in smp_call_function at arch/parisc/kernel/smp.c:348
Backtrace:
 [<10116430>] smp_call_function+0x374/0x3a4
 [<101065bc>] flush_data_cache+0x24/0x40
 [<10105764>] free_initmem+0x64/0x228
 [<10104e84>] init+0x2dc/0x3c8
 [<1010dc5c>] ret_from_kernel_thread+0x1c/0x24

484k freed
INIT: version 2.86 booting

Gentoo Linux; http://www.gentoo.org/
 Copyright 1999-2005 Gentoo Foundation; Distributed under the GPLv2

 * Mounting proc at /proc ...                                             [ ok ]
 * Mounting sysfs at /sys ...                                             [ ok ]
 * Mounting /dev for udev ...                                             [ ok ]
 * Configuring system to use udev ...
 *   Populating /dev with device nodes ...
 *   Setting /sbin/udevsend as hotplug agent ...
                                                                          [ ok ]
 * Mounting devpts at /dev/pts ...                                        [ ok ]
 * Activating (possible) swap ...Adding 2008084k swap on /dev/sdb1.  Priority:-1 extents:1 across:2008084k
                                         [ ok ]
 * Remounting root filesystem read-only (if necessary) ...                [ ok ]
 * Checking root filesystem .../dev/sda3: clean, 2162/1097728 files, 75932/2194880 blocks
                                           [ ok ]
 * Remounting root filesystem read/write ...                              [ ok ]
 * Setting hostname to nova ...                                           [ ok ]
 * Calculating module dependencies ...                                    [ ok ]
 * Using /etc/modules.autoload.d/kernel-2.6 as config:
 *   Loading module lasi_82596 ...                                        [ ok ]
 * Autoloaded 1 module(s)
 * Checking all filesystems .../dev/sda2: clean, 13/24192 files, 13497/96388 blocks
/dev/sdb2: recovering journal
/dev/sdc1: recovering journal
/dev/sdd1: recovering journal
/dev/sdc1: clean, 183415/1115040 files, 379438/2229010 blocks
/dev/sdd1: clean, 12/1115040 files, 43208/2229010 blocks
/dev/sdb2: clean, 25458/864960 files, 62574/1726987 blocks
                                           [ ok ]
 * Mounting local filesystems ...                                         [ ok ]
 * Activating (possibly) more swap ...                                    [ ok ]
 * Setting system clock to hardware clock [UTC] ...                       [ ok ]
 * Configuring kernel parameters ...                                      [ ok ]
 * Updating environment ...                                               [ ok ]
 * Cleaning /var/lock, /var/run ...                                       [ ok ]
 * Cleaning /tmp directory ...                                            [ ok ]
 * Loading key mappings ...                                               [ ok ]
 * Setting terminal encoding to ASCII ...                                 [ ok ]
 * Setting user font ...                                                  [ ok ]
 * Starting lo
 *   Bringing up lo ...                                                   [ ok ]
 * Initializing random number generator ...                               [ ok ]
INIT: Entering runlevel: 3
 * Starting eth0
 *   Bringing up eth0
 *     10.0.1.202
                                                                          [ ok ]
                                                                          [ ok ]
 *   Adding routes
 *     default gw 10.0.1.1 ...                                            [ ok ]
 * Starting local ...                                                     [ ok ]
 * Mounting network filesystems ...                                       [ ok ]
Kernel panic - not syncing: Kernel Fault

What happens here is that it sticks at "Mounting Network Filesystems". If I press any key on my Serial console here, then it goes off and panics.

The Debian boot CD's did something similar (freezing, then when I press a key it panics). I have tried most of the Gentoo hppa-sources with no avail, also tried the 2.6.15-rc5-pa5 Kernel from cvs.parisc-linux.org (as seen above).

I'm not sure whats wrong here, and rebooting this beast is a very long process (20 minutes each time).

Does anyone have any ideas? I'd really like to run Linux on this mammoth somehow, but I've tried everything I can think of with no sucssess (except the Gentoo Live CD, but that doesn't really do anything other then let me setup the system and compile a kernel).

Cheers!
Keven Tipping

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
