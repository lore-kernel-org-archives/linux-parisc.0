Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blueyonder.co.uk (pcow034o.blueyonder.co.uk [195.188.53.122])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B1254832
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Jun 2001 18:45:52 -0600 (MDT)
Sender: dscobbie@dsl2.external.hp.com
Message-ID: <3B3A7E3D.394759D6@blueyonder.co.uk>
Date: Thu, 28 Jun 2001 01:45:49 +0100
From: Donald Scobbie <dscobbie@blueyonder.co.uk>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] External SCSI Disk
List-ID: <linux-parisc.vger.kernel.org>

I attached an external SCSI disk to my 712/80 which has the
palinux-0.9 32 bit serial distribution installed on the internal
disk:

BOOT_ADMIN> sea

Searching for potential boot device.
This may take several minutes.

To discontinue, press ESCAPE.

   Device Path              Device Type
   -----------              -----------
   scsi.6.0                 QUANTUM FIREBALL1050S
   scsi.2.0                 SEAGATE ST32151N

BOOT_ADMIN> boo

Can anyone guess what happened next? 

SCSI subsystem driver Revision: 1.00
sim700: Configuring 53c710 (SCSI-ID 7) at f0106100, IRQ 86, options 0
scsi0: Revision 0x2
Post test1, istat 01, sstat0 00, dstat 84
sim700: WARNING IRQ probe failed, (returned 0)
scsi0: Good, target data areas are dma coherent
scsi0: test 1 completed ok.
scsi0 : LASI/Simple 53c7xx
  Vendor: SEAGATE   Model: ST32151N          Rev: HP02
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: QUANTUM   Model: FIREBALL1050S     Rev: 630C
  Type:   Direct-Access                      ANSI SCSI revision: 02
Detected scsi disk sda at scsi0, channel 0, id 2, lun 0
Detected scsi disk sdb at scsi0, channel 0, id 6, lun 0
SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
Partition check:
 sda: unknown partition table
SCSI device sdb: 2051460 512-byte hdwr sectors (1050 MB)
 sdb: sdb1 sdb2 sdb3
[deleted lines]
VFS: Cannot open root device "sda3" or 08:03
Please append a correct "root=" boot option
Kernel panic: VFS: Unable to mount root fs on 08:03

The code in drivers/scsi/sd.c assigns /dev/sda to the lowest SCSI
id and works up the way. Fair enough. IIRC SCSI id's are prioritised
7->0 for narrow SCSI and 7->0, 15->8 for wide. Should device allocation
reflect this pattern? Surely it has to for hppa where the internal 
disk has id 6 preset?

Any suggestions?

Cheers

Donald
