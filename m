Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD8E64830
	for <parisc-linux@lists.parisc-linux.org>; Fri, 12 Sep 2003 00:04:51 -0600 (MDT)
Date: Fri, 12 Sep 2003 08:04:50 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: Thomson Family <thomson@cableaz.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Looking for info on getting X running on my 712
Message-ID: <20030912060450.GL14376@lug-owl.de>
References: <p05210600bb86d1a05e38@[192.168.1.3]> <20030912053049.GA20242@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hPgXaKTTpTvPowxx"
In-Reply-To: <20030912053049.GA20242@dsl2.external.hp.com>
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

--hPgXaKTTpTvPowxx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-09-11 23:30:49 -0600, Grant Grundler <grundler@parisc-linux.or=
g>
wrote in message <20030912053049.GA20242@dsl2.external.hp.com>:
> On Thu, Sep 11, 2003 at 06:36:46PM -0700, Thomson Family wrote:

> > I've loaded Debian's Woody on my 712 and everything seems to be=20
> > working fine, but I'm unable to get X up and running.  I can't seem=20
> > to find any info on doing so. Ultimately I get "Screen/ScreenInit=20
> > failed for driver 0" when I run startx. I've noticed that when things=
=20
> > work fine for other folks, there isn't much posted on the web.
>=20
> You might also look at ftp://ftp.parisc-linux.org/kernels/712/
> and try out the XF86Config files there.

Basically, you need a kernel with STI framebuffer support and configure
XFree to use the fremebuffer driver. Mouse and keyboard are standard
PS/2 components so there's no problem, too. If your colors are totally
wrong, place 'Visual "TrueColor"' into the "Display" subsection of your
"Screen" section. Pay attention to your screen resolution and color
depth - they have to exactly match to what you get on boot-up since
there's no support to switch to another resolution/depth right now IIRC.

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--hPgXaKTTpTvPowxx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/YWIBHb1edYOZ4bsRAvXkAJ0UFJR+HAm/D5oCZoa6oh46upR21QCfS9sA
IpqEUQXsr98xuz6ZlLWLPYI=
=99+E
-----END PGP SIGNATURE-----

--hPgXaKTTpTvPowxx--
