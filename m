Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailout10.sul.t-online.com (mailout10.sul.t-online.com [194.25.134.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6118B4861
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 May 2002 05:29:12 -0600 (MDT)
From: Alexander Gabert <pappy@nikita.ath.cx>
Date: Sun, 5 May 2002 13:28:53 +0200
To: parisc-linux@lists.parisc-linux.org
Cc: debian-hppa@lists.debian.org
Message-ID: <20020505112852.GA22017@nikita.ath.cx>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Subject: [parisc-linux] grsecurity patch 2.4.18
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

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hi, could someone please take a look at the following patch:

http://nikita.ath.cx/users/pappy/parisc/grsec/2418grsec.patch

it is a modified www.grsecurity.net/grsecurity-1.9.4-2.4.18.patch

i took kernel-source-2.4.18-hppa.tar from debian and tried to make the
grsecurity patch work with this hppa tree.

please tell me if i made any mistakes in making it fit (especially in
the fs/exec.c and mm.h section, where assumptions about the stack are
being made, i am a beginner :-)

thank you in advance,

alex

--=20
pub  1024/05E1A80C 2001/12/16 Alexander Gabert (http://nikita.ath.cx) <papp=
y@nikita.ath.cx>
          Key fingerprint =3D  2D 84 B0 CB F5 67 8A 22  8D 37 6E 6B 8A 3B 7=
F D6  05 E1 A8 0C

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE81Rdzijt/1gXhqAwRAlQtAJ9B8vavisT3AHc1gpTkkiJj5gvDvwCffcIz
lui6TBTpvNrHsGKx/ClajTs=
=RXKt
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
