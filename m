Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (intro.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65352482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 May 2002 23:07:11 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: "'Grant Grundler'" <grundler@dsl2.external.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Dodgy SCSI in L2000 
Date: Wed, 8 May 2002 17:10:46 +1200
Message-ID: <003401c1f64e$b5e4b070$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <002d01c1f633$bf3ebf50$5e01000a@bongo>
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

 
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Okay, I have just been thrashing my L2000, one disk at a time with
dbench (up to 100 clients, havent tried any more), one disk at a
time, and it has held up fine (i.e. no ABORTS/RESETS or anything).
Yet as soon as I run dbench concurrently over more than one disk
(whether in a RAID array or just fire up 2 dbench's on different
disks, the SCSI driver goes mental with ABORTS and RESETS in the
error log. 

The SCSI termination and cabling *should* be fine, as nobody here has
touched the box since we got it from HP. I cant be sure on the cables
though as we have no replacement cables for it.

This is really weird, anybody have further ideas about this one?

Cheers, James

-----BEGIN PGP SIGNATURE-----
Version: PGP 7.1.1

iQA/AwUBPNizVVW+bhIOiSqWEQLb8gCgi6S7nm8amd9gIFMYpvkyCYFXRV4AoOQG
5Zg346MvhtAALRg218WsjV17
=R9aP
-----END PGP SIGNATURE-----
