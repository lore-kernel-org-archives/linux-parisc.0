Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA11644
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Oct 1999 15:14:40 -0600
Received: from milano.cup.hp.com (grundler@milano.cup.hp.com [15.16.124.11])
	by atlrel1.hp.com (8.9.3 (PHNE_18979)/8.8.5tis) with ESMTP id RAA27986
	for <parisc-linux@thepuffingroup.com>; Tue, 26 Oct 1999 17:14:37 -0400 (EDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id OAA03994 for parisc-linux@thepuffingroup.com; Tue, 26 Oct 1999 14:15:40 -0700 (PDT)
Date: Tue, 26 Oct 1999 14:15:40 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <199910262115.OAA03994@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=X-roman8
Subject: [parisc-linux] B132L console output
List-ID: <linux-parisc.vger.kernel.org>


Hi all,

Sorry about the previous blank message.

This B132L I took this output from is unique.
It has a DEC PCI-PCI bridge stuck in it and our buswalk handles it fine.

This output is also interesting just so folks know whats
in a "basic" B-class box in case they don't have one.

Lastly, the "lasi serial #1 at 0xffe02000" not getting claimed
is becaused it's trying to talk to Dino's RS-232. lasi_alloc_irq()
handles it correctly by failing and this failure correctly results
in not claiming the device.

We don't have Dino RS-232 support in place yet. Another "TODO" item.
If anyone is feeling bored....

grant
ü


Firmware Version  5.8

Duplex Console IO Dependent Code (IODC) revision 1

Memory Test/Initialization Completed

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------
      0      132 MHz    Active                 Functional          64 KB
                                                                    1 MB ext


  Available memory (bytes)    :   67108864 
  Good memory required (bytes):   67108864

  Primary boot path:    SESCSI.5.0
  Alternate boot path:  SESCSI.6.0
  Console path:         GRAPHICS(0)
  Keyboard path:        PS2

Processor is starting autoboot process.

To discontinue, press any key within 10 seconds.

Boot terminated.


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
Main Menu: Enter command > bo    pa alt

  Alternate boot path:  SESCSI.6.0

Main Menu: Enter command > bo alt
Interact with IPL (Y, N, Q)?> n

Booting...
Boot IO Dependent Code (IODC) revision 153


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
FP CCR was 0xc0, will be set to 0xc0
Model: Merlin L2 132 (9000/778/B132L) with 64 MB RAM.
CPU(s): 1 x PA7300LC (PCX-L2, Velociraptor) at 132.000000 MHz
Kernel-stack at C00BA000, Size 8192 kB.
Available virtual mapped memory starts at 0xC0174150 and ends at 0xC4000000.
Searching for devices in PDC firmware... a newer box...
Found devices:
1. Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0, 0x0, 0x0, 0x0
2. Unknown device (4) at 0xfff8c000, versions 0x3c, 0x0, 0x89, 0x0, 0x80
3. Merlin L2 132 (9000/778/B132L) (0) at 0xfffbe000, versions 0x501, 0x0, 0x4, 0x0, 0x81
4. Merlin L2 132 (1) at 0xfffbf000, versions 0x60, 0x0, 0x9, 0x0, 0x0
5. Merlin 132 Core BA (11) at 0xffd00000, versions 0x3c, 0x0, 0x81, 0x0, 0x0
6. Merlin 132 Core RS-232 (10) at 0xffd05000, versions 0x3c, 0x0, 0x8c, 0x0, 0x0
7. Merlin 132 Core SCSI (10) at 0xffd06000, versions 0x3c, 0x0, 0x82, 0x0, 0x0
8. Merlin 132 Core Lan (802.3) (10) at 0xffd07000, versions 0x3c, 0x0, 0x8a, 0x0, 0x0
9. Merlin 132 Core Centronics (10) at 0xffd02000, versions 0x3c, 0x0, 0x74, 0x0, 0x0
10. Merlin 132 Core Audio (10) at 0xffd04000, versions 0x3c, 0x4, 0x7b, 0x0, 0x0
11. Merlin 132 Core PC Keyboard (10) at 0xffd08000, versions 0x3c, 0x0, 0x84, 0x0, 0x0
12. Merlin 132 Core PC Keyboard (10) at 0xffd08100, versions 0x3c, 0x0, 0x84, 0x0, 0x0
13. Merlin+ Wax BA (11) at 0xffe00000, versions 0x3a, 0x0, 0x8e, 0x0, 0x0
14. Merlin+ Wax EISA BA (11) at 0xfc000000, versions 0x3a, 0x0, 0x90, 0x0, 0x0
15. Merlin+ Wax HIL (10) at 0xffe01000, versions 0x3a, 0x0, 0x73, 0x0, 0x0
16. Merlin+ Wax RS-232 (10) at 0xffe02000, versions 0x3a, 0x0, 0x8c, 0x0, 0x0
17. Gecko GSC Core Graphics (10) at 0xf8000000, versions 0x16, 0x0, 0x85, 0x0, 0x0
18. Dino PCI Bridge (13) at 0xfff80000, versions 0x680, 0x3, 0xa, 0x0, 0x0
That's a total of 18 devices.
Linux version 2.2.12 (grundler@rock) (gcc version egcs-2.91.60 19981201 (egcs-1.1.1 release)) #338
 Tue Oct 26 12:44:28 PDT 1999
initrd: c00be000-c0115800
command_line: /stand/vmlinux HOME=/ TERM=LINUX console=tty

free_area_init: c017e000 c2000000
mem_map=c017e000
Calibrating delay loop... 175.64 BogoMIPS
Memory: 14532k available (664k kernel code, 1124k data, 64k init) [c0000000,c1000000]
POSIX conformance testing by UNIFIX
Lasi version 0 at 0xffd00000 found.
Interrupt  3( 3+ 0)
Starting lasi serial #0 at 0xffd05000
lasi_alloc_irq(0xffd05000) = 26
ttyS00 at iomem 0xffd05800 (irq = 261) is a 16550A
Starting lasi serial #1 at 0xffe02000
lasi_alloc_irq(0xc0165938): No known LASI owns device at 0xffe02000
IRQ not found for lasi serial at 0xffe02000
Warning : device (10, 0x3a, 0x0, 0x8c, 0x0) NOT claimed by Lasi serial 712, 715 or similiar
Starting lasi lan at 0xffd07000
lasi_alloc_irq(0xffd07000) = 23
eth0: 82596 at 0xffd07000, 08 00 09 EF 74 14 IRQ 264.
82596.c:v1.0 15/07/98
eth0: lp at 0xc01d5140, lp->scb at 0xc01d5154
Initializing lasi keyboard port at 0xffd08000...
Initializing lasi mouse port at 0xffd08100...
Dino version 3.1 (bridge mode) found at 0xfff80000
Scanning PCI bus 0
Found a PCI device, and the vendor is 0x1011, device 0x0024
dino_fixup_bus(0xc01da0a0) bus 0 sysdata 0xc01d90e0
Found a PCI device, and the vendor is 0x1011, device 0x0019
Found a PCI device, and the vendor is 0x1000, device 0x000f
dino_fixup_bus(0xc01da120) bus 1 sysdata 0xc01d90e0
Scan for bus 0 returned 1
Linux NET4.0 for Linux 2.2
Based upon Swansea University Computer Society NET3.039
Starting kswapd v 1.2
setting up lasi keyboard
initialize_kbd: Keyboard failed self test
lasi_alloc_irq(0xffd08000) = 5
done!?!
Serial driver version 4.90 (1999-09-22) with no serial options enabled
pty: 256 Unix98 ptys configured
rd_init
RAM disk driver initialized:  16 RAM disks of 4096K size
Keyboard timed out[1]
Keyboard timeout[2]
Keyboard timed out[1]
Keyboard timeout[2]
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
