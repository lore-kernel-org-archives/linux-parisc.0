Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0273248DC
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Aug 2003 00:58:51 -0600 (MDT)
Date: Tue, 26 Aug 2003 08:58:49 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030826065849.GB9104@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Subject: [parisc-linux] [PATCH-2.6] Fix gsc_ps2.c for german keyboards
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

--gatW/ieO32f1wygP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

This little patch cures my keyboard. In the 2.4.x -> 2.6.x transition,
my key containing '<', '>' and '|' stopped working. Here it is again
(cut'n'pasting those three letters isn't really going to work on a Linux
system all the time:)

Please apply this to CVS:


--- linux-parisc-2.6/drivers/input/misc/gsc_ps2.c	2003-08-25 17:32:20.00000=
0000 +0200
+++ pa-build/drivers/input/misc/gsc_ps2.c	2003-08-25 18:41:24.000000000 +02=
00
@@ -154,7 +154,7 @@
 	/* 48 */  KBD_UNKNOWN,  KEY_DOT,       KEY_SLASH,     KEY_L,         KEY_=
SEMICOLON, KEY_P,        KEY_MINUS,     KBD_UNKNOWN,
 	/* 50 */  KBD_UNKNOWN,  KBD_UNKNOWN,   KEY_APOSTROPHE,KBD_UNKNOWN,   KEY_=
LEFTBRACE, KEY_EQUAL,    KBD_UNKNOWN,   KBD_UNKNOWN,
 	/* 58 */  KEY_CAPSLOCK, KEY_RIGHTSHIFT,KEY_ENTER,     KEY_RIGHTBRACE,KBD_=
UNKNOWN,   KEY_BACKSLASH,KBD_UNKNOWN,   KBD_UNKNOWN,
-	/* 60 */  KBD_UNKNOWN,  KBD_UNKNOWN,   KBD_UNKNOWN,   KBD_UNKNOWN,   KBD_=
UNKNOWN,   KBD_UNKNOWN,  KEY_BACKSPACE, KBD_UNKNOWN,
+	/* 60 */  KBD_UNKNOWN,  KEY_102ND,     KBD_UNKNOWN,   KBD_UNKNOWN,   KBD_=
UNKNOWN,   KBD_UNKNOWN,  KEY_BACKSPACE, KBD_UNKNOWN,
 	/* 68 */  KBD_UNKNOWN,  KEY_KP1,       KBD_UNKNOWN,   KEY_KP4,       KEY_=
KP7,       KBD_UNKNOWN,  KBD_UNKNOWN,   KBD_UNKNOWN,
 	/* 70 */  KEY_KP0,      KEY_KPDOT,     KEY_KP2,       KEY_KP5,       KEY_=
KP6,       KEY_KP8,      KEY_ESC,       KEY_NUMLOCK,
 	/* 78 */  KEY_F11,      KEY_KPPLUS,    KEY_KP3,       KEY_KPMINUS,   KEY_=
KPASTERISK,KEY_KP9,      KEY_SCROLLLOCK,KEY_103RD,


Thanks, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/SwUpHb1edYOZ4bsRAuQFAJ976/9kmMS1G2j30q+SMjNwGTVLPgCfTV0Y
WZK9ztMvm71K3724shqVPPo=
=QgEa
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
