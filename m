Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (intro.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABBB5482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 May 2002 19:54:13 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: "'Grant Grundler'" <grundler@dsl2.external.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Dodgy SCSI in L2000 
Date: Wed, 8 May 2002 13:57:45 +1200
Message-ID: <002d01c1f633$bf3ebf50$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20020507235047.6A2B6482A@dsl2.external.hp.com>
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

> Our best 2.4.18 kernel so far is the non-SMP kernel I built for
> -pa7. See ftp.parisc-linux.org/kernels/a500.
> 

Okay, I will take a look at that, thanks.

> Can you try a kernel with SCSI_NCR_IOMAPPED=y?

Yep. The kernels I am currently running already have that option set.
I read something about SCSI not working without it, so I tried
enabling it. Didn't really seem to have any affect on the problems I
have been having.

I will try mucking with the termination and cables, but they should
be okay right? I mean, this box hasn't been opened or touched since
(hardware wise) since we got it from HP.

Thanks, James.

-----BEGIN PGP SIGNATURE-----
Version: PGP 7.1.1

iQA/AwUBPNiGGVW+bhIOiSqWEQIzGgCgz7SCN7qCJT6UNIfe9gO3lIsYbJIAn2KB
lDBYV2Sjd1GQMrHd9HnVM1iS
=azxw
-----END PGP SIGNATURE-----
