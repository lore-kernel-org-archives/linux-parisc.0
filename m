Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id VAA28582
	for <parisc-linux@puffin.external.hp.com>; Sat, 23 Oct 1999 21:45:16 -0600
Received: from enterprise (host-216-78-43-110.ath.bellsouth.net [216.78.43.110])
	by mail1.atl.bellsouth.net (3.3.5alt/0.75.2) with SMTP id XAA09328
	for <parisc-linux@thepuffingroup.com>; Sat, 23 Oct 1999 23:41:39 -0400 (EDT)
Reply-To: <JHamilton@Earthling.Net>
From: "Justin Hamilton" <JHamilton@Earthling.Net>
To: <parisc-linux@thepuffingroup.com>
Date: Sat, 23 Oct 1999 23:44:00 -0400
Message-ID: <NDBBKIEANAMHBNPAILKPKEBECEAA.JHamilton@Earthling.Net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <199910221606.JAA00597@milano.cup.hp.com>
Subject: [parisc-linux] Trying to boot on an N-Class
List-ID: <linux-parisc.vger.kernel.org>

Here's what I get when trying to boot the kernel on an N-Class:

Firmware Version  39.25

Duplex Console IO Dependent Code (IODC) revision 1

----------------------------------------------------------------------------
--
   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved
----------------------------------------------------------------------------
--

  Processor   Speed            State           CoProcessor State  CacheSize
  Number                                       State              Inst
Data
  ---------  --------   ---------------------  -----------------  ----------
--
      1      360  MHz   Active                 Functional         512KB   1
MB
      3      360  MHz   Idle                   Functional         512KB   1
MB

  Central Bus Speed (in MHz)  :        120
  Available Memory            :    2097152  KB
  Good Memory Required        :     140844  KB

   Primary boot path:    1/10/0/0.8
   Alternate boot path:  0/0/2/1.6
   Console path:         0/0/4/0.0
   Keyboard path:        0/0/4/0.0


Processor is booting from first available device.

To discontinue, press any key within 10 seconds.

Boot terminated.

Main Menu: Enter command or menu > bo 1/10/0/0.8.1
Interact with IPL (Y, N, or Cancel)?> n

Booting...
Boot IO Dependent Code (IODC) revision 1


HARD Booted.

----------------------------------------------------------------------------
--

PARISC/Linux Bootstrap Version 0.6 (non-interactive)
By Helge Deller & Jason Eckhardt
Built Wed Oct 20 04:01:37 EDT 1999 by chris@rum

Reading parameters...done.

Loading PA-RISC/Linux Kernel...
No ramdisks available.
SOM-Kernel:
aux_header_location: 00000080
som       : 00200080
exec_dfile: 000B4000
exec_dsize: 0007F000
exec_dmem : C008A000
exec_tfile: 0003A000
exec_tsize: 00079008
exec_tmem : C0010000
Code at 0x00010000, size=0x00079008
Data at 0x0008A000, size=0x0007F000
BSS  at 0x00109000.

Transferring control to kernel. (At entry point 0x00010000)

And this is where it sits.

Is this kind of info useful to anyone?  Am I expecting too much at this
stage in development?

Justin Hamilton
Unix Systems Engineer.
