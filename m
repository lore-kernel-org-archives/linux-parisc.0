From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [parisc-linux] A couple of questions
Date: Wed, 12 May 2004 08:59:59 +0200
Message-ID: <20040512065959.GM1912@lug-owl.de>
References: <000a01c437a4$c0d70de0$6401a8c0@nwoods>
Mime-Version: 1.0
Content-Type: multipart/mixed;
  boundary="===============1894516987=="
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <000a01c437a4$c0d70de0$6401a8c0@nwoods>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


--===============1894516987==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h3BncCmUfYp8450W"
Content-Disposition: inline


--h3BncCmUfYp8450W
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-05-11 18:10:04 -0400, Nathaniel Woods <nwoods29321@chater.net>
wrote in message <000a01c437a4$c0d70de0$6401a8c0@nwoods>:
> First off,  I am using an HP 9000/720.
> 1. How do I configure XFree86 to use my vid card? I know I must us FBdev =
but it always tells me "Addscreen/Screeninit failed for driver 0"

1. Please supply the "dmesg" command output to first of all let's see if
your video subsystem works properly.

2. Please supply the full /var/log/XFree86.0.log

> 2. When trying to access the floppy (which is at /dev/sda) the system cra=
shes. How do I fix this?

Are there any messages? Yes? Which ones? If in doubt, better send too
much than too little...

> 3. There is a built in audio port. How do I configure it?

What kernel version do you have? It's probably the harmony driver, but
it's (currently) kind of broken:)

MfG, JBG

--=20
   Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481
   "Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg
    fuer einen Freien Staat voll Freier B=FCrger" | im Internet! |   im Ira=
k!
   ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TC=
PA));

--h3BncCmUfYp8450W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAoctvHb1edYOZ4bsRAj4tAJ0ayWjlESuA+d6j8qYLG4zIl6hTYgCfd/gz
iMYlLqY2OnjVhaMLgDQSUcY=
=TicZ
-----END PGP SIGNATURE-----

--h3BncCmUfYp8450W--

--===============1894516987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--===============1894516987==--
