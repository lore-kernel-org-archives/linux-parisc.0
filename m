Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9439B4838
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 May 2002 12:44:37 -0600 (MDT)
Date: Mon, 27 May 2002 11:44:35 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: <Pine.LNX.4.44.0205262159110.11012-100000@garibaldi.apptechsys.com>
Message-ID: <Pine.LNX.4.44.0205271055450.11012-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 26 May 2002, Jeremy Drake wrote:

> On Sun, 26 May 2002, Grant Grundler wrote:
> 
> > Jeremy Drake wrote:
> > > 2.4.18-pa26 does it too. Here's the bootup sequence.  I put in the whole
> > > thing in case anyone is interested.  If not, just skip to the bottom :)  
> > > Next time I'll just include relevant pieces.  
> > 
> > It was ok to post the whole thing.
> > Did the machine "hang"?  Can you provide "TOC" output?
> > (push TOC button on the back and then at PDC prompt "ser pim toc")

The first time I tried today, it gave the unaligned error and said the 
following in a loop on the LCD
HPMC initiated
multiple HPMCs
HPMC initiated
Runway broad err
bad OS HPMC cksm
OS HPMC br err

When I pressed the button on the back, it said
Runway broad err
and stopped.  Had to pull the power cable -- the button wouldn't work

Here's the second time

/etc/init.d/samba start
Starting Samba daemons: nmbd smbd
[hung here]

Firmware Version 5.0

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache 
  ---------  --------   ---------------------  -----------------  -------------
      0      440 MHz    Active                 Functional         512 kB/1 MB
      1      440 MHz    Idle                   Functional         512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:              536870912 bytes
  Good memory required:           46678016 bytes

  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  SCSI.6.0
  Console path:         SERIAL_1.9600.8.none
  Keyboard path:        PCI8.0.0

Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

Boot terminated.


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
Main Menu: Enter command > ser pim toc

PROCESSOR PIM INFORMATION

-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03   0000000000000000  0000000000358cf0  000000004012e987  00000000faf010d0
04-07   00000000400190b0  0000000000000018  00000000401f4ab0  00000000400190b0
08-11   40000000400190b0  0000000000000000  00000000faf00350  00000000000ba144
12-15   000000000006f800  000000000006f800  0000000000000000  0000000000000000
16-19   0000000000000000  00000000000b2248  0000000000029494  00000000401f4ab0
20-23   0000000000000000  0000000000001f38  00000000faf010e8  0000000000000018
24-27   000000000000012c  000000000ca6b064  00000000400190a4  00000000000a0944
28-31   ffffffffffffffff  00000000000000ac  00000000faf01240  000000000006b937

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000258  0000000000000000  00000000000000c0  0000000000000018
12-15   0000000000000000  0000000000000000  0000000000106000  00000000ffffffff
16-19   0000001d9616a712  000000000000012c  000000004012ea1f  000000000f541298
20-23   000000000000012c  40000000400190b0  0000000000000000  00000000a8000000
24-27   0000000000366000  000000000ca41000  0000000000044021  00000000f0412000
28-31   0000000055555555  0000000055555555  000000001ca6c000  0000000010410000
Space Registers 0 - 7

00-03   00000000          0000012c          00000000          0000012c
04-07   0000012c          0000012c          0000012c          0000012c

IIA Space                    = 0x000000000000012c
IIA Offset                   = 0x000000004012ea23
CPU State                    = 0x9e000001

Main Menu: Enter command >

And the third:
/etc/init.d/samba start
Starting Samba daemons: nmbd smbd





Firmware Version 5.0

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           Coprocessor State  I/D Cache 
  ---------  --------   ---------------------  -----------------  -------------
      0      440 MHz    Active                 Functional         512 kB/1 MB
      1      440 MHz    Idle                   Functional         512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:              536870912 bytes
  Good memory required:           46678016 bytes

  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  SCSI.6.0
  Console path:         SERIAL_1.9600.8.none
  Keyboard path:        PCI8.0.0

Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

Boot terminated.


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
Main Menu: Enter command > ser pim toc

PROCESSOR PIM INFORMATION

-----------------  Processor 0 TOC Information -------------------

General Registers 0 - 31
00-03   0000000000000000  0000000000358cf0  000000004012e987  00000000faf010d0
04-07   00000000400190b0  0000000000000018  00000000401f4ab0  00000000400190b0
08-11   40000000400190b0  0000000000000000  00000000faf00350  00000000000ba144
12-15   000000000006f800  000000000006f800  0000000000000000  0000000000000000
16-19   0000000000000000  00000000000b2248  0000000000029494  00000000401f4ab0
20-23   0000000000000000  0000000000001f38  00000000faf010e8  0000000000000018
24-27   0000000000000130  000000000ca1c064  00000000400190a4  00000000000a0944
28-31   ffffffffffffffff  00000000000000ac  00000000faf01240  000000000006b937

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000260  0000000000000000  00000000000000c0  0000000000000018
12-15   0000000000000000  0000000000000000  0000000000106000  00000000ffffffff
16-19   000000e968d9578d  0000000000000130  000000004012ea1f  000000000f541298
20-23   0000000000000130  40000000400190b0  0000000000000000  00000000a8000000
24-27   0000000000366000  000000000ca1e000  0000000000044021  00000000f0412000
28-31   0000000055555555  0000000055555555  000000001ca18000  0000000010410000
Space Registers 0 - 7

00-03   00000000          00000130          00000000          00000130
04-07   00000130          00000130          00000130          00000130

IIA Space                    = 0x0000000000000130
IIA Offset                   = 0x000000004012ea23
CPU State                    = 0x9e000001

Main Menu: Enter command > 
 

-- 
I am a man: nothing human is alien to me.
		-- Publius Terentius Afer (Terence)
