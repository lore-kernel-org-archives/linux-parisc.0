Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA11781
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Oct 1999 15:16:30 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.16.124.11])
	by palrel1.hp.com (Postfix) with ESMTP id B1D2F228
	for <parisc-linux@thepuffingroup.com>; Tue, 26 Oct 1999 14:17:32 -0700 (PDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id OAA04010 for parisc-linux@thepuffingroup.com; Tue, 26 Oct 1999 14:17:59 -0700 (PDT)
Date: Tue, 26 Oct 1999 14:17:59 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199910262117.OAA04010@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] B180L console output
List-ID: <linux-parisc.vger.kernel.org>


FYA,
Similar story but no DEC PPB.

grant


pa

  Primary boot path:    FWSCSI.6.0

  Alternate boot path:  PCI1.3.0

  Console path:         GRAPHICS(0)

  Keyboard path:        PS2

Main Menu: Enter command > io fv

ERROR:  Unknown command

Main Menu: Enter command > in fv

FIRMWARE INFORMATION

  Firmware Version:           5.8

   3840   

Main Menu: Enter command > bo alt
Interact with IPL (Y, N, Q)?> n

Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.

------------------------------------------------------------------------------

PARISC/Linux Bootstrap Version 0.6 (non-interactive)
By Helge Deller & Jason Eckhardt
Built Wed Oct 20 15:37:11 PDT 1999 by grundler@rock

Reading parameters...done.

Loading PA-RISC/Linux Kernel...
SOM-Kernel:
aux_header_location: 00000080
som       : 00200080
exec_dfile: 000F2000
exec_dsize: 0008E000
exec_dmem : C00B7000
exec_tfile: 0004B000
exec_tsize: 000A6008
exec_tmem : C0010000
Code at 0x00010000, size=0x000A6008
Data at 0x000B7000, size=0x0008E000
BSS  at 0x00145000.

Transferring control to kernel. (At entry point 0x00010000)
The Kernel has started...
FP CCR was 0x0, will be set to 0xc0
Model: Merlin L2+ 180 (9000/778/B180L) with 128 MB RAM.
CPU(s): 1 x PA7300LC (PCX-L2, Velociraptor) at 180.000000 MHz
Kernel-stack at C00BA000, Size 8192 kB.
Available virtual mapped memory starts at 0xC01741F0 and ends at 0xC8000000.
Searching for devices in PDC firmware... a newer box...
Found devices:
1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0, 0x0, 0x0, 0x0
2. Merlin+ 132 Dino RS-232 (10) at 0xfff83000, versions 0x22, 0x0, 0x8c, 0x0, 0x0
3. Merlin L2+ 180 (9000/778/B180L) (0) at 0xfffbe000, versions 0x504, 0x0, 0x4, 0x0, 0x81
4. Merlin+ L2 180 (1) at 0xfffbf000, versions 0x5a, 0x0, 0x9, 0x0, 0x0
5. Merlin+ 180 Core BA (11) at 0xffd00000, versions 0x3f, 0x0, 0x81, 0x0, 0x0
6. Merlin+ 180 Core RS-232 (10) at 0xffd05000, versions 0x3f, 0x0, 0x8c, 0x0, 0x0
7. Merlin+ 180 Core SCSI (10) at 0xffd06000, versions 0x3f, 0x0, 0x82, 0x0, 0x0
8. Merlin+ 180 Core Centronics (10) at 0xffd02000, versions 0x3f, 0x0, 0x74, 0x0, 0x0
9. Merlin+ 180 Core Audio (10) at 0xffd04000, versions 0x3f, 0x4, 0x7b, 0x0, 0x0
10. Merlin+ 180 Core PC Keyboard (10) at 0xffd08000, versions 0x3f, 0x0, 0x84, 0x0, 0x0
11. Merlin+ 180 Core PC Keyboard (10) at 0xffd08100, versions 0x3f, 0x0, 0x84, 0x0, 0x0
12. Gecko GSC Core Graphics (10) at 0xf8000000, versions 0x16, 0x0, 0x85, 0x0, 0x0
13. Dino PCI Bridge (13) at 0xfff80000, versions 0x680, 0x3, 0xa, 0x0, 0x0
That's a total of 13 devices.
Linux version 2.2.12 (grundler@rock) (gcc version egcs-2.91.60 19981201 (egcs-1.1.1 release)) #341
 Tue Oct 26 13:07:06 PDT 1999
initrd: c00be000-c0115800
command_line: /stand/vmlinux HOME=/ TERM=LINUX console=tty

free_area_init: c017e000 c2000000
mem_map=c017e000
Calibrating delay loop... 239.86 BogoMIPS
Memory: 14532k available (664k kernel code, 1124k data, 64k init) [c0000000,c1000000]
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
Interrupt  3( 3+ 0)
Starting lasi serial #0 at 0xfff83000
lasi_alloc_irq(0xc01657b8): No known LASI owns device at 0xfff83000
IRQ not found for lasi serial at 0xfff83000
Warning : device (10, 0x22, 0x0, 0x8c, 0x0) NOT claimed by Lasi serial 712, 715 or similiar
Starting lasi serial #0 at 0xffd05000
lasi_alloc_irq(0xffd05000) = 26
ttyS00 at iomem 0xffd05800 (irq = 261) is a 16550A
Initializing lasi keyboard port at 0xffd08000...
Initializing lasi mouse port at 0xffd08100...
Dino version 3.1 (bridge mode) found at 0xfff80000
Scanning PCI bus 0
Found a PCI device, and the vendor is 0x1000, device 0x000f
PCI: 00:08 BAR[0]==0xfd01
PCI: 00:08 BAR[1]==0xf0ffb000
PCI: 00:08 BAR[2]==0xf0ffc000
PCI: 00:08 BAR[3]==0x0
PCI: 00:08 BAR[4]==0x0
PCI: 00:08 BAR[5]==0x0
Found a PCI device, and the vendor is 0x1000, device 0x000f
PCI: 00:98 BAR[0]==0xfe01
PCI: 00:98 BAR[1]==0xf0ffd000
PCI: 00:98 BAR[2]==0xf0ffe000
PCI: 00:98 BAR[3]==0x0
PCI: 00:98 BAR[4]==0x0
PCI: 00:98 BAR[5]==0x0
Found a PCI device, and the vendor is 0x1011, device 0x0019
PCI: 00:a0 BAR[0]==0xff01
PCI: 00:a0 BAR[1]==0xf0fff000
PCI: 00:a0 BAR[2]==0x0
PCI: 00:a0 BAR[3]==0x0
PCI: 00:a0 BAR[4]==0x0
PCI: 00:a0 BAR[5]==0x0
dino_fixup_bus(0xc01da0a0) bus 0 sysdata 0xc01d90e0
Scan for bus 0 returned 0
Linux NET4.0 for Linux 2.2
Based upon Swansea University Computer Society NET3.039
Starting kswapd v 1.2
setting up lasi keyboard
initialize_kbd: Keyboard failed self test
lasi_alloc_irq(0xffd08000) = 5
done!?!
Serial driver version 4.90 (1999-09-22) with<4>Keyboard timed out[1]
Keyboard timeout[2]
Keyboard timed out[1]
Keyboard timeout[2]
 no serial options enabled
pty: 256 Unix98 ptys configured
rd_init
RAM disk driver initialized:  16 RAM disks of 4096K size
scsi : 0 hosts.
scsi : detected total.
initrd_load
rd_load_image
opening initrd
identify_ramdisk_image
ext2sb->s_magic: 000053ef
RAMDISK: ext2 filesystem found at block 0
RAMDISK: Loading 350 blocks [1 disk] into ram disk... |/-\|/-\|/-\|/-\|/-\|/done.
initrd_release
VFS: Mounted root (ext2 filesystem).
Warning: unable to open an initial console.
It's for the PA-RISC!
It's executable!
It has an appropriate version!
The checksum checks out!
Well, it *smells* like a valid SOM executable
(start_brk) 40017000
(end_code) 0003c000
(start_code) 00001000
(end_data) 40008000
(start_stack) 2000002c
(brk) 40017000
Kernel panic: Attempted to kill the idle task!
In swapper task - not syncing
