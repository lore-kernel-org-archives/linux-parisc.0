From: Modestas Vainius <modestas@vainius.eu>
Subject: Re: Bug#561203: threads and fork on machine with VIPT-WB cache
Date: Thu, 3 Jun 2010 11:50:05 +0300
Message-ID: <201006031150.15725.modestas@vainius.eu>
References: <20100408224446.96F294FA3@hiauly1.hia.nrc.ca> <20100602171600.GA5566@hiauly1.hia.nrc.ca> <20100602175616.GA23219@lackof.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart4203694.qXjXkOGAyg";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	561203@bugs.debian.org, deller@gmx.de, gniibe@fsij.org,
	linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, carlos@systemhalted.org
To: dann frazier <dannf@debian.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100602175616.GA23219@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--nextPart4203694.qXjXkOGAyg
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

# Breaks unrelated applications
tags 561203 critical
thanks

Hello,

On tre=C4=8Diadienis 02 Bir=C5=BEelis 2010 20:56:17 dann frazier wrote:
> On Wed, Jun 02, 2010 at 01:16:01PM -0400, John David Anglin wrote:
> > On Wed, 02 Jun 2010, Modestas Vainius wrote:
> > > Hello,
> > >=20
> > > this bug [1] is back to the "very common" department with eglibc 2.11
> > > (libc6- dev_2.11.1-1) builds. Majority of KDE applications are failing
> > > to build on hppa again. Is there really nothing what could be done to
> > > fix it?
> >=20
> > I will just say it is very tricky.  I think a fix is possible (arm and
> > mips had similar cache problems) but the victim replacement present in
> > PA8800/PA8900 caches makes the problem especially difficult  for
> > hardware using these processors.
> >=20
> > I have spent the last few months testing various alternatives and have
> > now done hundreds of kernel builds.  I did post some experimental patch=
es
> > that fix the problem on UP kernels.  However, the problem is not resolv=
ed
> > for SMP kernels.
>=20
> Note that Debian's buildds run a UP kernel, so as soon as those fixes
> go upstream we can pull them in. Thanks for all your work here!
>=20

Well, as long as this is unfixed or at least "common", I don't see how hppa=
=20
can be considered to be a release arch. Is that UP patch available somewher=
e?

All KDE applications have been stuck in unstable before due to this and=20
history is about to repeat itself unless something is done. While apparentl=
y a=20
failing test in eglibc can be ignored, other applications have to suffer re=
al=20
world problems...

=2D-=20
Modestas Vainius <modestas@vainius.eu>

--nextPart4203694.qXjXkOGAyg
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkwHbL4ACgkQHO9JRnPq4hSMXwCfYSyqlh7B8Rt3N5+Szqc3pp8J
PaQAoMje2eJx0/LCQNJ8loryxp0+er6e
=Y/NB
-----END PGP SIGNATURE-----

--nextPart4203694.qXjXkOGAyg--
