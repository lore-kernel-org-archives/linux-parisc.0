Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by sod.res.cmu.edu (8.8.7/8.8.7) with SMTP id SAA31426
	for <hppa-linux@sod.res.cmu.edu>; Fri, 12 Mar 1999 18:04:30 -0500
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.13.185.124])
	by palrel1.hp.com (8.8.6/8.8.5tis) with ESMTP id PAA00975
	for <hppa-linux@thepuffingroup.com>; Fri, 12 Mar 1999 15:04:18 -0800 (PST)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id PAA08417 for <hppa-linux@thepuffingroup.com>; Fri, 12 Mar 1999 15:03:48 -0800 (PST)
Message-Id: <199903122303.PAA08417@milano.cup.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Boot #4 and source on ftp site 
In-reply-to: Your message of "Thu, 11 Mar 1999 16:35:15 PST."
             <199903112235.QAA05851@equator.com>
Date: Fri, 12 Mar 1999 15:03:46 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Jason Eckhardt wrote:
> 
> Boot test #4: This is essentially the same code as #3 but I have taken
> out some delays, modified the cache flush routines, and turned
...

Works on a fairly new 9000/782/C200+
[Party!]

cheers,
grant


Firmware Version  6.1

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache
  ---------  --------   ---------------------  -----------------  -------------
      0      200 MHz    Active                 Functional         512 KB/1 MB

  Central Bus Speed (in MHz) :        120

  Available memory (bytes)    : 268435456
  Good memory required (bytes):   21610496
  Primary boot path:    PCI1.13.0
  Alternate boot path:  SESCSI.2.0
  Console path:         GSC1.0.0
  Keyboard path:        PS2

CPU 0
WARNING:  Self tests have been disabled as a result of FASTBOOT
          being enabled.  To enable self tests, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
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
Main Menu: Enter command > pa

  Primary boot path:    PCI1.13.0

  Alternate boot path:  SESCSI.2.0

  Console path:         GSC1.0.0

  Keyboard path:        PS2

Main Menu: Enter command > bo pci1.12.0
Interact with IPL (Y, N, Q)?> n

Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.

------------------------------------------------------------------------------

PARISC/Linux Bootstrap Version 0.2 (non-interactive)
By Jason Eckhardt
Built Thu Mar 11 16:01:50 CST 1999 by jason@sathanas

IPL_DEBUG: Page zero parameters:
  P0_IMM_max_mem:          268435456 (256 MB)
  P0_BOOTCPU_10msec:       2000000 (200 MHz)
  P0_BOOTCPU_mem_free:     0x0000C000
  P0_BOOTCPU_hpa:          0xFFFA0000
  P0_BOOTCPU_pdc:          0x00008000
  P0_COUT_iodc_io:         0x0000C000
  P0_CIN_iodc_io:          0x0000C000
  P0_BOOTDEV_iodc_io:      0x00016000
  P0_COUT_class:           0x00000007
  P0_CIN_class:            0x00000007
  P0_BOOTDEV_class:        0x00000001
Reading parameters...done.
Size = 28672 bytes, entry = 0x00001000, location = 0x0002B040.
Loading kernel...done.
Transferring control to kernel.

*********************************************************

VMLINUX 0.0: Dummy kernel image loaded and executing!


It is now safe to reboot.
