Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA10914
	for <parisc-linux@puffin.external.hp.com>; Sun, 14 Nov 1999 18:00:13 -0700
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <382F5B60.D215DB58@uswest.net>
Date: Sun, 14 Nov 1999 18:01:20 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Alex deVries <adevries@thepuffingroup.com>
CC: paul_bame@hp.com, Parisc Linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] arch/parisc/kernel/realmode_setup.c Question
References: <Pine.LNX.4.10.9911141954080.7120-100000@vodka.thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:

> On Sun, 14 Nov 1999, Ryan Bradetich wrote:
> > I have started working on getting the kernel to boot on the PA2.0
> > architecture again, and I see the you and others have been doing
> > lots of work with the initialization code.  (Nice job to everyone btw,
> > the code is a lot easier to figure out for a newbie like me! :)
>
> Same here.
>
> > I am working on a C200+ which has the PA2.0 processor, so in the
> > the following section of code it should give me an error during the
> > BTLB initialization, but during the PDC_BTLB_INSERT pret is set
> > to 0, so the check for non-PA1.1 architecture's fail.
>
> It's a bit unclear to me which processor is actually in there, but I
> believe it's an 8000, so it and the firmware may in fact support
> PDC_BTLB_INSERT, which means that the kernel might work properly.
>
> I have a C3000 which does *NOT* implement PDC_BTLB functions.
>
> It sounds like the error message is actually a bit misleading.
>
> Instead of:
>
>          mprintf("Looks like there's no BTLB on this box, so it's > probably\n"
>                        "either PA1.0 or PA2.0.  In any case we're screwed for now\n");
>
> it should be:
>
> "Looks like there's no BTLB on this box, so it's either a PA1.0 or a PA2.0
> that doesn't implement BTLBs"
>
> How far does it actually boot though?

Same as always (their is just more console output before it hangs).  Here is a cut/paste
of the console messages from the serial console.


Firmware Version  5.2

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache
  ---------  --------   ---------------------  -----------------  -------------
      0      200 MHz    Active                 Functional         512 KB/1 MB

  Central Bus Speed (in MHz) :        120

  Available memory (bytes)    : 268435456
  Good memory required (bytes):   21827584

  Primary boot path:    FWSCSI.5.0
  Alternate boot path:  SESCSI.6.0
  Console path:         SERIAL_1.9600.8.none
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
Main Menu: Enter command > bo lan <ip>
Interact with IPL (Y, N, Q)?> n

Booting...
Network Station Address 0060b0-ea9875
System IP Address  <ip>
Server IP Address <ip>

Boot IO Dependent Code (IODC) revision 2


HARD Booted.

------------------------------------------------------------------------------

PARISC/Linux Bootstrap Version 0.6 (non-interactive)
By Helge Deller & Jason Eckhardt
Built Sat Nov 13 17:17:38 MST 1999 by root@vega

Reading parameters...done.

Loading PA-RISC/Linux Kernel...
SOM-Kernel:
aux_header_location: 00000080
som       : 00200080
exec_dfile: 000C8000
exec_dsize: 00082000
exec_dmem : C009A000
exec_tfile: 0003E000
exec_tsize: 00089008
exec_tmem : C0010000
Code at 0x00010000, size=0x00089008
Data at 0x0009A000, size=0x00082000
BSS  at 0x0011C000.

Transferring control to kernel. (At entry point 0x00010000)
kernel(0x00148C80, 0x00504010, 0x00148C80, 0x00016640)
Clear BSS 0x0011B048 --> 0x0013D690
Boot loader: PA/Linux, maybe PALO
realmode_setup exiting

... At this point it hangs.  Before, it always used to hang at:
Transferring control to kernel. (At entry point 0x00010000)

I still do not believe it ever successfully finished the rfi in head.S :(
I still need to do some more research to verify this, but that is my
gut feeling right now.

Ryan Bradetich

>
> - Alex
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
