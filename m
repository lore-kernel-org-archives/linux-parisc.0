Return-Path: <jbglaw@dvmwest.gt.owl.de>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id D05DB4890
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Jan 2004 04:55:18 -0700 (MST)
Date: Fri, 16 Jan 2004 12:55:17 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Non-HP PCI cards & x86 BOOT-ROMS
Message-ID: <20040116115517.GM14285@lug-owl.de>
References: <Pine.GSO.4.58.0401161155280.15789@vier.idi.ntnu.no>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Xg1Dpz0mHmRvkgSV"
In-Reply-To: <Pine.GSO.4.58.0401161155280.15789@vier.idi.ntnu.no>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--Xg1Dpz0mHmRvkgSV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-01-16 12:04:22 +0100, Ivar Orskaug <Ivar.Olav.Harstad.Orskaug@=
idi.ntnu.no>
wrote in message <Pine.GSO.4.58.0401161155280.15789@vier.idi.ntnu.no>:
> is it possible to run PCI card boot-roms containing x86 code with an
> emulator before loading Linux (perhaps from PALO)? Has anyone succeeded
> doing this, or is it "just not possible" for whatever reason? Anyway,
> if it was possible, it could really make PA-RISCs more usable.
> 	I've heard that this is possible on both linux-mips and linux-alpha

You can't compare with Alpha. Alpha is designed with having PC hardware
in mind. This is why it has got some kind of x86 emulator in it's
firmware, so this is a planned feature.

MIPS OTOH is a good architecture to compare with. I don't know if this
has been done before, but of course, in theory, you can execure the PC
boot ROM of PCI cards. IIRC, XFree86 has done that for VGA card's
BIOSes, but IMHO there should be a better option.

Maybe it would be a nice idea to hack bochs to initialize those cards,
but that's a lot of work, though...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--Xg1Dpz0mHmRvkgSV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFAB9ElHb1edYOZ4bsRAhAiAJ9I7eZeycpNbFCmhUu9JeqXv3dAOQCggFX5
gKxlOFgwOFp1rdbeWTH5hT4=
=lSSg
-----END PGP SIGNATURE-----

--Xg1Dpz0mHmRvkgSV--
