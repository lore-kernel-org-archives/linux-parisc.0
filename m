Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3CA1E4A18
	for <parisc-linux@lists.parisc-linux.org>; Thu,  1 Feb 2001 04:42:11 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA26260
	for <parisc-linux@puffin.external.hp.com>; Thu, 1 Feb 2001 04:37:52 -0700
From: penfold@customware.com.au
Received: from customware.com.au (CPE-144-132-17-132.vic.bigpond.net.au [144.132.17.132])
	by mr14.vic-remote.bigpond.net.au (Pro-8.9.3/8.9.3) with ESMTP id WAA18952
	for <parisc-linux@thepuffingroup.com>; Thu, 1 Feb 2001 22:41:28 +1100 (EDT)
Received: (from penfold@localhost)
	by customware.com.au (8.9.3/8.8.7) id WAA11608
	for parisc-linux@thepuffingroup.com; Thu, 1 Feb 2001 22:41:20 +1100
Message-Id: <200102011141.WAA11608@customware.com.au>
To: parisc-linux@thepuffingroup.com
Date: Thu, 1 Feb 2001 22:41:19 +1100 (EST)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 720/50 SCSI - supported?
List-ID: <linux-parisc.vger.kernel.org>

Hi,

after successfully cross compiling a kernel, I have a problem!

The initial bus scan seems to see the scsi controller:
model   00002000 00000481 00000000 00000000 775e3623 000011f4 00000004 0000000d
00000000
vers    00000003
CPUID   vers 0 rev 0
model   9000/720
led_init: CPU_HVERSION 200
Searching for devices in PDC firmware... processor hpa 0xfffbe000
 an older box...
Found devices:
1. Cobra Core BA (11) at 0xf082f000, versions 0x4, 0x0, 0x70, 0x0, 0x0
2. Cobra Core SCSI (10) at 0xf0825000, versions 0x4, 0x0, 0x71, 0x0, 0x0

but the driver seems to have a problem here!

SCSI subsystem driver Revision: 1.00
sim700: Couldn't get consistent shared memory
sim700: Configuring 53c700 (SCSI-ID 7) at f0825100, IRQ 86
scsi0: Revision 0x0
Post test1, istat 05, sstat0 00, dstat 81
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: test 1 FAILED: dsps: exp 0xab93001d, got 0x65686361
scsi0: Chip register contents:
 (script[0] at virt c7f70000, bus 7f70000)
 00  sien:  af  sdid:  00  scntl1:20  scntl0:c4
 04  socl:  00  sodl:  00  sxfer: 00  scid:  80
 08  sbcl:  00  sbdl:  00  sidl:  00  sfbr:  00
 0C  sstat2:00  sstat1:00  sstat0:00  dstat: 80
 10
 14  ctest3:92  ctest2:21  ctest1:f0  ctest0:00
 18  ctest7:00  ctest6:53  ctest5:00  ctest4:00
 1C  temp:  00000000
 20              ctest8:ff  istat: 06  dfifo: 32
 24  dbc:   635f7472  dnad:  65686361  dsp:   07f774b4
 30  dsps:  65686361
 34  dmode: 80
 38  dcntl: 80  dwt:   00  dien:  1d
 3C
Warning : device (10, 0x4, 0x0, 0x71, 0x0) NOT claimed by Lasi SCSI 53c700

Is this a known problem ?

thanks,

Damian
penfold@customware.com.au
