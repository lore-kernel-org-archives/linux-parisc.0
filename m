Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F65B4872
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 12:48:49 -0600 (MDT)
Date: Fri, 28 Sep 2001 20:48:18 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: Jurij Smakov <jurij@lokmail.net>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 720 - some progress
In-Reply-To: <20010928182422.A22740@dogbert.localdomain>
Message-ID: <Pine.NEB.4.33.0109282045120.601-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Albert,

> Then I tried a mke2fs on my SCSI disk's 2nd partition (ext2), in an
> attempt to get my system to boot from disk... Eek!
>
> scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
> scsi0: dsp = 005ee038 (script[0x180e]), dsps = 005eecde, target = 0
> scsi0: Failing command for ID6
> scsi0: Serious error, sstat0 = 04
> scsi0: Chip register contents:
>  (script[0] at virt 105e8000, bus 5e8000)
>  00  sien:  af  sdid:  40  scntl1:20  scntl0:d4
>  04  socl:  06  sodl:  00  sxfer: 00  scid:  80
>  08  sbcl:  00  sbdl:  00  sidl:  00  sfbr:  00
>  0C  sstat2:06  sstat1:00  sstat0:00  dstat: 00
>  10
>  14  ctest3:84  ctest2:25  ctest1:0b  ctest0:00
>  18  ctest7:00  ctest6:00  ctest5:00  ctest4:00
>  1C  temp:  00000000
>  20              ctest8:ff  istat: 06  dfifo: 00
>  24  dbc:   0e000001  dnad:  005eecde  dsp:   005ee038
>  30  dsps:  005eecde
>  34  dmode: 80
>  38  dcntl: 80  dwt:   00  dien:  1d
>  3C
> scsi0: Unexpected stacked interrupt, istat 06, sstat0 08, dstat 00
> scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI bus and chip

On my installation i "fixed" this by switching off SCSI disconnects for my
disks. IIRC, this was by adding sim700=nodisc:0x70 to the kernel command
line.

I'm currently about 150 km away from my HP9000/720 during the weekend.
I'll test the proposed patch on Monday.

Cheers,
Jochen
