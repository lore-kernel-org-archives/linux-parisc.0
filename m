Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DC91482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 10:26:03 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15n0Rq-0002iQ-00
	for parisc-linux@lists.parisc-linux.org; Fri, 28 Sep 2001 18:25:10 +0200
Date: Fri, 28 Sep 2001 18:24:22 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Jurij Smakov <jurij@lokmail.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress
Message-ID: <20010928182422.A22740@dogbert.localdomain>
References: <200109280925.FAA18777@mail.lokmail.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
In-Reply-To: <200109280925.FAA18777@mail.lokmail.net>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I've booted my nfsroot again with 2.4.9-pa22 (I'm waiting for puffin to
come back so that I can update, and try Jurij's patches).

I mounted /proc, remounted / rw and went on my way.

I replaced ls, sleep and tar with the busybox binary from the latest
disks-hppa/current Debian root.bin.

Then I tried a mke2fs on my SCSI disk's 2nd partition (ext2), in an
attempt to get my system to boot from disk... Eek!

scsi0: istat = 04, sstat0 = 00, sstat1 = 00, dstat = 00
scsi0: dsp = 005ee038 (script[0x180e]), dsps = 005eecde, target = 0
scsi0: Failing command for ID6
scsi0: Serious error, sstat0 = 04
scsi0: Chip register contents:
 (script[0] at virt 105e8000, bus 5e8000)
 00  sien:  af  sdid:  40  scntl1:20  scntl0:d4
 04  socl:  06  sodl:  00  sxfer: 00  scid:  80
 08  sbcl:  00  sbdl:  00  sidl:  00  sfbr:  00
 0C  sstat2:06  sstat1:00  sstat0:00  dstat: 00
 10
 14  ctest3:84  ctest2:25  ctest1:0b  ctest0:00
 18  ctest7:00  ctest6:00  ctest5:00  ctest4:00
 1C  temp:  00000000
 20              ctest8:ff  istat: 06  dfifo: 00
 24  dbc:   0e000001  dnad:  005eecde  dsp:   005ee038
 30  dsps:  005eecde
 34  dmode: 80
 38  dcntl: 80  dwt:   00  dien:  1d
 3C
scsi0: Unexpected stacked interrupt, istat 06, sstat0 08, dstat 00
scsi0: Failed to handle interrupt.  Failing commands and resetting SCSI bus and chip

Anything I can do now to help the hackers debug this problem?

Regards,

Albert

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7tKQ2Dg+hOeRZtkMRAvkQAJ9DAPPknNEc22WE3CsYhXnR03XzvACghljj
EDGXfQGV2251tsCOz3fXUbw=
=m6pC
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
