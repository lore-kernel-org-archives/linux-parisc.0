Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C9864874
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Sep 2003 08:26:18 -0600 (MDT)
Date: Thu, 4 Sep 2003 16:26:17 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel crash with 2.6.0-test4-pa8 on 715/100
Message-ID: <20030904142616.GT14376@lug-owl.de>
References: <3F5728AB.3040501@hrzpub.tu-darmstadt.de> <20030904140615.GN18654@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="acY8GN8fvSPNWryy"
In-Reply-To: <20030904140615.GN18654@parcelfarce.linux.theplanet.co.uk>
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

--acY8GN8fvSPNWryy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-09-04 15:06:15 +0100, Matthew Wilcox <willy@debian.org>
wrote in message <20030904140615.GN18654@parcelfarce.linux.theplanet.co.uk>:
> On Thu, Sep 04, 2003 at 01:57:31PM +0200, Ruediger Scholz wrote:
> > I tried to boot 2.6.0-test4-pa8 on my HP 715/100, but it crashed right=
=20
> > after the message "Freeing unused kernel memory...". I'm using debian=
=20
> > testing with devfs and gcc-3.3.1.
> > I think the pb is devfs, so I will try to boot a kernel without it.
> > Bootlog is attached, Config, System.map is here:=20
> > http://rscholz.bluehash.de/parisc
>=20
> I'm seeing the same thing on my 712 without devfs.  Not sure what the
> problem is, and I'm having a hard time getting that box back up as it has
> a broken root filesystem (damn tar for being linked against libpthread!)

Hmmm... My 712/60 works flawlessly:

jbglaw@hp712-1:~$ uname -a
Linux hp712-1 2.6.0-test4-pa8 #1 Wed Sep 3 19:16:42 CEST 2003 parisc GNU/Li=
nux
jbglaw@hp712-1:~$ uptime
 16:22:22 up 16:58,  1 user,  load average: 0.23, 0.05, 0.02

However, I've not touched the keyboard since the box is standing
somewhere in my cellar and only used by network... Want to see my
=2Econfig?

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--acY8GN8fvSPNWryy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/V0uIHb1edYOZ4bsRAoBEAKCODwI871/Z9tX7ZmQ+9x6WSXbcNACcD7Fs
SzUHvJ+qeFJ1/H8SGCkRfgE=
=XPeU
-----END PGP SIGNATURE-----

--acY8GN8fvSPNWryy--
