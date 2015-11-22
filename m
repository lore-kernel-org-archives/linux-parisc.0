From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 3/9] parisc: Fix asm/mman.h regarding MAP_HUGETLB and
 MADV_XX flags
Date: Sun, 22 Nov 2015 02:21:18 +0000
Message-ID: <1448158878.17638.20.camel@decadent.org.uk>
References: <1448055522-11594-1-git-send-email-deller@gmx.de>
	 <1448055522-11594-4-git-send-email-deller@gmx.de>
	 <1448139427.17638.16.camel@decadent.org.uk> <5650EEBD.6000400@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-SIk3R9NyOPjc6fqHrU10"
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	stable@vger.kernel.org
To: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5650EEBD.6000400@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--=-SIk3R9NyOPjc6fqHrU10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2015-11-21 at 23:22 +0100, Helge Deller wrote:
> Hi Ben,
>=20
> On 21.11.2015 21:57, Ben Hutchings wrote:
> > On Fri, 2015-11-20 at 22:38 +0100, Helge Deller wrote:
> > > On parisc we have up to now never supported Huge Pages, even glibc di=
d
> > > not defined MAP_HUGETLB for parisc. Since the Huge Page support is be=
ing
> > > added now, clean up existing definitions for MAP_HUGETLB and friends.
> > >=20
> > > Drop lots of MADV_xxK_PAGES flags, which were never used and were
> > > designed for a patch which was never integrated into the Linux
> > > kernel. Instead move other MADV_ flags to make them more compatible t=
o
> > > other linux architectures.
> >=20
> > Changing the unimplemented values seems fine, but how can it be OK to
> > renumber MAP_GROWSUP, MADV_DONTDUMP and MADV_DODUMP?
>=20
> MAP_GROWSUP is new.
> MAP_STACK changed, but doesn't seeem to be used inside the kernel anyway.

It may not be implemented in the kernel, but it is certainly used by
userland:
https://sources.debian.net/src/glibc/2.19-20/nptl/allocatestack.c/#L513

So you can't assign any new semantics to that bit, and you might as
well keep MAP_STACK as the same value.

> MAP_HUGETLB is new.
>=20
> MADV_DONTDUMP and MADV_DODUMP changed, but I tend to think that they are
> not widely used (if at all on parisc), and even in glibc they are only
> accessible if applications included .
> So, having the same value for both as all other architectures gives long-=
term
> probably more benefits than keeping the current values.
[...]

This does not trump the fact that existing applications may break and
that is something we generally try very hard to avoid.

Ben.

--=20
Ben Hutchings
If you seem to know what you are doing, you'll be given more to do.
--=-SIk3R9NyOPjc6fqHrU10
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAVlEmnue/yOyVhhEJAQor2A//ck+e1MLBrDSyyttYJefic7KppCBBE/0T
ElVi+hEXNJmKs1u5mkV6srT6NcowuRjcRJPeFWcwAFfhXGi2Nq51A439rNtNmalQ
lx4d5m9g4aYRYV3RdRf+uM90tHmC22wb/qLAYSevuteFYghJZp6+RFWOEDKEsliK
iYZ27ancrThKlk99A0L7XfZMCfRomtDlLCRi4FPAAh+X4wf6xpSGWj4LKrkdlGf4
e84srnyTmD5a4vhwfpD2Ji1G+w57WAiCPXqH5ap3p+GwYta+zHtTF1gsutl3A0to
G2Fg9x1BP5OQXSKxIqJ8UaVq9GlTjMs9aI6nFlrPYwAdgXpPR1yCKEFpgHxO3ZS7
5Rk29oOMwhqBYrJPBe0L0cvglycvJG5kKmPzedwBdoVhaM+Zlrlg1dVOEaSWtRXn
1shJ7sPQmp4axhKMIZ6H7+llLMrRXv26cA3Q1C9roFt4A0P+cPNVR4QFFSK/b6J6
h6oBwP6F00Qwu1efnS3Ou2p8PdNmV1JnoP5kUQTVs+BwxdgRPW4N/6VN0Vc0l221
q6jcNiWW+8JwO96bXv4kluP4W83iZcxbZ4tQja9aNKT2xcmNdqYzjywx/hCnZabZ
A+55lv5Zm6rgc3SkhMdmidIRFCyYlVuwXC2Q7vb3o73RbkNOqA7s3mG+f7MHJjJi
AU748o77Hu8=
=15pI
-----END PGP SIGNATURE-----

--=-SIk3R9NyOPjc6fqHrU10--
