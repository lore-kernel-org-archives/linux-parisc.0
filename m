Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA12378
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 08:39:39 -0700
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id JAA25460
	for <parisc-linux@thepuffingroup.com>; Wed, 24 Jan 2001 09:43:32 -0600
Date: Wed, 24 Jan 2001 09:43:32 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <20010120115417.4CD28D1585@mail.esiee.fr>
Message-ID: <Pine.LNX.4.21.0101240937380.25434-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C100 and newest CVS bits
List-ID: <linux-parisc.vger.kernel.org>


I checked out the newest CVS bits and built a new kernel that dies on my
C100.  Serial console seems to be working better though.  It's dying in or
right after the SCSI setup.  The tail of the boot messages is below.  Both
of my disks were working with an earlier kernel.  Any suggestions?

- Greg

SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 86, options 0
scsi0: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: Good, target data areas are dma coherent
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: SEAGATE   Model: ST11200N SUN1.05  Rev: 8358
  Type:   Direct-Access                      ANSI SCSI revision: 02
zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
ncr53c8xx: 53c720 detected
ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
ncr53c720-0: restart (scsi reset).
scsi1 : ncr53c8xx - version 3.3b
  Vendor: SEAGATE   Model: ST32430W          Rev: HP05
  Type:   Direct-Access                      ANSI SCSI revision: 02
ncr53c720-0-<6,0>: tagged command queue depth set to 8
Detected scsi disk sda at scsi0, channel 0, id 0, lun 0
Detected scsi disk sdb at scsi1, channel 0, id 6, lun 0
 
ccio-dma.c:738: Assertion size > 0 failed!
Kernel panic: size > 0                                                          
