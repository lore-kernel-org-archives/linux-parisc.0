Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A6B6482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Jun 2001 06:25:29 -0600 (MDT)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA18466
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Jun 2001 06:17:47 -0600
From: jheumann@fonts.de
Sender: jheumann@mailserv2.iuinc.com
Message-ID: <3B1CB312.1C9DBAB9@fonts.de>
Date: Tue, 05 Jun 2001 12:23:14 +0200
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: [parisc-linux] 0.9ser can't install on D210
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

please help,

i can't load linux pa-risc 0.9seriell on my HP9000/D210.
Why?

(HP-UX 10.20 is running....)

Jan Heumann
jheumann@fonts.de
-----------------------------------------------------
Main Menu: Enter command > search

Searching for potential boot device(s)...
This may take several minutes.

To discontinue search, press any key (termination may not be immediate).



   Path Number        Device Path (dec)        Device Type
   -----------        -----------------        -----------
   P0                 4.5                      Random access media
   P1                 4.8                      Random access media
   P2                 16/5.2                   Random access media
   P3                 16/6.0                   LAN Module


Main Menu: Enter command > boot p2
Interact with IPL (Y or N)?> n

Booting...
Boot IO Dependent Code (IODC) revision 1

IPL error: bad IPL checksum.

Error Reading IPL

Main Menu: Enter command > search

Searching for potential boot device(s)...
This may take several minutes.

To discontinue search, press any key (termination may not be immediate).



   Path Number        Device Path (dec)        Device Type
   -----------        -----------------        -----------
   P0                 4.5                      Random access media
   P1                 4.8                      Random access media
   P2                 16/5.2                   Random access media
   P3                 16/6.0                   LAN Module


Main Menu: Enter command > boot p2
Interact with IPL (Y or N)?> y

Booting...
Boot IO Dependent Code (IODC) revision 1

IPL error: bad IPL checksum.

Error Reading IPL

--------------------------------------------------------

information all

PROCESSOR INFORMATION

             HVERSION  SVERSION   CVERSION
    Speed     Model    Model/Op  (Revision)
  ---------  --------  --------  ----------
   100 MHz    0x4840    0x0481       12

  HSC Bus Speed (in MHz) :         33
  Software ID (dec)      : 2009187834
  Software ID (hex)      : 0x77c1c5fa
  Software Capability    : 0xf0


<Press any key to continue (q to quit)>

COPROCESSOR INFORMATION

      Coprocessor      Coprocessor       Coprocessor
         Model          Revision            State
      -----------      -----------      -------------
       0x0000000d              1         Functional


CACHE INFORMATION

      Instruction Cache Size    Data Cache Size
      -----------------------   ---------------
       128 KB                    128 KB

<Press any key to continue (q to quit)>

MEMORY INFORMATION

   Slot        Card Size        Amount Enabled
   ----        ---------        --------------
    0            64 MB            64 MB
    1            64 MB            64 MB
    2            64 MB            64 MB
    3            64 MB            64 MB
    4            64 MB            64 MB
    5            64 MB            64 MB

  Physical Memory:     384 MB      (0x18000000)
  Configured Memory:   384 MB      (0x18000000)

<Press any key to continue (q to quit)>

I/O MODULE INFORMATION
                                                               IODC
IODC
Path (dec)   Type                Slot Mod HVERSION  SVERSION   Vers
Dep
----         ----                ---- --- -------- ---------- ------
------
4            A DMA I/O             1   0   0x0131  0x00008980  0x07
0x00
16           Bus Adapter           4   0   0x02e0  0x00008100  0x00
0x00
16/4         Built-in RS232        1   0   0x02e0  0x00008c00  0x01
0x00
16/5         Built-in SE SCSI      1   1   0x02e0  0x00008200  0x01
0x00
16/6         Built-in LAN          1   2   0x02e0  0x00008a00  0x02
0x00
16/0         Built-in Parallel     0   0   0x02e0  0x00007400  0x00
0x00
16/7         Built-in Keyboard     1   3   0x02e0  0x00008400  0x00
0x00
16/8         Built-in Mouse        2   0   0x02e0  0x00008400  0x00
0x00
20           Bus Adapter           5   0   0x0300  0x00008e00  0x00
0x00
20/2         RS232 Port            0   2   0x0300  0x00008c00  0x01
0x00
20/5         Bus Adapter           1   1   0x0300  0x00009000  0x00
0x00

<Press any key to continue (q to quit)>

Hot Swap module is present.

EISA Cards

Path        Type                            EISA ID
----        ----                            -------
20/5/1      EISA card                       0x25d00400
20/5/2      EISA slot is empty
20/5/3      EISA slot is empty
20/5/4      EISA slot is empty

<Press any key to continue (q to quit)>

BOOT INFORMATION

  Autoboot:             ON
  Autosearch:           ON
  Fastboot:             OFF

  Primary boot path:    4.8   (dec)
                        04.8   (hex)
  Alternate boot path:  16/5.2   (dec)
                        10/05.2   (hex)
  Console path:         16/4.0   (dec)
                        10/04.0   (hex)
  Keyboard path:        16/7.0   (dec)
                        10/07.0   (hex)

  LAN Station Address:  080009-af13c8

  Mon Jan  5 21:15:36 GMT 1970    (19:70:01:05:21:15:36)

<Press any key to continue (q to quit)>

FIRMWARE INFORMATION

  Firmware Version:     36.34


CHIP REVISIONS

  Module                           Revision
  ------                           --------
  System Board                     0
  Processor Board                  2
  PA 7100LC                        12
  Firmware                         20
  Fast/Wide SCSI Board             1
  Multifunction I/O Controller     0
  EISA Interface                   0

<Press any key to continue (q to quit)>

WARNINGS

No warnings to report.

Information Menu: Enter command >
