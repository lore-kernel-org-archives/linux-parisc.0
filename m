Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA13301
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 14:56:26 -0600
Received: from udlkern.fc.hp.com (root@udlkern.fc.hp.com [15.1.52.48])
	by hpfcla.fc.hp.com (8.9.1/8.9.1) with ESMTP id OAA12768
	for <parisc-linux@thepuffingroup.com>; Thu, 21 Oct 1999 14:57:21 -0600 (MDT)
Received: from debian.fc.hp.com (root@debian.fc.hp.com [15.1.48.119]) by udlkern.fc.hp.com with ESMTP (8.8.6 (PHNE_14041)/8.7.1) id OAA23116 for <parisc-linux@thepuffingroup.com>; Thu, 21 Oct 1999 14:57:20 -0600 (MDT)
Received: from debian.fc.hp.com (bame@localhost [127.0.0.1])
	by debian.fc.hp.com (8.9.3/8.9.3/Debian/GNU) with ESMTP id OAA19923
	for <parisc-linux@thepuffingroup.com>; Thu, 21 Oct 1999 14:57:20 -0600
Message-Id: <199910212057.OAA19923@debian.fc.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Thu, 21 Oct 1999 14:57:20 -0500
From: Paul Bame <bame@debian.fc.hp.com>
Subject: [parisc-linux] Boot messages from C3000 console
List-ID: <linux-parisc.vger.kernel.org>


This is long.  Thanks to Alex Williamson for this -

The short answer is once control is apparently transferred to the
kernel, the system dies hard.  Someone who can read PIM dumps
might deduce more from this log.

	-Paul Bame

Information Menu: Enter command > io


I/O MODULE INFORMATION

                                                                     IODC IODC
Path         Decimal     Type                  Location   HVER SVER  Vers Dep
- ------------ ----------- --------------------- ---------- ---- ----  ---- ----
LAN          10/0/12/0   Ethernet              built-in   0060 a200  0x02 0x00
AUDIO        10/0/13/0   Audio                 built-in   
IDE          10/0/14/0   IDE                   built-in   0060 a300  0x00 0x00
SUPERIO MISC 10/0/14/1   Bridge Device         built-in   
SERIAL_1     10/0/14/1/1 RS232 Port            built-in   0060 8c00  0x01 0x00
SERIAL_2     10/0/14/1/2 RS232 Port            built-in   0060 8c00  0x01 0x00
PARALLEL     10/0/14/1/3 Parallel Port         built-in   
USB          10/0/14/2   USB                   built-in   0060 a900  0x98 0x00
SCSI         10/0/15/0   SCSI                  built-in   0060 a300  0x00 0x00
FWSCSI       10/0/15/1   SCSI                  built-in   0060 a300  0x00 0x00
GRAPHICS(2)  10/6/2/0    Display               slot 2     0070 8500  0x01 0x00

Information Menu: Enter command > ma

- ----- Main Menu -------------------------------------------------------------

      Command                           Description
      -------                           -----------
      BOot [PRI|ALT|<path>]             Boot from specified path
      PAth [PRI|ALT|CON|KEY] [<path>]   Display or modify a path
      SEArch [DIsplay|IPL] [<path>]     Search for boot devices

      COnfiguration [<command>]         Access Configuration menu/commands
      INformation [<command>]           Access Information menu/commands
      SERvice [<command>]               Access Service menu/commands

      DIsplay                           Redisplay the current menu
      HElp [<menu>|<command>]           Display help for menu or command
      RESET                             Restart the system
- -----
Main Menu: Enter command > bo lan.15.1.55.151

Interact with IPL (Y, N, Q)?> n



Booting... 
Network Station Address 001083-354faa

System IP Address 15.1.52.165
Server IP Address 15.1.55.151


Boot IO Dependent Code (IODC) revision 2




HARD Booted.


- ------------------------------------------------------------------------------

PARISC/Linux Bootstrap Version 0.6 (non-interactive)
By Helge Deller & Jason Eckhardt
Built Thu Oct 21 12:03:52 MDT 1999 by bame@burmese

Reading parameters...done.

Loading PA-RISC/Linux Kernel...
No ramdisks available.
SOM-Kernel:
aux_header_location: 00000080
som       : 00200080
exec_dfile: 000DD000
exec_dsize: 00084000
exec_dmem : C00A9000
exec_tfile: 00044000
exec_tsize: 00098008
exec_tmem : C0010000
Code at 0x00010000, size=0x00098008
Data at 0x000A9000, size=0x00084000
BSS  at 0x0012D000.

Transferring control to kernel. (At entry point 0x00010000)



Firmware Version 1.8


Duplex Console IO Dependent Code (IODC) revision 1

- ------------------------------------------------------------------------------

   (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved

- ------------------------------------------------------------------------------


  Processor   Speed            State           Coprocessor State  I/D Cache 

  ---------  --------   ---------------------  -----------------  -------------

      0      400 MHz    Active                 Functional         512 kB/1 MB

  Central Bus Speed:                   120 MHz

  Available memory:              805306368 bytes
  Good memory required:           82538496 bytes

  Primary boot path:    FWSCSI.6.0
  Alternate boot path:  SCSI.6.0
  Console path:         GRAPHICS(2)
  Keyboard path:        USB


CPU 0
WARNING:  Self tests have been disabled as a result of FASTBOOT
          being enabled.  To enable self tests, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.
WARNING:  Memory has been initialized, but not tested as a result of
          FASTBOOT being enabled.  To test memory, use the FASTBOOT
          command in the CONFIGURATION menu and reboot the system.



Processor is starting auto boot process.


To discontinue, press any key within 10 seconds.


Boot terminated.

~`x

- ----- Main Menu -------------------------------------------------------------

      Command                           Description
      -------                           -----------
      BOot [PRI|ALT|<path>]             Boot from specified path
      PAth [PRI|ALT|CON|KEY] [<path>]   Display or modify a path
      SEArch [DIsplay|IPL] [<path>]     Search for boot devices

      COnfiguration [<command>]         Access Configuration menu/commands
      INformation [<command>]           Access Information menu/commands
      SERvice [<command>]               Access Service menu/commands

      DIsplay                           Redisplay the current menu
      HElp [<menu>|<command>]           Display help for menu or command
      RESET                             Restart the system
- -----
Main Menu: Enter command > ser pim



PROCESSOR PIM INFORMATION



- -----------------  Processor 0 HPMC Information ------------------


Timestamp = 
  Thu Oct  21 20:18:08 GMT 1999    (19:99:10:21:20:18:08)

HPMC Chassis Codes = 2cbf0  2500b  2cbf5  2cbfc  

General Registers 0 - 31
00-03   0000000000000000  ffffffffffffffff  00000000000100c4  0000000000504000
04-07   0000000000504010  0000000000504000  0000000000000048  00000000f0002f88
08-11   0050427700000002  000000000000004d  000000000012c320  000000000000000a
12-15   0000000000000000  00000000ffffffff  0000000000000000  00000000f0400004
16-19   000000f0f00008a4  000000f0f0000160  000000f0f0000158  fffffffffff80810
20-23   0000000003000000  0000000000001000  0000000000000000  00000000000c0000
24-27   0000000000000000  0000000000000001  00000000c0159610  ffffffffc00a8000
28-31   ffffffffffffffff  00000000000ac948  00000000000ac400  0200000000000204

<Press any key to continue (q to quit)> 


Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  000000000000003c
12-15   0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19   0000001d9f33c26d  0000000000000000  0000000000010184  000000000e601181
20-23   00000000a627ffff  c0000000e0380810  0000000000000009  0000000080000000
24-27   00000000fdffffff  00000000ffffffff  0000000000000002  0000000008000009
28-31   00000000fdffffff  00000000ffffffff  00000000fdffffff  00000000fdffffff
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

<Press any key to continue (q to quit)> 

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000000010188
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x000000fffff80810
System Requestor Address     = 0x000000fffffa0000

Floating-Point Registers 0 - 31
00-03   ffd00fbfffffffdf  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
04-07   ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
08-11   ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
12-15   ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
16-19   ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
20-23   ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
24-27   ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff
28-31   ffffffffffffffff  ffffffffffffffff  ffffffffffffffff  ffffffffffffffff

<Press any key to continue (q to quit)> 


'B1000/C3000/J5000/J7000 Unarchitected (per-CPU)', revision 1, 140 bytes:

Check Summary                = 0xcb81041008000000
Available Memory             = 0x0000000030000000
CPU Diagnose Register 2      = 0x0200000000000204
CPU Status Register 0        = 0x2420c20000000000
CPU Status Register 1        = 0x8002000000000000
SADD LOG                     = 0x0000000000000000
Read Short LOG               = 0xc1af00fffff80810
ERROR_STATUS                 = 0x0000000000100010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0xc1bff0fffed08040
RUN_DATA_LOW                 = 0xc1bff0fffed08040
RUN_CTRL                     = 0x0000021c00001418
RUN_ADDR                     = 0xc1bff0fffed08040
System Responder Path        = 0x00ffffffffffffff

<Press any key to continue (q to quit)> 


- -----------------  Processor 0 LPMC Information ------------------


Check Type                   = 0x00000000
I/D Cache Parity Info        = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000



- -----------------  Processor 0 TOC Information -------------------


General Registers 0 - 31
00-03   0000000000000000  000000f0f0093000  000000f0f000b658  00000000000f4240
04-07   00000020317d230d  0000000000000004  000000f0f0407aa8  0000000000000000
08-11   000000f0f0407aa8  000000000000004d  000000000012c320  000000000000000a
12-15   0000000000000000  00000000ffffffff  0000000000000000  00000000f0400004
16-19   000000f0f00008a4  000000f0f0000160  000000f0f0000158  000000f0f0077270
20-23   000000f0f05f0068  0000000000000004  0000000000000008  000000f0f003c3ac
24-27   0000000009f9c6f0  000000003d090000  0000000017d78400  000000f0f0412000
28-31   0000000017d78400  0000000000000008  000000f0f0407d68  000000f0f00772f0

<Press any key to continue (q to quit)> 


Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  0000000000000005
12-15   0000000000000000  0000000000000000  000000f0f0003800  0000000000000000
16-19   000000203b7aaa7c  00000000000000f0  000000f0f000b664  00000000020008b8
20-23   000000009237c3c1  0000000001c07d10  000000ff0809cf08  0000000080000000
24-27   00000000fdffffff  00000000ffffffff  0000000000000002  0000000008000009
28-31   00000000fdffffff  00000000ffffffff  00000000fdffffff  00000000fdffffff
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x00000000000000f0
IIA Offset                   = 0x000000f0f000b65c
CPU State                    = 0x0000004d


<Press any key to continue (q to quit)> 


Memory Error Log Information:


Timestamp = 
  Thu Oct  21 20:18:08 GMT 1999    (19:99:10:21:20:18:08)


'B1000/C3000/J5000/J7000 Memory Error Log', revision 0, 64 bytes:

   No memory errors logged




I/O Module Error Log Information:


Timestamp = 
  Thu Oct  21 20:18:08 GMT 1999    (19:99:10:21:20:18:08)


'B1000/C3000/J5000/J7000 IO Error Log', revision 0, 228 bytes:

 Rope     Word1        Word2            Word3
- ------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc009   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    0x00000000   0x4e0cc009   0x00000000fed38048
   5    ----------   0x5e0cc009   ------------------
   6    0x00000000   0x6e0cc009   0x00000000fed3c048
   7    ----------   0x7e0cc009   ------------------
Main Menu: Enter command > 
- --------------6D46321F53F67470D064CBF0--



------- End of Forwarded Message
