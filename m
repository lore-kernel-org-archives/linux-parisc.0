From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH] parisc: BUG_ON() cleanup
Date: Tue, 6 Jan 2009 11:49:50 -0500
Message-ID: <200901061149.52015.vapier@gentoo.org>
References: <4963470D.1030101@gmx.de> <1231255233.7090.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4317700.lEa5kqJW2W";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	"linux-parisc" <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1231255233.7090.5.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart4317700.lEa5kqJW2W
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 06 January 2009 10:20:33 James Bottomley wrote:
> On Tue, 2009-01-06 at 12:57 +0100, Helge Deller wrote:
> > - convert a few "if (xx) BUG();" to BUG_ON(xx)
>
> This is fine
>
> > - remove a few printk()s, as we get a backtrace with BUG_ON() anyway
>
> This is less helpful.  Each of the printks explains why the bug
> triggers.  In theory you can work this out from the BUG_ON line number,
> but *only* if your source files match those of the reporter, which isn't
> the case in an annoyingly large number of bug reports ... speaking as
> someone who seems to get to diagnose large numbers of bugs, it makes my
> life harder.

i think those comments go beyond parisc.  perhaps we should add a=20
BUG_ON_ANNOTATED() that includes another printk ?
=2Dmike

--nextPart4317700.lEa5kqJW2W
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iQIcBAABAgAGBQJJY4uvAAoJEEFjO5/oN/WByS4QAIGklW0qV8qmjZ3Y7wvU3YEe
/6MLHCImOecjKwJSZioNIGSiC7X4YAfgXsSmj+MU0/t0qhM+eOFoLbit6lPfr83c
yWTxCeSLJJjx5pXb15YboUxLbWbnF3AKKCstGDU73/706eZM4H64nT48oawwjTa5
FtyZxyiLPKcyo/8vHcp63X4t4yMlFCirwtvI4jPtTvs/spz4aBSJ/B9JRTz5ARm5
uWnWk3Cq3GR/HK8vhbcyTvvqvYGK52HNr+ZHfdN+amwTFTBFNXbbCe2UfiMlEn9W
wDWI1ZY5fEB/I1JBdZ9IVNVEQC2XW67IkzM/KLaqqbdTx3TOV0pkmJO2Vf8amnno
cqDApr89HrHicGUQwUpbqUxOtA/Y6qBUju6OyG5ZyuMXIhUY4aW90L2KMO/+j6lW
ePVPUw98mJbj4whlxPdvP62U1j8CgNnEh6HcfVouEjghcH5UvqmGAjn9BsExbIjA
QpvSnyinZUzLxCwaAUQLjowY38N9F/6YhXLxr4NVRYvZELw7c1s7Ycv11sjspB7V
NUjzgCeYYE0iiDRDMwAb5vQMPCgEOLrHKCi2NJTQyC99rrojnNBq7Up3vFi/z8rX
BljjAQlFELEn4v1DaJeuLHGn093Cr+tadinXmx30VsKYv45cD6+dNU9vPifH2MN6
XkZ4WScz627v1/fdZiGt
=dHDY
-----END PGP SIGNATURE-----

--nextPart4317700.lEa5kqJW2W--
