From: Rolf Eike Beer <eike@sf-mail.de>
Subject: Short notice: ipmi_si kills C8000
Date: Sat, 26 Oct 2013 16:26:03 +0200
Message-ID: <2698496.oieJ4Vatqf@caliban.sf-tec.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2032135.eY9yL26Mti"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2032135.eY9yL26Mti
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

I did "modprobe ipmi_si" on my C8000 (kernel 3.11.6), which immediately=
 broke=20
the machine. I have no backtrace yet, but I'll try to get one next week=
. In=20
case someone has such a machine and the mood to debug this already=E2=80=
=A6 ;)

Eike
--nextPart2032135.eY9yL26Mti
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlJr0QAACgkQXKSJPmm5/E6PlgCfbmybhC8pQJo8/0DrThGtAD2R
ajsAnAtR3R1oD0HbbkYRCtSHcMY20LuC
=+Xcx
-----END PGP SIGNATURE-----

--nextPart2032135.eY9yL26Mti--

