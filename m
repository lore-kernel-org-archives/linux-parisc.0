Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ukcrn03.zaxus.com (mail.securepay.co.uk [193.112.44.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B1E1482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 17 May 2001 04:36:41 -0600 (MDT)
Message-ID: <9EB1F7B63758D411A78D00A0C9D84789B16BED@UKCRN03>
From: "Bright, Stephen" <Stephen.Bright@thales-esecurity.com>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Thu, 17 May 2001 11:32:35 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Booting from SCSI disk.
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I have a newly acquired 712/80 which I have booting happily via NFS.  I
would like to set it up to boot from the SCSI hard drive.  However, reading
the instructions on the website states that you need to use an i386 machine
to fdisk and run palo on the hdd.  Unfortunately I don't own a SCSI card for
my i386 boxes.

Is it not possible to run fdisk and palo on the HP itself?  I have tried
this, but when it boots I get a message along the lines of "Cannot grok the
kernel executable" (sorry, this is quoted from memory, so may not be exactly
correct).  Is there something preventing me doing this correctly?  Is an
i386 with SCSI card still required to setup the boot disk correctly?

If it helps, I fdisk'ed the hdd:
~20M partition type F0
~900M partition type 83
~80M partition type 82

-- 
Steve
 
