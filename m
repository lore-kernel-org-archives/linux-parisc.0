Received: from phnxpop5.phnx.uswest.net (phnxpop5.phnx.uswest.net [206.80.192.5])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA12801
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 18:48:27 -0700
Date: Tue, 21 Nov 2000 18:50:24 -0700
From: Randolph Chung <randolph@tausq.org>
To: "Paul J.Y. Lahaie" <pjlahaie@linuxcare.com>
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] Fun build problems
Message-ID: <20001121185024.E576@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20001121164148.H912@achilles.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
In-Reply-To: <20001121164148.H912@achilles.net>; from pjlahaie@linuxcare.com on Tue, Nov 21, 2000 at 04:41:48PM -0500
List-ID: <linux-parisc.vger.kernel.org>


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Seeing as apt was broken, I decided to download the woody version of apt =
so
> I can get a newer version and hopefully skip some steps in building the
> above packages.  gcc 2.96 and apt-0.3.19 don't get along, so I tried pick=
ing
> it up from cvs (supposed to have been fixed).  Follow the directions on
> cvs.debian.org
>=20
> $ cvs -d :pserver:anonymous@cvs.debian.org:/cvs/APT login
> (Logging in to anonymous@cvs.debian.org)
> CVS password:=20
> cvs login: authorization failed: server cvs.debian.org rejected access

Try:

cvs -d:pserver:anonymous@cvs.debian.org:/cvs/deity login
(empty password)

It should work. if not let me know and i can mail you a tarball. You
probably want to get the aliencode branch, which has hppa patches. Let
me know if you run into any problems.

> rsync -- ldd crashes on dpkg-shlibdepends stage
> Can I just manually put the required dependancies in?

Yes, or pick up the dpkg-architecture and dpkg-shlibdeps scripts from
http://puffin.external.hp.com/~tausq/, or wait for the next version of
dpkg to get built for hppa (it doesn't use ldd anymore)

> autoconf -- installinfo spins
>=20
> When installing the autoconf package (to compile dpkg) installinfo spins.
> And after several minutes still doesn't return.  It's taking up 100% cpu
> at the time.

hmmm.. didn't see this. I had built a slightly older version of dpkg
successfully.

randolph (tausq@debian.org)
--=20
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6GyZgULspdC1Zp9IRAozyAKC/Df1fexltMjFlcwpeYlD+IIWEigCgiGyT
YKOjLA0BQzMo7qOj8jC1BTI=
=whh1
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
