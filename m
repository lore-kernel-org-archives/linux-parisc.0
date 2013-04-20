From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH] PARISC: provide __ucmpdi2
Date: Sat, 20 Apr 2013 22:02:26 +0200
Message-ID: <3572037.nRvXk0Bztd@eto>
References: <BLU0-SMTP16CB97A849149145EF5FC997C90@phx.gbl> <1751609.lhOQIV1TC8@eto> <BLU0-SMTP453E3CCB487F80E412D02A97C90@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2821684.E2Ins1k8n7"; micalg="pgp-sha1"; protocol="application/pgp-signature"
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP453E3CCB487F80E412D02A97C90@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--nextPart2821684.E2Ins1k8n7
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Samstag 20 April 2013, 15:52:59 schrieb John David Anglin:
> On 20-Apr-13, at 3:51 PM, Rolf Eike Beer wrote:
> > Am Samstag 20 April 2013, 15:41:06 schrieb John David Anglin:
> >> Provide __ucmpdi2 to resolve undefined references in 32 bit builds.
> >> 
> >> The Debian experimental linux source package (3.8.5-1) build fails
> >> with the following errors:
> >> ...
> >> MODPOST 2016 modules
> >> ERROR: "__ucmpdi2" [fs/btrfs/btrfs.ko] undefined!
> >> ERROR: "__ucmpdi2" [drivers/md/dm-verity.ko] undefined!
> >> 
> >> The attached patch resolves this problem.  It is based on the s390
> >> implementation
> >> of ucmpdi2.c.
> >> 
> >> Signed-off-by: John David Anglin <dave.anglin@bell.net>
> >> Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
> >> Cc: Helge Deller <deller@gmx.de>
> > 
> > If this is in 3.8.5 this should also get a Cc:stable@kernel.org
> 
> It is not in anything.

The function? Or the error? If the function is missing, i.e. the error will 
happen once enabling e.g. btrfs, in a already released kernel we should get 
this into stable.

Eike
--nextPart2821684.E2Ins1k8n7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEABECAAYFAlFy9FIACgkQXKSJPmm5/E757ACcCQTQsQ3/dipTBPuJYhpDOcfc
h0UAn3Sf+q844MZIU6LEDQIbmK8aIvNQ
=VekP
-----END PGP SIGNATURE-----

--nextPart2821684.E2Ins1k8n7--

