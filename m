Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A007482E
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Aug 2003 23:53:49 -0600 (MDT)
Date: Thu, 7 Aug 2003 07:53:46 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.6.x - impressions
Message-ID: <20030807055346.GI1873@lug-owl.de>
References: <20030806065647.GP1873@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mAEYYP2W/5hrqqYE"
In-Reply-To: <20030806065647.GP1873@lug-owl.de>
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

--mAEYYP2W/5hrqqYE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-08-06 08:56:47 +0200, Jan-Benedict Glaw <jbglaw@lug-owl.de>
wrote in message <20030806065647.GP1873@lug-owl.de>:
> - I became brave and installed XFree86, using the framebuffer driver:
>=20
> STI GSC/PCI core graphics driver Version 0.9a
> STI word mode ROM at f0011000, hpa at f8000000
> STI id 2d08c0a7-9a02587, conforms to spec rev. 8.07
> STI device: INTERNAL_EG_1280
> fb0: stifb 1280x1024-8 frame buffer device, id: 2d08c0a7, mmio:
> 0xf8100000
> Console: switching to colour frame buffer device 160x64
>=20
>   It starts, I can perfectly see X11's rasterized background. But when
>   WindowMaker loads it's background image, the screen goes mostly black.
>   Some white points can be seen (I feel like these are where colors of
>   real contrast meet each other, so I can see the outlines of context
>   menus...), but that's not enough to really work with it:)

After some reading, this seems to be a XFree86 4.2.x problem. The RENDER
engine (doing antialiasing) seems to pre-allocate 200 colours in
advance. After some background image is displayed (which for sure will
take most of the remaining colours) there are "no" colours left to
display menus, xterms and the like.

This will change (or configurable) in Xfree86 4.3.x.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--mAEYYP2W/5hrqqYE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/MelqHb1edYOZ4bsRAqzrAJoDku0Mytz/eVUmcLhUmqquV1naMQCfW6Dm
HvUjJ12YR6cpWDKI3hR2RyQ=
=DSDq
-----END PGP SIGNATURE-----

--mAEYYP2W/5hrqqYE--
