Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sccrmhc03.attbi.com (sccrmhc03.attbi.com [204.127.202.63])
	by dsl2.external.hp.com (Postfix) with ESMTP id D6EB8482B
	for <parisc-linux@lists.parisc-linux.org>; Sat,  4 Jan 2003 11:08:04 -0700 (MST)
From: "Steve Cornett" <stevec@bullseye.com>
To: "'Grant Grundler'" <grundler@dsl2.external.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] B1000 Debian 3.0r1 High-Priority Machine Check
Date: Sat, 4 Jan 2003 10:07:59 -0800
Message-ID: <000001c2b41c$37348cf0$a87ba8c0@steve>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20030104015526.GB29245@dsl2.external.hp.com>
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

> Steve, can you try the beta Boot Floppies?
My B1000 cannot seem to boot from floppy.  I verified my floppy drive
works from HP-UX.  When I use the firmware command "boot floppy" I
immediately get the error shown below, without an attempt to read from
the floppy drive.

Firmware Version 5.0
...
Main Menu: Enter command > boot floppy
ERROR:  Not a boot path
Main Menu: Enter command > in
Information Menu: Enter command > io
I/O MODULE INFORMATION
 
IODC IODC
Path         Decimal     Type                  Location   HVER SVER
Vers Dep
------------ ----------- --------------------- ---------- ---- ----
---- ----
LAN          10/0/12/0   Ethernet              built-in   0050 a200
0x02 0x00
AUDIO        10/0/13/0   Audio                 built-in   
IDE          10/0/14/0   IDE                   built-in   0050 a300
0x00 0x00
SUPERIO MISC 10/0/14/1   Bridge Device         built-in   
FLOPPY       10/0/14/1/0 Floppy Disk           built-in   
SERIAL_1     10/0/14/1/1 RS232 Port            built-in   0050 8c00
0x01 0x00
SERIAL_2     10/0/14/1/2 RS232 Port            built-in   0050 8c00
0x01 0x00
PARALLEL     10/0/14/1/3 Parallel Port         built-in   
USB          10/0/14/2   USB                   built-in   0050 a900
0x98 0x00
SCSI         10/0/15/0   SCSI                  built-in   0050 a300
0x00 0x00
FWSCSI       10/0/15/1   SCSI                  built-in   0050 a300
0x00 0x00
GRAPHICS(2)  10/6/2/0    PCI_GRAFFITIX1024     slot 2     0070 8500
0x01 0x00

Main Menu: Enter command > boot 10/0/14/1/0

ERROR:  Not a boot path
