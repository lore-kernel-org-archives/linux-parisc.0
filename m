Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1CCFA4830
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Oct 2001 02:42:45 -0600 (MDT)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #1)
	id 15pn2f-0001Ih-00
	for parisc-linux@lists.parisc-linux.org; Sat, 06 Oct 2001 10:42:41 +0200
Date: Sat, 6 Oct 2001 10:41:30 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCXS fixes
Message-ID: <20011006104130.A18068@dogbert.localdomain>
References: <200110030832.CAA10917@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
In-Reply-To: <200110030832.CAA10917@udlkern.fc.hp.com>
Sender: Albert Strasheim <fullung@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, 03 Oct 2001, John Marvin wrote:

<snip>

> However, ls still hangs randomly (actually it is not random, it depends on
> which directory the ls is done in).  It gets stuck in a ldcw loop due to
> the lock word not being 16 byte aligned.  The problem is that we fixed the
> alignment problems for static and dynamic allocations, but the align
> attribute is ignored for automatic (stack) allocations. Note that
> although ldcw requires 16 byte alignment for correct function, it does
> not cause an unaligned fault if the address is not aligned, it just
> doesn't work correctly!
>=20
> Here are some suggested fixes:
>=20
>     1) Fix the compiler to honor the aligned attribute for stack
>     allocations. I'm not sure how difficult this would be. I'm
>     not a compiler person, so someone else would have to do this.
>     I would guess that this problem is in the machine independent
>     part of the compiler. I'm not sure whether or not it would
>     be considered a bug. It might be worth writing a test for
>     the 386 version of gcc, and if it fails, report the "bug" and
>     see what happens ...
>=20
>     2) Change the lock structure to have 4 contiguous lock words, each
>     initialized to 1.  Then the lock code can round the address up to the
>     nearest 16 byte aligned address and use that for the semaphore.  If we
>     choose this solution we can just get rid of the aligned attribute,
>     since it would no longer serve any purpose.

As anyone decided on what do here? What would the test that John
mentions entail? How difficult is the second solution to implement?

Regards,

Albert

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7vsO6Dg+hOeRZtkMRAhljAJ4pzBmWI9hDB5o80wPqsKc96auLFwCcDbtq
DIaEiaZODeFkufJV7txaxI8=
=S3LF
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
