Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 85BE6482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 08:59:29 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 15sQG6-0003CJ-00
	for parisc-linux@lists.parisc-linux.org; Sat, 13 Oct 2001 16:59:26 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 15sQG6-00018z-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 16:59:26 +0200
Date: Sat, 13 Oct 2001 16:59:26 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] disks not recognized by new 53c700/53c710 driver (was [parisc-linux-cvs] linux rhirst)
Message-ID: <20011013165925.C4317@dogbert.localdomain>
References: <20011013162103.A3604@dogbert.localdomain> <20011013162718.B3604@dogbert.localdomain> <20011013144315.768285B124@optical.cyberhost.co.za> <20011013164548.B4317@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
In-Reply-To: <20011013164548.B4317@dogbert.localdomain>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Okay, the make menuconfig LASI thingy did the trick. I now get:

SCSI subsystem driver Revision: 1.00
53c700: consistent memory allocation failed
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0
scsi0 : LASI SCSI 53c700
  Vendor: MICROP    Model: 1528-15MD1066702  Rev: DD24
  Type:   Direct-Access                      ANSI SCSI revision: 01 CCS
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
SCSI device sda: 2621688 512-byte hdwr sectors (1342 MB)
Partition check:
 sda: sda1 sda2 sda3

Is it normal for the consitent memory allocation to fail as indicated
above? What does this mean?

Regards,

Albert

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7yFbNDg+hOeRZtkMRApoVAJ4xjojJgWzI4BNgX6c+lZujTdgfXACgieYI
RwOv8dedHOzYKTlNNc/4wSw=
=v2gJ
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
