Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id A4B484832
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Aug 2003 13:16:48 -0600 (MDT)
Date: Mon, 18 Aug 2003 21:16:47 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030818191647.GI16974@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S8hWgp6Wl+RBuNna"
Subject: [parisc-linux] [2.6.x] No NumLock with XFree86
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

--S8hWgp6Wl+RBuNna
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

With X11, the NumLock key is no longer working (seems the 2.4.x -> 2.6.x
transition:) I've seen the the gsc_ps2 driver got some really nice
touch-ups since it's 2.4.x version, but NumLock doesn't work. With
debugging switched on, I get these lines:

jbglaw@b132l-1:~$ dmesg |tail -n 15
drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D34, esc=3D0 <7>drivers/inpu=
t/misc/gsc_ps2.c:sent=3D34, rel=3D0
drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D240, esc=3D0 <7>drivers/inp=
ut/misc/gsc_ps2.c:release
drivers/input/misc/gsc_ps2.c:rel=3D1 scancode=3D44, esc=3D0 <7>drivers/inpu=
t/misc/gsc_ps2.c:sent=3D44, rel=3D1
drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D240, esc=3D0 <7>drivers/inp=
ut/misc/gsc_ps2.c:release
drivers/input/misc/gsc_ps2.c:rel=3D1 scancode=3D34, esc=3D0 <7>drivers/inpu=
t/misc/gsc_ps2.c:sent=3D34, rel=3D1
drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D90, esc=3D0 <7>drivers/inpu=
t/misc/gsc_ps2.c:sent=3D90, rel=3D0
drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D240, esc=3D0 <7>drivers/inp=
ut/misc/gsc_ps2.c:release
drivers/input/misc/gsc_ps2.c:rel=3D1 scancode=3D90, esc=3D0 <7>drivers/inpu=
t/misc/gsc_ps2.c:sent=3D90, rel=3D1
drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D119, esc=3D0 <7>drivers/inp=
ut/misc/gsc_ps2.c:sent=3D119, rel=3D0
drivers/input/misc/gsc_ps2.c:Calling gscps2_hpkeyb_event, type=3D17, code=
=3D0, value=3D1
drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D250, esc=3D0 <7>drivers/inp=
ut/misc/gsc_ps2.c:ACK
drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D250, esc=3D0 <7>drivers/inp=
ut/misc/gsc_ps2.c:ACK
drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D250, esc=3D0 <7>drivers/inp=
ut/misc/gsc_ps2.c:ACK
drivers/input/misc/gsc_ps2.c:rel=3D0 scancode=3D250, esc=3D0 <7>drivers/inp=
ut/misc/gsc_ps2.c:ACK
gsckbd_leds: timeout


This is first having typed "startx" and then I pressed the numlock key
several times. However, the NumLock LED isn't switched on. Instead, the
whole keyboard is no longer responsive at all. Switching back to a VC
(shutting down X11 by mouse or remotely issueing a 'chvt 2') gives me
back control over my kbd...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--S8hWgp6Wl+RBuNna
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/QSYfHb1edYOZ4bsRAi8mAJ9AsBOSJQ9EXqNkiPRuzmvemj1HawCffCvz
gp/Z0B3dReLJuvXFChwe5yY=
=Zhr1
-----END PGP SIGNATURE-----

--S8hWgp6Wl+RBuNna--
