From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] HP model 612 hard disk not found
Date: Thu, 24 Feb 2005 08:10:19 -0600
Message-ID: <200502240810.19228.mszick@wolfbutter.com>
References: <1109239065.30724.15.camel@base-06.geo.auth.gr>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1109239065.30724.15.camel@base-06.geo.auth.gr>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu February 24 2005 03:57, Marios K. wrote:
> I have an old HP Model 612 with 64MB Ram, 1 Seagete scsi hard disk.
> I manage to find a scsi cdrom, so i tried to install debian.
> The scsi cable had the capability to install only one disk, so i found
> another one with possibility of connecting the hard disk and the cdrom.
> 
> I connected the hard disk on the "middle" connector of the cable and put
> the scsi id at 2.0
> 
> I connected the the cdrom on the "outer" connector and put the scsi id
> as 4.0
> 
> Booting in BOOT_ADMIN> and writing search
> The boot loader found them both.
> Seagete SCSI.2.0
> Pioneer SCSI.4.0
> 
> Ok then, i write
> boot scsi.4.0
> And the installation begins,
> After linux kernel loader, i see the it has found both cdrom and hard
> disk with the scsi id correct.
> I choose language-keyboard.
> I configure network (although it is not connected to the network for the
> moment), but when it comes to partition the disk it says
> NO HARD DISK FOUND. CONFIGURE NETWORK FOR NFS MOUNT something....
>
Could be that the installer is only looking for the primary hard disk;
which for hp, pa-risc is id 6 (secondary is id 5)...
(-- Could by I have those reversed -- Might be pri=5, sec=6 )

Try setting your scsi id numbers, disk=6, cdrom=5.
( Or the reverse of that )

OR
Configure your network, and net-boot the machine.
You can find directions on the site for doing that.

Note:
With 64M of ram, be sure to allow a generous swap
partition when you partition your disk drive.

Mike
> 
> Why the installer can't see the hard disk, while in boot time it sees
> it?
> The hard disk contains an HPUX OS.
> 
> 
> 
> 
> P.S. I apologize if this issue has already answered, but i couldn't find
> nothing on the net. I would appreciate if you cc me.
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
