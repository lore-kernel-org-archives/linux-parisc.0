From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: Short notice: ipmi_si kills C8000
Date: Thu, 31 Oct 2013 22:40:22 +0100
Message-ID: <15371438.W2EHpOsA1I@caliban.sf-tec.de>
References: <2698496.oieJ4Vatqf@caliban.sf-tec.de>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1403406.CurATzSu1t"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <2698496.oieJ4Vatqf@caliban.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart1403406.CurATzSu1t
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Samstag, 26. Oktober 2013, 16:26:03 schrieb Rolf Eike Beer:
> I did "modprobe ipmi_si" on my C8000 (kernel 3.11.6), which immediate=
ly
> broke the machine. I have no backtrace yet, but I'll try to get one n=
ext
> week. In case someone has such a machine and the mood to debug this
> already=E2=80=A6 ;)

Ok, I now have IPMI monitoring on the C8000 working smoothly. Thanks fo=
r the=20
work on this.

While testing I installed by mistake the nagios IPMI check module and f=
reeipmi=20
on the C3600 (running 3.11.2 at that time). Calling "check_ipmi_sensor =
-T=20
Temperature -H localhost" reproducible caused a HPMC. There was no IPMI=
 module=20
loaded or even compiled on the machine so I think it has nothing to do =
with=20
the crash reported above. I'll try if I can get some additional informa=
tion on=20
monday.

Eike
--nextPart1403406.CurATzSu1t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlJyzksACgkQXKSJPmm5/E4bswCeKCucZdErmpditwcdkyB+Hq7q
gycAmQG1vnoQOBprBnzYh+rYCpWHVjzy
=1LDB
-----END PGP SIGNATURE-----

--nextPart1403406.CurATzSu1t--

