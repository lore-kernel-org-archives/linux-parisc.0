Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74635482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 May 2003 15:05:34 -0600 (MDT)
Date: Mon, 5 May 2003 23:05:32 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030505210532.GU27494@lug-owl.de>
References: <20030505200251.GS27494@lug-owl.de> <20030505200537.GF29544@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uUozbLrG2OP+gMtx"
In-Reply-To: <20030505200537.GF29544@tausq.org>
Subject: [parisc-linux] [PATCH-2.4] DIVA serial build error (was: Oops on 2.4.20-pa33)
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

--uUozbLrG2OP+gMtx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-05-05 13:05:37 -0700, Randolph Chung <randolph@tausq.org>
wrote in message <20030505200537.GF29544@tausq.org>:
> > IAOQ:   10224658        __canonicalize_funcptr_for_compare
> > r02:    101229d4        do_sigaction
>=20
> i don't have a 32-bit machine handy, can you try this patch and let me
> know if it fixes your problem? An earlier version of this was posted on
> this list but didn't get commited. thx -randolph

Oh, forgive me to be that read resistant:)

I'm currently rebuilding the kernel. While doing so, I remembered I had
to do a little compile fix. I'm not sure if it's correct, but at least,
it builds:


--- linux/drivers/char/serial.c.orig	2003-05-05 22:59:23.000000000 +0200
+++ linux/drivers/char/serial.c	2003-05-05 23:00:44.000000000 +0200
@@ -5836,10 +5836,10 @@
=20
 	/* printk("Unloading %s: version %s\n", serial_name, serial_version); */
 	del_timer_sync(&serial_timer);
-#ifdef CONFIG_SERIAL_SHARE_IRQ
+#ifdef CONFIG_HP_DIVA
 	if (hp_diva_count > 0)
 		del_timer_sync(&hp_diva_timer);
-#endif /* CONFIG_SERIAL_SHARE_IRQ */
+#endif /* CONFIG_HP_DIVA */
 	save_flags(flags); cli();
         remove_bh(SERIAL_BH);
 	if ((e1 =3D tty_unregister_driver(&serial_driver)))


MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--uUozbLrG2OP+gMtx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+ttIcHb1edYOZ4bsRAlhpAJ9aVWdUM+QpDei7MDhBe/vkLzfKNQCfXBd7
Pbqa1joSawaCdFpPYBW197I=
=a4BF
-----END PGP SIGNATURE-----

--uUozbLrG2OP+gMtx--
