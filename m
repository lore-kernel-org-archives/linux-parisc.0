Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B0694829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 11:23:58 -0600 (MDT)
Date: Mon, 23 Sep 2002 10:23:52 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP kernel problems on a D350 
In-Reply-To: <20020921044102.3DD104829@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0209231021010.20374-100000@garibaldi.apptechsys.com>
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

On Fri, 20 Sep 2002, Grant Grundler wrote:

> If you have time, could you reproduce the "lockup" and then hit "TOC" button?
> If you cancel autoboot and get a PDC prompt (eg "BOOT_ADMIN>"), "ser pim"
> output will contain machine state when it was TOCed. Capture and Post that 
> output to the mailing list and someone might see what the problem is.
> 

OK.  Here it is....  The kernel is 2.4.19-64-smp from unstable, version 
18.1, so the System.map can be found there...

krakatoa:~# /bin/sh /etc/init.d/setserial start
Loading the saved-state of the serial devices...
Cannot set serial info: Device or resource busy
/dev/ttyS0 at 0x03f8 (irq = 195) is a 16550A

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

  Primary boot path:    FWSCSI.5.0
  Alternate boot path:  FWSCSI.6.0
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
00-03   0000000000000000  0000000010478480  000000001010ded4  0000000010435ac8
04-07   0000000000000041  0000000000000001  0000000000000000  0000000000000000
08-11   000000001054b5a0  0000000000000003  00000000105b8b40  00000000105646cc
12-15   0000000000000000  00000000ffffffff  0000000000000001  00000000f0400004
16-19   00000000105b8b40  00000000f000017c  00000000f0000174  0000000000000000
20-23   0000000000000000  0000000000000000  00000000104456a0  00000000105555a0
24-27   00000000105b8b40  0000000000000041  0000000010435ac8  000000001054b5a0
28-31   0000000000000000  00000000105b8ef0  00000000105b9000  000000001055e5a0

<Press any key to continue (q to quit)> 

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   000000000000295a  0000000000000000  00000000000000c0  000000000000003f
12-15   0000000000000000  0000000000000000  0000000000107000  0000000000000000
16-19   00005f379490dc48  0000000000000000  000000001010de1c  0000000000000000
20-23   0000000000000000  0000000000000000  0000007f082cff0e  a000000000000000
24-27   0000000000487000  0000000015bc1000  0000000000044021  00000000f0412000
28-31   0000000055555555  0000000055555555  00000000105b8000  00000000105c0000
Space Registers 0 - 7

00-03   000a5680          000a5680          00000000          000a5680
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x000000001010de0c
CPU State                    = 0x9e000001

Main Menu: Enter command > 

Main Menu: Enter command > reset

Resetting...


-- 
If a child annoys you, quiet him by brushing his hair.  If this doesn't
work, use the other side of the brush on the other end of the child.
