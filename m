Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.latnet.lv (mail.latnet.lv [159.148.108.208])
	by dsl2.external.hp.com (Postfix) with SMTP id 8051548C3
	for <parisc-linux@lists.parisc-linux.org>; Wed,  9 Jul 2003 07:04:22 -0600 (MDT)
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Corrections for RAID1 howto and Resyncing after failure
Message-ID: <1057755859.3f0c12d38f8b9@clients.latnet.lv>
Date: Wed, 09 Jul 2003 16:04:19 +0300 (EEST)
From: Dub <dub@latnet.lv>
References: <1057687402.3f0b076a99c5d@clients.latnet.lv> <yq1llv8dbin.fsf@wilson.mkp.net>
In-Reply-To: <yq1llv8dbin.fsf@wilson.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
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

Hi,

> 
> Odd.  I'm running mdadm 1.2.0 and it says:
> 
>         allegro:~# mdadm --create --help 2>&1 | grep raid-dev
>         Usage:  mdadm --create device -chunk=X --level=Y
> --raid-devices=Z devices
>           --raid-devices= -n : number of active devices in array
> 
> Maybe Neil changed it in a later version?

I downloaded the only  stable version mdadm 0.7.2-2 from ftp.debian.org.   

# mdadm --create --help 2>&1 | grep raid-d
Usage:  mdadm --create device -chunk=X --level=Y --raid-disks=Z devices

I guess it would be nice to mention the difference in the FAQ
 
> Well.  If the disk is no longer part of the metadevice, you manually
> have to add it using the mdadm command.
> 
> It would be quite dangerous if the RAID code decided to add things to
> an array just because a disk is inserted (fine for a storage
> appliance, bad idea for a server).
OK, thank you!


> Yes read in
<http://www.ibiblio.org/pub/Linux/docs/howto/other-formats/html_single/SCSI-2.4-HOWTO.html#mlproc>
> 
> that in Linux 2.4: "The SCSI subsystem does not support hot-plugging
of SCSI
> devices ..."

I just made another test. I pull out 2 mirrored disk (root and var). The system
was running well. However, it seems that md software did not notice absense of
disk until someone tries to write there (I was forced to create a file in /boot
partition so that md understands the failure).

Then I rebooted the system without two disks. PDC told 'warn 80F5' ( Looks Error
executing Entry Init). I do not know why PDC did not try secondary device
automatically, in spite of BOOT ALT worked OK. Looks like PDC was very unhappy
about primary disk and didn't try to try secondary path.

Then Linux didn't find two disks, and reassigned new device names (sda,sdb,...)
according to existing scsi ids. Happily, md software does not care about
symbolic device names and remaps /dev/md  for new disk names according to  hw paths.

Then I inserted the disks and rebooted the system so that the disks appear as
they should. Mirror were resynced manually without problems.

So, I'm not very happy about Linux hot-plug features.

BR,
Dub
