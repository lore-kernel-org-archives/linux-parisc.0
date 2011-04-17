From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: Bug#622997: Debian bug 622997
Date: Sun, 17 Apr 2011 20:37:30 +0100
Message-ID: <1303069050.5282.943.camel@localhost>
References: <20110417151147.326EC4FCB@hiauly1.hia.nrc.ca>
	 <1303053807.2583.1.camel@mulgrave.site>
	 <1303068487.2583.7.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="=-dj6T/cEk6VYcJR6Ifypl"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	622997@bugs.debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1303068487.2583.7.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--=-dj6T/cEk6VYcJR6Ifypl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2011-04-17 at 14:28 -0500, James Bottomley wrote:
> On Sun, 2011-04-17 at 10:23 -0500, James Bottomley wrote:
> > It's most likely a driver module that's getting loaded which is turned
> > off in the booting configuration ... finding it isn't going to be easy,
> > though ...
>=20
> Finally got a build (had to swap out -Os for -O2).
>=20
> I traced the module loads and successful inits and found it; it's
> pata_cmd64x  ... it loads but never returns from init.  I bet it's
> trying to poke into ISA space which causes the HPMC.
>=20
> Removing this one module from the system allows it to boot again.
[...]

We also had a recent report that this driver is also bust on some sparc
systems.  We could swap back to cmd64x on these architectures but I
would rather get pata_cmd64x fixed.

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-dj6T/cEk6VYcJR6Ifypl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATatBc+e/yOyVhhEJAQpe0g//SxyNZ36zhy3rO5xVTlVwYCVKMNF3P+vJ
d6tKkhYYmwZBIvvt2aySuL7+VMvcasmVeKczii5/kMV3N+W6s8j0eBqYjR9LGgWq
TWJelLwj3TcyGnc5Q5EyTSXGCpzNOBPP+bYC2cPoPUJ6HvVc8MAqGsJZz4yCv4ew
NKSgw+pZEGrsT/El9DBF1BWGsoyRMhfnR2XR+R5IeO2M2ZZPyoLTcrd/A3hBCaK0
JZOVCknY+S98ADZflKf4HJAX0yFTAYfCyDXm9M28xAIYQTVeIvq1oc7V/6l8OxRd
xWcNc04nLGWG/xJeodFycWDLo3f55KU3NSZm4a8Sit1ARWqr8HG7qYo7EOytSSPA
bbTjD4hEfOV00x2198DRkMTXMBMQVMYPYlMsSSzx3bVmLdvD15Qsra88miYUD130
T9PMYK+aZPLujNJMPKxqqCKEO2TJphUSwSMgucJKOmN8wFi2iTt2V20RBgcVr9Am
c5ZtcXjJd4ER1os5nodnNia4L9CxtGkZdVFbJFb5khJiadQKNMD3xoT2aZmQH2gJ
aNyM7uzPrNREQjkXr+AVSeGpnA087TD9oPV/Sl/0zZSWjn0J/mE6Rqe3ELSVM/1y
EQ7WxgQAR4Mada4yVVBsfud9WEwnHMH5la4IifM51fTNhqBKtlkIPD4uNorXVFHu
QZxpHiqh4Fg=
=CUtC
-----END PGP SIGNATURE-----

--=-dj6T/cEk6VYcJR6Ifypl--
