Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server.gangitano.it (net155-138.mclink.it [195.110.155.138])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6B2804829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Jan 2003 08:49:33 -0700 (MST)
Received: from luigi (postfix@luigi.gangitano.it [192.168.0.3])
	by server.gangitano.it (8.12.6/8.12.3) with ESMTP id h0CFnU9P003509
	for <parisc-linux@lists.parisc-linux.org>; Sun, 12 Jan 2003 16:49:31 +0100
From: Luigi Gangitano <luigi@debian.org>
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-5aYh0omKkZT8g4dFQCiV"
Message-Id: <1042386569.3329.4.camel@luigi>
Mime-Version: 1.0
Date: 12 Jan 2003 16:49:29 +0100
Subject: [parisc-linux] Issues with seteuid()?
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

--=-5aYh0omKkZT8g4dFQCiV
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi all,
I'm the Debian package maintainer for Squid (HTTP Proxy). I received the
forwarded bug report describing issues in seteuid() on palinux. While
using seteuid(), forked processes terminate with SEGV.

Is it a known problem?

Thanks.

L

Please CC: me, I'm not subscribed to this list.

-----Forwarded Message-----
> This small mail to mentionned that I reach to make squid operational on
> a linux-2.4.20-pa17 thanks to the following tips:
>=20
> in debian rules replace statement
>     ac_cv_func_setresuid=3Dno \
> by
>     ac_cv_func_setresuid=3Dyes \
>=20
> so that function leave_suid() [into src/tools.c] will use setresuid() in
> place of seteuid() before launch fork().
>=20
> Is it a know problem on palinux?
>=20
> Greetings,
>     Joel
>=20
> PS: Luigi, I also test it on 2.5.1 and it works also for parisc linux (te=
sting
> config). HTH

--=20
 Luigi Gangitano -- <luigi@debian.org> -- <gangitano@lugroma3.org>
 GPG: 1024D/924C0C26: 12F8 9C03 89D3 DB4A 9972  C24A F19B A618 924C 0C26

--=-5aYh0omKkZT8g4dFQCiV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+IY6J8ZumGJJMDCYRAgwnAJ9ZZt4fLDvbQDnpws0KyRugJ2+luACeJF2+
W30MJW3i5S7UMy6+lJkDHaY=
=uM3Z
-----END PGP SIGNATURE-----

--=-5aYh0omKkZT8g4dFQCiV--
