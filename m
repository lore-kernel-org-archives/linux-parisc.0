From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Call for Testing
Date: Tue, 29 Mar 2005 19:01:26 -0800
Message-ID: <20050330030126.GN2485@tausq.org>
References: <20050327204550.GC7728@roadwarrior.mcmartin.ca>
	<200503272308.32745.dmp@davidmpye.dyndns.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0488408080=="
Cc: parisc-linux@lists.parisc-linux.org
To: David Pye <dmp@davidmpye.dyndns.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503272308.32745.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============0488408080==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> module ipv6 relocation of symbol ipv6_chk_addr is out of range (0x3ffefff=
d in=20
> 17 bits)
> module ipv6 relocation of symbol ipv6_chk_addr is out of range (0x3ffefff=
d in=20
> 17 bits)
>=20
> Are these anything to worry about?

Yeah, it's a bug. ipv6 won't work with that kernel because the module is
too big :(

Fixing this requires some work in binutils that nobody has been
motivated enough to pursue yet.

Kyle, if there is enough interest in ipv6, is making it builtin an
option?

randolph
--=20
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCShaGULspdC1Zp9IRArUGAJ4skeJXhZ6szojUtAmdHVjBonnO0gCgs6Mg
iO30wXV1ovbHtc78on/GIm8=
=iJ8W
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--

--===============0488408080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0488408080==--
