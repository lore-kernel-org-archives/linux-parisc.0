Return-Path: <hppa-linux@thepuffingroup.com>
Message-Id: <199903122249.OAA08358@milano.cup.hp.com>
To: hppa-linux@thepuffingroup.com
Subject: Re: [hppa-linux] Boot #4 and source on ftp site 
In-reply-to: Your message of "Thu, 11 Mar 1999 16:35:15 PST."
             <199903112235.QAA05851@equator.com>
Date: Fri, 12 Mar 1999 14:49:02 -0800
From: Grant Grundler <grundler@cup.hp.com>
Resent-Message-ID: <"vd8j7.0.rY7.8ePws"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

Jason Eckhardt wrote:
> 
> Boot test #4: This is essentially the same code as #3 but I have taken
> out some delays, modified the cache flush routines, and turned
...

Works on B132L (early version B-class). Will try it on a newer
C-class next.

One gripe: The test code doesn't automatically reboot the box.
I use remote consoles and have to walk over to the machine room
to cycle power...remember I'm doing this in my "spare" time.

If/when a kernel debugger is working, rebooting from the debugger
would be a good thing. I think PDC will support this but don't
have a clue about the details.

grant


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
...
Main Menu: Enter command > pa

  Primary boot path:    SESCSI.5.0

  Alternate boot path:  SESCSI.6.0

  Console path:         GRAPHICS(0)

  Keyboard path:        PS2

Main Menu: Enter command > bo alt
Interact with IPL (Y, N, Q)?> n

Booting...
Boot IO Dependent Code (IODC) revision 153


HARD Booted.

------------------------------------------------------------------------------

PARISC/Linux Bootstrap Version 0.2 (non-interactive)
By Jason Eckhardt
Built Thu Mar 11 16:01:50 CST 1999 by jason@sathanas

IPL_DEBUG: Page zero parameters:
  P0_IMM_max_mem:          67108864 (64 MB)
  P0_BOOTCPU_10msec:       1320000 (132 MHz)
  P0_BOOTCPU_mem_free:     0x00008000
  P0_BOOTCPU_hpa:          0xFFFBE000
  P0_BOOTCPU_pdc:          0x00004800
  P0_COUT_iodc_io:         0x00008000
  P0_CIN_iodc_io:          0x00008000
  P0_BOOTDEV_iodc_io:      0x00012000
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
[ couldn't copy the ASCII animation]

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
