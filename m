Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE0D4482E
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Aug 2003 00:56:48 -0600 (MDT)
Date: Wed, 6 Aug 2003 08:56:47 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030806065647.GP1873@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nEiUIFvcAhJzEN7U"
Subject: [parisc-linux] 2.6.x - impressions
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

--nEiUIFvcAhJzEN7U
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Now, where __cffc is checked in, I did some testing with
2.6.0-test2-pa6. This has been done on a B132L+, 768MB RAM, IBM PS/2
keyboard.

- On my keyboard (german "QWERTZ" layout) the key containing '>', '<'
  and '|' doesn't work any longer. Annoying cut'n'paste starts right
  here8^>

- If I strace some program, the box will crash some time later (while
  strace is still running). I can still toggle the NumLock LED by
  pressing the NumLock button, power doesn't instantly go off if I press
  the button. Hmmm... SysRQ doesn't work either, but is switched on in
  .config. Seems PrintScreen doesn't work either.
  TOC gives back access to the box, I haven't yet looked at the data.
  2.4.x does do the same thing on strace, though...

- Neither ALSA nor the OSS driver for harmony can be compiled. No sound
  (but I remember from 2.4.x that sound playing was unstable - when I
  placed some load on the box, it would eventually Oops...).

- I became brave and installed XFree86, using the framebuffer driver:

STI GSC/PCI core graphics driver Version 0.9a
STI word mode ROM at f0011000, hpa at f8000000
STI id 2d08c0a7-9a02587, conforms to spec rev. 8.07
STI device: INTERNAL_EG_1280
fb0: stifb 1280x1024-8 frame buffer device, id: 2d08c0a7, mmio:
0xf8100000
Console: switching to colour frame buffer device 160x64

  It starts, I can perfectly see X11's rasterized background. But when
  WindowMaker loads it's background image, the screen goes mostly black.
  Some white points can be seen (I feel like these are where colors of
  real contrast meet each other, so I can see the outlines of context
  menus...), but that's not enough to really work with it:)

- 2.6.x "feels" a bit slower than 2.4.x (while still using HZ =3D=3D 100 for
  hppa1.1 machines), but that's what everybody and his mother tell you
  wrt. any given architecture...

- I installed mozilla on my Athlon and on this B132L+ and started both
  via 'ssh -X' from my laptop (using --no-remote). Comparable
  startup-times for both, while my Athlon has 10x CPU MHz, 2x CPU count
  and 2x RAM size. Nice:)


To draw a conclusion: Nice work:) Some minor tweaks need to be done
(keyboard, graphics, strace), but 2/3 of them need to be done for 2.4.x,
too. I think the keyboard thing is quite easy, and for the graphics,
maybe that's only a small colormap problem. The strace problem (which is
present in 2.4.x, too) looks a bit more complicated, but I'll have a
look at the PIM and post new infos afterwards.

Sound would be an add-on-feature, but personally I don't care much about
it. I'm not one of those multimedia guys...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--nEiUIFvcAhJzEN7U
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/MKauHb1edYOZ4bsRAtyXAJ9I7cKfTHcxQNsL4gtaOVIfb3KW8gCbB9FF
0vDsZ5h8Cdk4v+EOzghpANo=
=XJQK
-----END PGP SIGNATURE-----

--nEiUIFvcAhJzEN7U--
