Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 385B34830
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 May 2003 00:54:44 -0600 (MDT)
Date: Wed, 14 May 2003 08:54:43 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] build-tools bame
Message-ID: <20030514065443.GL27494@lug-owl.de>
References: <20030513222102.33F00482D@dsl2.external.hp.com> <20030513223902.GK27494@lug-owl.de> <20030513225022.GQ29534@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YrHeAUbOAX9OMs3W"
In-Reply-To: <20030513225022.GQ29534@parcelfarce.linux.theplanet.co.uk>
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

--YrHeAUbOAX9OMs3W
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-05-13 23:50:22 +0100, Matthew Wilcox <willy@debian.org>
wrote in message <20030513225022.GQ29534@parcelfarce.linux.theplanet.co.uk>:
> On Wed, May 14, 2003 at 12:39:02AM +0200, Jan-Benedict Glaw wrote:
> > ...as if you had read my thoughts, I'm currently planing a roadmap for
> > pushing all ports upstream to Linus and looking for what work I could
> > do. Please read it at http://www.lug-owl.de/~jbglaw/linux-ports/ and
> > comment on it!
>=20
> I think pretty much every architecture on your `really small userbase'
> list would take issue with being placed there.  In particular, I think
> PPC is the second-largest Linux userbase after x86.

I'm not looking for "mainstream" parts (like current PowerMACs) but for
the ports/boards which are problematic. And some of the rare boards *do*
have problems. For MIPS, even some boards got removed some time ago and
there are more which may follow. So please, don't get me wrong here.
Some boards do work quite good most og the time (taking current port's
source trees), some do not. Simply take it as "PeeCee is less bug prone
than my super-rare MIPS/PPC/whatever eval board".

> The PA-RISC port doesn't have much in the way of tweaks to common drivers.

"Not much" means there are some. These should go upstream at some time,
or we may need to get a better way to deal with specific things. As the
(E)ISA bus in Indigo2 is getting available, there may be some things
that need to get cleaned up in ISA code. Soma counts here...

> I don't understand why you say for 2.4:
>=20
> "Nearly up to date, many patches need to go upstream"

Everything synced up (maybe except yesterday's work)?

> and for 2.5:
>=20
> "Not really up to date, but not far away; some work needs to be done..."

Well, I think it's basically about accepting or not accepting the fact
that some archs/boards are being developed without syncing "too early"
with upstream. This leads to:

	- I need to have more than one source tree laying around.
	- Unintended breakages show up too late.
	- Unintended conflicts may arise from syncing up later than
	  "now".

For me, I'd like to have _one_ tree which works in all situations
(except yesterday's work...). While whining for that, I'm also asking
for hints what _I_ can do to make this happen. Parisc is even one of the
more "simpler" ports to sync up...

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--YrHeAUbOAX9OMs3W
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+wegzHb1edYOZ4bsRAi8MAJ94NS8KULmirKv/k4STopd++Vi+nQCbBjrL
Pd+FMfT6NUkWFQF16WZMNJs=
=kDwz
-----END PGP SIGNATURE-----

--YrHeAUbOAX9OMs3W--
