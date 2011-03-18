From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [E1000-devel] [PATCH] e1000: Allow the driver to be used on PA RISC C8000 workstation
Date: Fri, 18 Mar 2011 17:39:57 +0100
Message-ID: <1538517.jd8kKEpd3f@donald.sf-tec.de>
References: <A78C6259B11833419567082E2DC0C25601D8A9CA5E@orsmsx508.amr.corp.intel.com> <20110228144006.2adb4fdd@borg.bxl.tuxicoman.be> <AANLkTinga9dW9+4TQzE+f6Tt4kAEiXaprZjv+U+-a5Mq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart14791965.uzAOj4C0tq"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: Guy Martin <gmsoft@tuxicoman.be>,
	"Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
	"kyle@mcmartin.ca" <kyle@mcmartin.ca>,
	"e1000-devel@lists.sourceforge.net"
	<e1000-devel@lists.sourceforge.net>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"mikulas@artax.karlin.mff.cuni.cz" <mikulas@artax.karlin.mff.cuni.cz>
To: Jesse Brandeburg <jesse.brandeburg@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTinga9dW9+4TQzE+f6Tt4kAEiXaprZjv+U+-a5Mq@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart14791965.uzAOj4C0tq
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

Am Mittwoch, 2. M=E4rz 2011, 21:19:24 schrieb Jesse Brandeburg:
> On Mon, Feb 28, 2011 at 5:40 AM, Guy Martin <gmsoft@tuxicoman.be> wro=
te:
> > Hi Jeff,
> >=20
> > Any luck getting this into mainline ?
>=20
> Hi Guy, sorry for the delay,
> We haven't been able to get our contacts in HP to give us a decent
> response so far, we are following up with them to see whats up.  We
> have not lost the patch and are still tracking it internally.
>=20
> Give us a couple more weeks if that is okay and we should be able to
> settle this by then.

Hi all,

I wonder what exactly you are waiting for? This is a sanity check that =
we=20
disable, so no working systems could get broken by this. And every sing=
le=20
C8000 seems to be affected by this and is working fine with that patch.=
 So maybe=20
people at HP might have a clue _why_ this is screwed, but until then I =
don't=20
see any point in waiting.

So please just add my tested-by and push this upstream soon. Since this=
 is=20
basically a hardware quirk I would like to get this into stable also so=
 we may=20
run vanilla 2.6.38.1 or something like that on C8000.

Tested-by: Rolf Eike Beer <eike-kernel@sf-tec.de>

Eike
--nextPart14791965.uzAOj4C0tq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)

iEYEABECAAYFAk2DiuMACgkQXKSJPmm5/E6KrgCgjcD4MOjbeKcyxK0vNxGPJDbV
jtkAnjTl7bKsvdtQd/hOxFLPnEUafWIe
=50sL
-----END PGP SIGNATURE-----

--nextPart14791965.uzAOj4C0tq--

