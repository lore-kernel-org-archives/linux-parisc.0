Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA19266
	for <parisc-linux@puffin.external.hp.com>; Tue, 18 Apr 2000 19:01:29 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id 2CE6E37F6
	for <parisc-linux@thepuffingroup.com>; Tue, 18 Apr 2000 18:01:27 -0700 (PDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id SAA24682 for parisc-linux@thepuffingroup.com; Tue, 18 Apr 2000 18:01:39 -0700 (PDT)
Date: Tue, 18 Apr 2000 18:01:39 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200004190101.SAA24682@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 2-way j5000 hangs early
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I was hoping to use a j5000 to debug problems with built-in 100BT
but couldn't even "get off the ground" (so to speak). The J5000
slot 1 is on the "core I/O" bus - I wanted to monitor PCI bus activity
of "built-in" devices. I can't do that on a C3k.

The j5000 I was loaned for the next couple of days is a 2-way
machine (as opposed to a 1-way c3k I was using up to now).
No other "extras" installed in this system.
(PCX-W rev 5, my c3k is rev 4)

I'm open to ideas on what might be wrong.
Going home for today and won't be back until tomorrow afternoon.
Appended is the complete console output (ends with pagetable_init).

thanks,
grant


Firmware Version 3.5

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-1999, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache 
  ---------  --------   ---------------------  -----------------  -------------
      0      440 MHz    Active                 Functional         512 kB/1 MB
      1      440 MHz    Idle                   Functional         512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:             2147483648 bytes
  Good memory required:                  0 bytes (Not Set by OS)

  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  SCSI.6.0
  Console path:         PCI7.0.0
  Keyboard path:        USB

CPU 0
WARNING:  Processor self-tests have been disabled because FASTBOOT is
          enabled.  To enable self-tests, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.

CPU 1
WARNING:  Processor self-tests have been disabled because FASTBOOT is
          enabled.  To enable self-tests, disable FASTBOOT with the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.


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
Main Menu: Enter command > bo lan
Interact with IPL (Y, N, Q)?> n

Booting... 
Network Station Address 001083-7a0f6c

System IP Address 15.8.80.77
Server IP Address 15.8.80.76

Boot IO Dependent Code (IODC) revision 2


HARD Booted.
palo ipl grundler@rock Tue Apr 18 17:00:37 PDT 2000
0/vmlinux 1956928 bytes @ 0x6800
0/palo-cmdline '0/vmlinux HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.80.76'
0/ramdisk 614400 bytes @ 0x1e4440
Kernel: partition 0 file /vmlinux
ELF32 executable

Entry 0010178c first 00100000 n 4
Segment 0 load 00100000 size 1100948 mediaptr 0x1000
Segment 1 load 0020e000 size 95400 mediaptr 0x10e000
Segment 2 load 00228000 size 55988 mediaptr 0x126000
Segment 3 load 00238000 size 8192 mediaptr 0x134000
branching to kernel entry point 0x0010178c
The Kernel has started...
Free memory starts at: 0xc02a4000
PALO command line: 'HOME=/ TERM=LINUX root=/dev/nfs nfsroot=15.8.80.76'
PALO initrd 0-0
FP CCR was 0x0, will be set to 0xc0
model   00005bd0 00000491 00000000 00000002 77fc84a7 100000f0 00000008 000000b2 000000b2
vers    00000201
cpuid   00000225
CPUID vers 17 rev 5
CPU(s): 1 x PA8500 at 440.000000 MHz
Searching for devices in PDC firmware... a newer box...
Found devices:
1. Astro BC Runway Port (12) at 0xfed00000, versions 0x582, 0x0, 0xb, 0x0, 0x10
2. Elroy PCI Bridge (13) at 0xfed30000, versions 0x782, 0x0, 0xa, 0x0, 0x0
3. Elroy PCI Bridge (13) at 0xfed32000, versions 0x782, 0x0, 0xa, 0x0, 0x0
4. Elroy PCI Bridge (13) at 0xfed34000, versions 0x782, 0x0, 0xa, 0x0, 0x0
5. Elroy PCI Bridge (13) at 0xfed38000, versions 0x782, 0x0, 0xa, 0x0, 0x0
6. Elroy PCI Bridge (13) at 0xfed3c000, versions 0x782, 0x0, 0xa, 0x0, 0x0
7. Forte W 2-way (0) at 0xfffa0000, versions 0x5bd, 0x0, 0x4, 0x0, 0x91
8. Forte W 2-way (0) at 0xfffa2000, versions 0x5bd, 0x0, 0x4, 0x0, 0x91
9. Forte 2w Memory (1) at 0xfed10200, versions 0x88, 0x0, 0x9, 0x0, 0x0
That's a total of 9 devices.
Linux version 2.3.99-pre1 (grundler@rock) (gcc version 2.9-hppa-991112) #6 Tue Apr 18 17:00:23 PDT 2000
initrd: 00000000-00000000
pagetable_init
