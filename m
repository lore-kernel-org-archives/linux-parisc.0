Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9DF3482B
	for <parisc-linux@parisc-linux.org>; Fri, 14 Feb 2003 11:11:26 -0700 (MST)
Date: Fri, 14 Feb 2003 19:11:24 +0100
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@parisc-linux.org
Message-ID: <20030214181124.GJ13355@lug-owl.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tu8ztk+XgTAiG9Id"
Subject: [parisc-linux] Watchdog on parisc?
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

--Tu8ztk+XgTAiG9Id
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm currently playing a bit with my B132L and 715. They're working quite
nice, except that kernels aren't too stable (gcc-3.2, I'll do some more
test compiles with gcc-3.0, too).

I've looked through the docs available if a watchdog is mentioned. In
=2E/docs/platforms/b1xx-service.pdf there's a watchdog timeout error
declared (during selftest) so I *think* there is a watchdog, isn't
there? I've not yet seen a driver for it, nor have I seen any
documentation. Is there a watchdog (and possibly some docu or an hpux
vmunix to disassemble) so I could possibly write something better than
softdog.c?

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet!
   Shell Script APT-Proxy: http://lug-owl.de/~jbglaw/software/ap2/

--Tu8ztk+XgTAiG9Id
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+TTFMHb1edYOZ4bsRAjkxAJ9E/leCJ/b5NGVY/p3M42fZCMnzHACfZu0Q
qnAUICDNC44O7P+U6qPS6ec=
=m5fC
-----END PGP SIGNATURE-----

--Tu8ztk+XgTAiG9Id--
