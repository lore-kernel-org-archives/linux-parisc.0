Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dvmwest.gt.owl.de (dvmwest.gt.owl.de [62.52.24.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 53D7D4829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 May 2003 16:04:17 -0600 (MDT)
Date: Sat, 10 May 2003 00:04:16 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
Message-ID: <20030509220416.GA27494@lug-owl.de>
References: <20030507154817.GH27494@lug-owl.de> <3EB772D800000C9F@ocpmta2.freegates.net> <20030507171734.GG23465@tausq.org> <20030507175155.GJ27494@lug-owl.de> <20030509103745.H20047@neep.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IuxWNXB0+C4YKz9o"
In-Reply-To: <20030509103745.H20047@neep.com.au>
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

--IuxWNXB0+C4YKz9o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-05-09 10:37:47 +0800, Andrew Shugg <andrew@neep.com.au>
wrote in message <20030509103745.H20047@neep.com.au>:
> Jan-Benedict Glaw said:
> > Thanks. This reminds me that I'd still *love* to see the CVS repository
> > rsync'able. That'd really help me. However, it's at least nice to be
> > basically able to rsync the checked-out source trees.
> >=20
> > Any chances for a rsync for the CVS repo?
> >=20
> > MfG, JBG
>=20
> I'm not sure why you'd want to be able to rsync the entire repository,
> unless you want to be able to track multiple branches of a module
> without having to have a full checkout of each one?  That would make
> more sense I guess, if you live in a world where the Internet is slow
> and bandwidth is not free (I live there too, small world!).

It's even good for looking at older revisions of files without being
online.

> There is already an rsync server running on ftp.parisc-linux.org, but I
> don't believe it's widely advertised.

I do already use it.

> I'll have a trundle through it myself today, to see if I can write a
> helpful motd for rsyncd and suggest how the ::pub module can be split up
> into more useful bits.  (Bame, may I assume that you're still nominally
> in charge of the rsyncd server?)

The "pub" module is nice as it is just right now, but I'd love to see
the CVS repository directory (/var/cvs ?) also there:)

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
      ret =3D do_actions((curr | FREE_SPEECH) & ~(IRAQ_WAR_2 | DRM | TCPA));

--IuxWNXB0+C4YKz9o
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+vCXfHb1edYOZ4bsRAlIWAKCIjpOmkNxvXKUqhNKtm3NIWHGl3wCfWcSp
78uQjBQ9Tte9neWVcAyAXKA=
=VIPN
-----END PGP SIGNATURE-----

--IuxWNXB0+C4YKz9o--
