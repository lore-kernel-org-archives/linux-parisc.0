Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailg.telia.com (mailg.telia.com [194.22.194.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62FCC482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 18 Oct 2001 12:43:31 -0600 (MDT)
Date: Thu, 18 Oct 2001 20:43:21 +0200
From: Daniel Engstrom <5116@telia.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Richard Hirst <rhirst@linuxcare.com>,
	Daniel Engstrom <5116@telia.com>,
	parisc-linux@lists.parisc-linux.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [parisc-linux] New scsi driver for 53c700 and 53c710 committed
Message-ID: <20011018204321.A6663@zaphod.halden.lillfab.se>
References: <rhirst@linuxcare.com> <200110171419.f9HEJbH01686@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <200110171419.f9HEJbH01686@localhost.localdomain>; from James.Bottomley@HansenPartnership.com on Wed, Oct 17, 2001 at 16:19:37 +0200
List-ID: <linux-parisc.vger.kernel.org>

On 2001.10.17 16:19 James Bottomley wrote:
> This one looks like it might be the second new feature of the driver: tag 
> command queuing.
> 
> Could you post the boot messages of the failure case (or at least the device 
> identifications and whether the driver has enabled TCQ [message like scsi1: 
> (5:0) Enabling Tag Command Queuing)].
They do, see below.

/Daniel

SCSI subsystem driver Revision: 1.00
53c700: consistent memory allocation failed
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0 
scsi0 : LASI SCSI 53c700
  Vendor: QUANTUM   Model: FIREBALL_TM3200S  Rev: 300X
  Type:   Direct-Access                      ANSI SCSI revision: 02
  Vendor: QUANTUM   Model: FIREBALL ST3.2S   Rev: 0F0C
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 5, lun 0
Attached scsi disk sdb at scsi0, channel 0, id 6, lun 0
scsi0: (5:0) Enabling Tag Command Queuing
SCSI device sda: 6281856 512-byte hdwr sectors (3216 MB)
Partition check:
 sda: sda1 sda2 sda3 sda4
scsi0: (6:0) Enabling Tag Command Queuing
SCSI device sdb: 6328861 512-byte hdwr sectors (3240 MB)
 sdb: unknown partition table
-- 
