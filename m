Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from CIEXCHANGE.catalog-international.com (unknown [212.97.213.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A0A4482A
	for <parisc-linux@parisc-linux.org>; Thu, 17 May 2001 04:43:46 -0600 (MDT)
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Date: Thu, 17 May 2001 12:43:55 +0200
Message-ID: <D29B706549FC12468AC1A06BA08D6E703C6451@CIEXCHANGE.Catalog-international.com>
From: "Mikkel Lauritsen" <ml@Catalog-international.com>
To: <parisc-linux@parisc-linux.org>
Subject: [parisc-linux] Problems booting 712/100 with 0.6 ISO
List-ID: <linux-parisc.vger.kernel.org>

Hi all,

I fear that this might be an extremely stupid question, but I'm
having problems booting my 712/100 from the 0.6 ISO. Yes, I know
there's a newer one available, but the old should still work,
right?

I've downloaded the palinux-0.6-32STI.iso.gz file and burnt it
on a CD. The CD itself looks fine when mounted on the same box
under HP-UX; it contains what looks like a complete file system.
BTW, all of the files and directories on the CD have uppercase
names. Is that the way it's supposed to be?

Anyway, entering

boot scsi.3.0

from the boot monitor prompt makes the CD-rom drive rattle a bit,
and then the prompt is redisplayed.

Am I missing out on something completely obvious here? I've had
to swap the original HP CD-drive (Toshiba 5701) with an old NEC
drive that I dug up since the former one wouldn't read the CD,
but otherwise I don't think there are any hardware problems
involved.

Any light shed on this will be much appreciated. Thanks,

 Mikkel Lauritsen
