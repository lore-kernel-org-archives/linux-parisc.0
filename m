Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail002.syd.optusnet.com.au (mail002.syd.optusnet.com.au [203.2.75.245])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08DCC482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Oct 2001 16:47:32 -0600 (MDT)
Received: from duey (wdcax23-122.dialup.optusnet.com.au [210.49.129.122])
	by mail002.syd.optusnet.com.au (8.11.1/8.11.1) with SMTP id f9MMhUs13729
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Oct 2001 08:43:31 +1000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Matthew van de Werken <mvdw73@dingoblue.net.au>
Reply-To: mvdw73@dingoblue.net.au
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 23 Oct 2001 08:43:51 +1000
MIME-Version: 1.0
Message-Id: <01102308435104.21423@duey>
Subject: [parisc-linux] How to install with no network or CD-ROM
List-ID: <linux-parisc.vger.kernel.org>

OK, having finally got the debian installer working on my HP-735/99 with
neither network nor CD-ROM, I thought I'd share my experience with others, so
no-one else has to duplicate the effort.

What you will need to do this is the following:

(1) An external (50-pin) SCSI disk to install onto;
(2) A separate, external SCSI disk to put the CD image onto;
(3) A third SCSI disk to put a temporary file system onto;
(4) A working unix/linux machine with a SCSI interface to drive the three
disks (the 'host' - I used an x86 system running Linux, so that's what I'll
use in all my examples);
(5) The Installation .iso image from parisc-linux.org (we'll call it
image.iso for ease of remembrance)

Note that (1) and (3) could be the same disk, as long as it is
pre-partitioned with enough space to put the entire CD-ROM onto (more on this
later). For the sake of the example, we'll call the disks sda, sdb and sdc on
both machines (host and target).

The first thing to do is to hook up all your scsi drives, and boot the host
machine.

'dd' the iso image directly onto disk 2.
# dd if=/<path>/image.iso of=/dev/sdb bs=512

Now make a filesystem on sdc, or use an already-existing one. Note that you
will need to dump the cd data into the top of the filesystem, ie, if it's
mounted on /mnt/hostfs, that's where you need to copy the cd data. We'll need
to set up the loopback device so we can see inside our iso image to get the
data off it.

For the sake of our example, we'll assume sdc already has a filesystem on it,
and sdc3 is blank of all data.

# mkdir /mnt/hostfs
# mkdir /mnt/iso
# losetup /dev/loop0 /<path>/image.iso
# mount -t iso9660 /dev/loop0 /mnt/iso
# mount /dev/sdc3 /mnt/hostfs
# cp -Rv /mnt/iso/* /mnt/hostfs
<waiting, waiting...>

OK, now that the copying is done, unmount the filesystems and close the
loopback device, and shutdown so you can unplug the devices.

# umount /mnt/iso
# umount /mnt/hostfs
# losetup -d /dev/loop0
# shutdown -h now

Remove the disks, and plug them all into your HP box. Also plug in a serial
console. At the boot prompt, choose to boot from p1 (b p1), which will be the
cd-rom image disk. This will start the debian installer.

The trick now is to firstly not mount the hostfs filesystem, and choose to
install from a hard disk partition. This should get you through the
 installer.

I hope this has helped at least someone else,

Cheers,
Matt van de Werken.

-------------------------------------------------------
