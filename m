From: "Marios K." <marios_hellas_23@yahoo.gr>
Subject: [parisc-linux] HP model 612 hard disk not found
Date: Thu, 24 Feb 2005 11:57:45 +0200
Message-ID: <1109239065.30724.15.camel@base-06.geo.auth.gr>
Mime-Version: 1.0
Content-Type: text/plain
To: parisc_ <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I have an old HP Model 612 with 64MB Ram, 1 Seagete scsi hard disk.
I manage to find a scsi cdrom, so i tried to install debian.
The scsi cable had the capability to install only one disk, so i found
another one with possibility of connecting the hard disk and the cdrom.

I connected the hard disk on the "middle" connector of the cable and put
the scsi id at 2.0

I connected the the cdrom on the "outer" connector and put the scsi id
as 4.0

Booting in BOOT_ADMIN> and writing search
The boot loader found them both.
Seagete SCSI.2.0
Pioneer SCSI.4.0

Ok then, i write
boot scsi.4.0
And the installation begins,
After linux kernel loader, i see the it has found both cdrom and hard
disk with the scsi id correct.
I choose language-keyboard.
I configure network (although it is not connected to the network for the
moment), but when it comes to partition the disk it says
NO HARD DISK FOUND. CONFIGURE NETWORK FOR NFS MOUNT something....

Why the installer can't see the hard disk, while in boot time it sees
it?
The hard disk contains an HPUX OS.




P.S. I apologize if this issue has already answered, but i couldn't find
nothing on the net. I would appreciate if you cc me.


-- 
Marios K. <marios_hellas_23@yahoo.gr>


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
