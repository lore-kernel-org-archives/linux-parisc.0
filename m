Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id F2F75483F
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Aug 2003 09:02:57 -0600 (MDT)
Date: Fri, 8 Aug 2003 17:02:56 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] adding a second nic to B1000
Message-ID: <20030808150256.GX1873@lug-owl.de>
References: <20030807110141.25427.h020.c009.wm@mail.canada.com.criticalpath.net> <3F335550.3030804@tiscali.be>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LjVoae4kcYbOEAMC"
In-Reply-To: <3F335550.3030804@tiscali.be>
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

--LjVoae4kcYbOEAMC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-08-08 07:46:24 +0000, Joel Soete <joel.soete@tiscali.be>
wrote in message <3F335550.3030804@tiscali.be>:
> geos@canada.com wrote:

> But to load modules, they have to be build for the kernel you are=20
> running (I think that will change in 2.6). So the only  think to do now=
=20

I'm quite sure that won't change, ever. Linux, if it's compatible to
itself at all, has got "only" a source compatible API. You're somewhat
on a more save side if you're using symbol versioning, but if you force
a module to load (into a kernel of different version or even of
different configuration), you may loose. Right now or sometime later:)

That's what "tainting" was ment for:)

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--LjVoae4kcYbOEAMC
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/M7ugHb1edYOZ4bsRAqn4AJ41MqzSysgVj6LA+j9U1DxY0NVqUgCeLQxa
DkcfArCl0N6eXwiNzszux1M=
=uOAX
-----END PGP SIGNATURE-----

--LjVoae4kcYbOEAMC--
