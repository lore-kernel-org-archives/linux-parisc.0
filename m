From: Cyril Brulebois <cyril.brulebois@enst-bretagne.fr>
Subject: [parisc-linux] (solved) linking problem on HP-PA
Date: Wed, 10 Oct 2007 18:35:24 +0200
Message-ID: <20071010163524.GA25910__23624.1880957552$1416624444$gmane$org@evy>
Reply-To: Cyril Brulebois <cyril.brulebois@enst-bretagne.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0746991653=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============0746991653==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I requested an account yesterday since I was facing a linking problem on
HP-PA (apparently a missing =E2=80=9C-ffunction-sections=E2=80=9D compiler =
option), and
only on this architecture (amongst the 12 supported by Debian).

Thanks to Grant, I've been allowed to debug that problem quite quickly,
and I posted a tiny summary on [1]. Since Grant asked me to reference it
here, you're reading this mail. ;-)

 1. http://ikibiki.org/blog/2007/10/10/Linking_on_hppa/

Again, many thanks for the quick access setup, it is very appreciated,
and will help users get an updated package in the testing distribution.

Cheers,

--=20
Cyril Brulebois

PS: I'm not subscribed, that's why I set Reply-To.

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHDP9MeGfVPHR5Nd0RAvJgAKCuYDPlsygZ/JmnwIKn0xsA4aLmuwCfdgY6
9oWp6id1KrqD5FvUtR/N6Vw=
=Hn0o
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--

--===============0746991653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0746991653==--
