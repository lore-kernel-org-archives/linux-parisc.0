Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id F020C482C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 23:26:01 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 161idS-0003JI-00
	for parisc-linux@lists.parisc-linux.org; Thu, 08 Nov 2001 08:25:58 +0200
Received: from fullung by dogbert.localdomain with local (Exim 3.32 #1 (Debian))
	id 161ieI-0000XX-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 08 Nov 2001 08:26:50 +0200
Date: Thu, 8 Nov 2001 08:26:50 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720/50 update
Message-ID: <20011108082650.B1857@dogbert.localdomain>
References: <fullung@ilink.nis.za> <20011107023007.A12882@dogbert.localdomain> <200111070700.AAA08983@puffin.external.hp.com> <20011107163116.A8527@dogbert.localdomain> <20011107200110.C616@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
In-Reply-To: <20011107200110.C616@dogbert.localdomain>
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

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Been fiddling with man some more. I'm going to rebuild man-db from
source to see what there is to find. Here's the crash from man:

Nov  8 08:13:03 bob kernel: !!die_if_kernel: man(1485): Privileged
operation - shouldn't happen! 10
Nov  8 08:13:03 bob kernel:
Nov  8 08:13:03 bob kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Nov  8 08:13:03 bob kernel: PSW: 00000000000001001111111100001111
Nov  8 08:13:03 bob kernel: r0-3^I 00000000 40029470 4000bf07 00000081
Nov  8 08:13:03 bob kernel: r4-7^I 4010b4d8 00039248 000114c0 4002a2c8
Nov  8 08:13:03 bob kernel: r8-11^I 00010e40 40028cf4 bff00bc8 00011a9c
Nov  8 08:13:03 bob kernel: r12-15^I 00000000 00000080 00010570 0001130c
Nov  8 08:13:03 bob kernel: r16-19^I 40028cf4 0000000c 00000000 40028cf4
Nov  8 08:13:03 bob kernel: r20-23^I 00000001 00038e58 00000000 00000000
Nov  8 08:13:03 bob kernel: r24-27^I 00038e58 00000081 000114b4 00020ce8
Nov  8 08:13:03 bob kernel: r28-31^I 00000081 00000041 bff00d00 4000a487
Nov  8 08:13:03 bob kernel: sr0-3^I 00000438 00000438 00000000 00000438
Nov  8 08:13:03 bob kernel: sr4-7^I 00000438 00000438 00000438 00000438
Nov  8 08:13:03 bob kernel:
Nov  8 08:13:03 bob kernel: IASQ: 00000438 00000438 IAOQ: 4000be13 4000be17
Nov  8 08:13:03 bob kernel:  IIR: 04000000    ISR: 00000438  IOR: 00000000
Nov  8 08:13:03 bob kernel:  CPU:        0   CR30: 155fc000 CR31: 10330000
Nov  8 08:13:03 bob kernel:  ORIG_R28: 401ea73c

This probably explains why xman isn't working too well. Strangely
enough, it doesn't cause a similiar crash.

Would localizing the crashing/non-crashing code help towards figuring
out this problem?

Regards,

Albert


On Wed, 07 Nov 2001, Albert Strasheim wrote:

<snip>

> Another weird one is when I click on any button in xman (and some other
> apps in xbase-clients; displaying on my i386 machine), it simply dies
> with:
>=20
> Error: Unresolved inheritance operation

<snip>

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE76iWpDg+hOeRZtkMRAoZzAJ9JbcwGfd9ts8w26t8gxEasRAdnKQCfQ6UQ
QzDnlvWY7OzB1XotfVHV6lw=
=STH/
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
