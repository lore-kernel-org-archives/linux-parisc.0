From: Jeff Bailey <jbailey@nisa.net>
Subject: Re: [parisc-linux] glibc 2.3.2-9 for hppa - "when hell freezes
	over" release
Date: Tue, 21 Oct 2003 08:03:59 -0400
Message-ID: <1066737838.1176.5.camel__35113.5887358852$1416622897$gmane$org@outpost.dnsalias.org>
References: <20031017181252.GE27289@systemhalted>
	 <20031019181341.GF8642@systemhalted> <20031019235005.GI8642@systemhalted>
	 <20031020234345.GC5606@systemhalted>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-eyklI1wmgIAawhfDJzLc"
Cc: debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org, LaMont Jones <lamont@debian.com>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20031020234345.GC5606@systemhalted>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

--=-eyklI1wmgIAawhfDJzLc
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hey Carlos - When submitting these upstream, will you consider adding
test cases for these failures?  feraiseexcept should certainly be tested
somewhere.  I don't know if there's a reasonable way to put in the test
for the syscalls, though.

If you don't have time, that's fine too.  I just like to encourage
people to improve testsuites whenever they can. =3D)

Tks,
Jeff Bailey

On Mon, 2003-10-20 at 19:43, Carlos O'Donell wrote:
> On Sun, Oct 19, 2003 at 07:50:05PM -0400, Carlos O'Donell wrote:
> > Will produce a new patch and new testing debs. Thanks go to all the
> > testers that turned up these problems.
>=20
> New debs fix reported problems:
> a. Six argument syscall faiulres.
> b. feraiseexcept(FE_INEXACT) doesn't raise FE_INEXACT excption.
>=20
> New patch available at:
> http://www.baldric.uwo.ca/~carlos/glibc232-hppa-full-2003-10-20.dpatch
>=20
> Follow the instructions provided in the original email:
> 1. Remove all previous hppa patches.
> 2. Add this .dpatch as the only hppa patch.
>=20
> Upload requested :) Lets make userspace churn...
>=20
> Cheers,
> Carlos.
--=20
In the United States, there isn't a government database that hasn't been
misused by the very people entrusted with keeping its information safe.
 - Bruce Schneier

--=-eyklI1wmgIAawhfDJzLc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/lSCt5M5hmdCYCpkRAt9PAJ41G8AEuB6zlXNq0/gwulaW9OTgmwCfQ44A
lClI1WsBP1LBv8MEgEkdl3o=
=OgUW
-----END PGP SIGNATURE-----

--=-eyklI1wmgIAawhfDJzLc--
