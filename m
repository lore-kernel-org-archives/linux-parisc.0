From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: struct sigaction sa_restorer field
Date: Sun, 10 Aug 2014 09:49:52 -0400
Message-ID: <108312262.dGJ5C12eXd@vapier>
References: <BLU436-SMTP205700FFA476092032AE8BA97F30@phx.gbl> <trinity-72a99ebc-405d-44c1-8c8b-0a04a9b401b3-1405931146850@3capp-gmx-bs43>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12164454.cxKZzXsbXx"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: John David Anglin <dave.anglin@bell.net>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-72a99ebc-405d-44c1-8c8b-0a04a9b401b3-1405931146850@3capp-gmx-bs43>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart12164454.cxKZzXsbXx
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

On Mon 21 Jul 2014 10:25:46 Helge Deller wrote:
> > The sa_restorer field is obsolete and not in the hppa struct
> > sigaction, but we still define SA_RESTORER.  What should be done?
>=20
> Basically to not break userspace we can't (and shouldn't) add the
> sa_restorer struct member. So, the only option would be to drop the
> SA_RESTORER #define, right? But I have no idea how and if this will b=
reak
> some builds, since the major arches seem to define SA_RESTORER...

would be nice to drop.  i had to update strace to undef it for hppa sin=
ce the=20
field didn't actually exist -- it uses the define to see whether the fi=
eld=20
should be decoded (which is why strace decoding of this syscall hasn't =
worked=20
in the past on parisc).  not all arches define it, so i think there's a=
lready=20
cover for code needing to check for its existence.
=2Dmike
--nextPart12164454.cxKZzXsbXx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABAgAGBQJT53iFAAoJEEFjO5/oN/WBp38QAKu+D89yvvOkGYDGU+4cb8wO
jB2IDUwujIUziQHd1wlT2vdX58dDtZHpGUxoeCnQjmEAVQ+5vinBMX4gGr9USrBx
XINlMh+OmwUY9Jvrox4OqqByhdhZfxy9hznKFDTrZ+40vpv/0kunLBrSfLj5epof
KfJ8MsFAdwbJ9FHpY85DuzlkScBDI+LgLBOg2iZMUekhokhm9Gd44M1m//3xtls4
GxIesrkDhgQFAlUntxmj2NqvsG4JwnfyBH34JytMMN4Ojx13LfHfTFK4ueXsmgE7
MjUXaODZ/SyCxnzz+GZdxNBjwz6f57NIkgB3b/qgDsUKAAy4Wx0l6iXrKahrCf4N
sQYB+moDDuqjCtyJpP/ZDRx95l5x94F/tLQCvRJD7ZcRNduz8kNEaqxdL8nTeSJ/
fgHjzA14d1w3CCx8j0iBfJzt/nFmWyLWS0wabuNiQu4wYzEPAjXbNfXAlItrGbnq
L2GCX8cflx7scEUD8dwpFGW9Szkgj8YR3Zr8NAecox9nOq2cxkIBCXFWnJPr/+TL
ttv53Y8GDwHcXtLYBzAiNMpHWRrhjLPy9ZRsnfNQXu7veokPSXU6BkVdHUam28VY
+pbLEkbZev+6dEtSIwq5AE3Hu5dx1i3rTbUaEI2qjOM8VdxCsH10TyQk+SBGO61O
09oLceBbRJf4013+04OU
=RFst
-----END PGP SIGNATURE-----

--nextPart12164454.cxKZzXsbXx--

