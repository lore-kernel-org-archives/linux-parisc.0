Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id A48E4483D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Aug 2003 13:45:47 -0600 (MDT)
Date: Mon, 18 Aug 2003 21:45:46 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030818194546.GJ16974@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k9n1VOENd6u0x2wl"
Subject: [parisc-linux] [2.6.x] No less/greater/bar key at console nor with X11
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

--k9n1VOENd6u0x2wl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi:)

Along with the NumLock problem, my (german) keyboard doesn't any longer
respond to the less/greater/pipe key (located at the lower left of my
keyboard). Each time, these three lines are printed:

drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D97, esc=3D0 <7>drivers/inpu=
t/misc/gsc_ps2.c:received unk nown scancode 97, escape 0.
drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D240, esc=3D0 <7>drivers/inp=
ut/misc/gsc_ps2.c:release=20
drivers/input/misc/gsc_ps2.c:rel=3D1 scancode=3D97, esc=3D0 <7>drivers/inpu=
t/misc/gsc_ps2.c:received unknown scancode 97, escape 0.

97 gets mapped to KBD_UNKNOWN, 240 is KBD_RELEASE. However, I couldn't
figure out what I should place instead of KBD_UNKNOWN. Dublicating my
/etc/console/boottime.kmap.gz section for 86 (-> which is the correct
entry for any other i386 keyboard) to keycode 97 doesn't help, though...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--k9n1VOENd6u0x2wl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/QSzqHb1edYOZ4bsRAjdQAJ4wMp4eyhSVx8UJiXxAs5hhpqdkBQCcDbUZ
e5s3rHxPopR+V7wuzIZTmKg=
=6vMH
-----END PGP SIGNATURE-----

--k9n1VOENd6u0x2wl--
