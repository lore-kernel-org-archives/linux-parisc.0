Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id E523C48CE
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Aug 2003 00:37:19 -0600 (MDT)
Date: Fri, 15 Aug 2003 08:37:18 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: xchat colors
Message-ID: <20030815063718.GD16974@lug-owl.de>
References: <W9958529574305441060899998@webmail4> <20030815061601.GD2989@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wUMz9o/vfMbinXcu"
In-Reply-To: <20030815061601.GD2989@dsl2.external.hp.com>
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

--wUMz9o/vfMbinXcu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-08-15 00:16:01 -0600, Grant Grundler <grundler@parisc-linux.or=
g>
wrote in message <20030815061601.GD2989@dsl2.external.hp.com>:
> On Thu, Aug 14, 2003 at 10:26:38PM +0000, caslivkoff@speakeasy.net wrote:
> > Also, I've attached is short Xlib program. This will report the
> > number of private color cells remaining in the default colormap.
>=20
> Seems like I want to figure out how to setup a fixed color
> map as suggest earlier by Alan Cox. Or fix xchat so it
> doesn't attempt to get writeable colors until someone
> messes with the color preferences.

Um, maybe this is related to XFree problems in Debian/unstable?
Unstable's current XFree (4.2.1.1) "RENDER" extension (used for
anti-aliasing IIRC) takes a _lot_ of colors for it's own (rumors I
heared talked about > 200 IIRC) so generally, you won't be left with a
useable X in unstable (because with 8bit depth, there's only a hand full
of remaining colors available at all:)

Later X versions allow you to kill the RENDER extension so you'll get
your colors back. But until then...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--wUMz9o/vfMbinXcu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/PH+eHb1edYOZ4bsRAk/6AKCDMjO016NF1+wk6W4olEX/4gALhwCfcTet
H2U7QEmtLGGUnFDsqZNVZx4=
=VIHU
-----END PGP SIGNATURE-----

--wUMz9o/vfMbinXcu--
