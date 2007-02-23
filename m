From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [parisc-linux] RV: Debian-Oracle in my HP PA-RISC box
Date: Fri, 23 Feb 2007 02:09:19 +0100
Message-ID: <20070223010919.GF9712__21246.0641553209$1416624309$gmane$org@lug-owl.de>
References: <B16125A25C2950468B73254F5FDF36A201D95E7E@crsnjex001.FreshDelmonte.corp>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============0336249507=="
Cc: parisc-linux@lists.parisc-linux.org
To: Alejandro Retana <ARetana@cr.freshdelmonte.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <B16125A25C2950468B73254F5FDF36A201D95E7E@crsnjex001.FreshDelmonte.corp>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============0336249507==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jkO+KyKz7TfD21mV"
Content-Disposition: inline


--jkO+KyKz7TfD21mV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2007-02-22 11:37:54 -0600, Alejandro Retana <ARetana@cr.freshdelmon=
te.com> wrote:

> oracle@debian:/cdrom$ ls
>=20
> doc  index.htm  install  lgto  response  runInstaller  stage
>=20
> oracle@debian:/cdrom$ ./runInstaller
>=20
> oracle@debian:/cdrom$ ./runInstaller: line 35: ./runInstaller: cannot exe=
cute binary file

Sure. As far as I know, there simply *is* no Linux ELF Oracle version
for hppa.  This just won't work.


Try 'file runInstaller' to see what what this file was created for...


MfG, JBG

--=20
      Jan-Benedict Glaw      jbglaw@lug-owl.de              +49-172-7608481
Signature of:              Alles sollte so einfach wie m=C3=B6glich gemacht=
 sein.
the second  :                          Aber nicht einfacher.  (Einstein)

--jkO+KyKz7TfD21mV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFF3j6/Hb1edYOZ4bsRAsy5AJ9zFqsQRJTM/donPKVhc8LaKR7xhACfSnwQ
ftrxk3/uJuxWzecvlYdUe4g=
=xy5y
-----END PGP SIGNATURE-----

--jkO+KyKz7TfD21mV--

--===============0336249507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============0336249507==--
