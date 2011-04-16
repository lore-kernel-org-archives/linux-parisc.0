From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: Bug#622997: Debian bug 622997
Date: Sat, 16 Apr 2011 20:22:49 +0100
Message-ID: <1302981769.5282.863.camel@localhost>
References: <20110416180754.GA18022@hiauly1.hia.nrc.ca>
	 <1302980251.4058.11.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="=-i64t+tVRFSWF8sUJwZdw"
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	622997@bugs.debian.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1302980251.4058.11.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--=-i64t+tVRFSWF8sUJwZdw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-04-16 at 13:57 -0500, James Bottomley wrote:
> On Sat, 2011-04-16 at 14:07 -0400, John David Anglin wrote:
> > I posted this debian bug report because the most recent debian
> > SMP kernel build fails to boot on my rp3440:
> > http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D622997
> >=20
> > I don't think debian kernels have worked since lenny.
>=20
> Hmm, well upstream ones have: so it's likely a patch debian has but
> upstream doesn't, or it could be a toolchain issue ... I didn't think
> gcc-4.4.5 worked properly on 64 bit without a few patches?

We have a tiny number of patches on top of 2.6.38.2.

If you can identify the compiler patches required, I can ask the Debian
gcc maintainers to apply them.

Ben.

--=20
Ben Hutchings
Once a job is fouled up, anything done to improve it makes it worse.

--=-i64t+tVRFSWF8sUJwZdw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIVAwUATansfOe/yOyVhhEJAQq8GQ//Z9aMPOcwLGTUcdGL2FGbjbt3+R1z7nun
0d6VBYDOhngC8nMNgCbg2j0/88APeaZo7PLVxvJwIYGtjxGhNeRaWUUN43nQF8bA
lC0zhV27dzU6daYPVbU6tbypgCAPxO3OolGXHcxv7oe8w+sEXzuCPlofxsXeSFX1
P7VYt74WPAgTo2gJO9H2W/qbZi1XSfySZM9yJ36EjQua8DJSJm8Rzc9aegUZkYdZ
i3Tgh4EuNXLeoVGCGN5eexfys6lHppJq8BRCMhK9kjy4oelgYpK8ZqkyKyrl7Iu/
Okn5p8QyIREjX5mKEjCBH9EkTZUcCEzXr05T/5srpMOqxdglylhellrCMHmGNQdU
spRvXJa0E8PYgrxE0kHKpAHCj0K2Nn5yCuDWcPX3ppI4mGLJNGeJQg6+VffF5LXG
PYDo3FDUW2QLiNMdxzp6fQaiAMnEG+Mc/+WFFVNkSEXtgUGlUQTa05jo/68ynkSA
pazSaqRjZnmCvgVCEXj+aJp4PVrT+/vHBGXnHo/lh2JJ5+BgeBlcjoYuUZSFr7Oj
OfA0cb/GqlB1x/B00Fx99zeFkSYH5kDtWwZvP8SfSgs76GCERSlYifvgU2MZkXO9
LzyZhrTrntoW6DXhhyGW2qughSZzWOGZ49TKs3TAaKopGNny8V/gbbiZy7l18Kzd
Xl77BVqHSRk=
=b0U6
-----END PGP SIGNATURE-----

--=-i64t+tVRFSWF8sUJwZdw--
