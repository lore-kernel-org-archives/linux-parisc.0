Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69371482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 29 Jun 2001 17:02:59 -0600 (MDT)
Message-Id: <200106292302.RAA27477@puffin.external.hp.com>
To: Donald Scobbie <dscobbie@blueyonder.co.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] External SCSI Disk 
In-Reply-To: Your message of "Thu, 28 Jun 2001 01:45:49 BST."
             <3B3A7E3D.394759D6@blueyonder.co.uk>
Date: Fri, 29 Jun 2001 17:02:28 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Donald Scobbie wrote:
> I attached an external SCSI disk to my 712/80 which has the
> palinux-0.9 32 bit serial distribution installed on the internal
> disk:
...
>    Device Path              Device Type
>    -----------              -----------
>    scsi.6.0                 QUANTUM FIREBALL1050S
>    scsi.2.0                 SEAGATE ST32151N
> 
> BOOT_ADMIN> boo

Try "bo scsi.2.0" instead?
Just using "boot" will default to whatever the primary path is.

> The code in drivers/scsi/sd.c assigns /dev/sda to the lowest SCSI
> id and works up the way. Fair enough. IIRC SCSI id's are prioritised
> 7->0 for narrow SCSI and 7->0, 15->8 for wide. Should device allocation
> reflect this pattern?

It could. Search the mail archives - I've complained about this before.

>  Surely it has to for hppa where the internal 
> disk has id 6 preset?

It doesn't. 

> Any suggestions?

Make sure your partition layout doesn't cross the 2GB boundary for
the /boot or 0xf0 partition. palo documentation has the best explanation
of the PDC limitations I know of.

In general, I'm guessing that the scsi.6.0 has palinux installed on it
and the scsi.2.0 disk isn't partitioned with a compatible format for
some reason.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253
