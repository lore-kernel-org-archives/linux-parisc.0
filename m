From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] parisc: Purge existing TLB entries in set_pte_at and ptep_set_wrprotect - take 2
Date: Wed, 16 Jan 2013 22:44:29 +0100
Message-ID: <6320254.iVaF30vePD@donald.sf-tec.de>
References: <BLU0-SMTP8691FD3EB8749D3303BA57972D0@phx.gbl> <1358240719.2752.6.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7189399.scppe3JxB0"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Cc: John David Anglin <dave.anglin@bell.net>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1358240719.2752.6.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart7189399.scppe3JxB0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

James Bottomley wrote:
> On Mon, 2013-01-14 at 19:45 -0500, John David Anglin wrote:
> > Attached is new version of patch which no longer saves and restores
> > %sr1.  Lightly tested with a GCC build
> > and a build of Debian gtk+3.0 package.
> 
> I can merge it with your previous changelog, but for ease of git users,
> the accepted format is

> v2: Attached is new version of patch which no longer saves and
> restores  %sr1.  Lightly tested with a GCC build and a build of
> Debian gtk+3.0 package.

Do we want that to go back into stable kernels?

Eike
--nextPart7189399.scppe3JxB0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEABECAAYFAlD3H0UACgkQXKSJPmm5/E4SEQCdHtPGSSC3+UlGmNojiUndKr9c
y5UAoItx2Y4mCXbCnowzoyEnGFxYI43w
=Kgkq
-----END PGP SIGNATURE-----

--nextPart7189399.scppe3JxB0--

